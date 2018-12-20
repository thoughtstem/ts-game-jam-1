#lang racket

(require game-engine
         game-engine-demos-common
         "./survival-game-jam.rkt"
         "../scoring/score.rkt")

(provide battle-arena-game
         custom-weapon-entity
         spear
         sword
         paint

         custom-enemy
         )


(define (wander-but-defend #:weapon (weapon (custom-weapon))
                           #:range (range 150)
                           #:wander-speed (wspeed 1)
                           #:ticks-between-shots (ticks-between-shots 50))
  
  (define wander (apply state 'wander (wander-mode-components wspeed)))
  (define stand  (apply state 'stand (stand-and-shoot "follow" weapon
                                                      #:ticks-between-shots ticks-between-shots)))

  (define wander->stand
    (transition #:rule (near? "player" range)
                wander stand))

  (define stand->wander
    (transition #:rule (not/r (near? "player" range))
                stand wander))
  
  (define ai-machine
    (state-machine wander
                   (list wander stand)
                   (list wander->stand stand->wander)))

  ai-machine)

(define (wander-mode-components spd)
  (list 
   (every-tick (move))
   (speed spd)
   (do-every 50 (random-direction 0 360))
   (on-edge 'left   (set-direction 0))
   (on-edge 'right  (set-direction 180))
   (on-edge 'top    (set-direction 90))
   (on-edge 'bottom (set-direction 270))))

(define (stand-and-shoot target w #:ticks-between-shots (ticks-between-shots 50))
  (list (speed 0)
        (use-weapon-against-player w #:ticks-between-shots ticks-between-shots)
        (every-tick (point-to "player"))))



(define (get-ai-from-level l weapon)
  (match l
    ['easy   (wander-but-defend #:weapon weapon
                                #:range 100
                                #:ticks-between-shots 50
                                #:wander-speed 1)]
    ['medium (wander-but-defend #:weapon weapon
                                #:range 150
                                #:ticks-between-shots 25
                                #:wander-speed 2)]
    ['hard   (wander-but-defend #:weapon weapon
                                #:range 200
                                #:ticks-between-shots 10
                                #:wander-speed 3)]))





;NOt all of these work yet...
(define (custom-enemy #:amount-in-world (amount-in-world 10)
                      #:sprite (s (row->sprite (random-character-row) #:delay 4))
                      #:ai (ai-level 'easy)
                      #:health (health 100)
                      #:shield (shield 100)
                      #:weapon (weapon (custom-weapon))
                      #:death-particles (particles (custom-particles)))
 
  ;Makes sure that we can run (custom-enemy) through (entity-cloner ...)
  ;  Works because combatant ids get assigned at runtime.
  ;(Otherwise, they'd all end up with the same combatant id, and a shared healthbar)
  (define (become-combatant g e)

    (define c (~> e
                  (combatant
                   #:stats (default-health+shields-stats health shield)
                   #:damage-processor (divert-damage #:filter-out '(passive enemy-team))
                             _)
                  ))
 
    c)

  (define (die-if-health-is-0)
    (on-rule (λ(g e)
               (define h (get-storage-data "health-stat" e))
               (and h (<= h 0)))
             (do-many
              (spawn-on-current-tile particles)
              (λ(g e)
                (add-component e (after-time 2 die)))
              )))

  
  (custom-npc #:name "Enemy"
              #:sprite s
              #:position (posn 0 0)
              #:mode #f
              #:dialog (list (list))
              #:components 
              (die-if-health-is-0)
              (damager 10 (list 'passive 'enemy-team))
              (movable)
              (hidden)
              (on-start (do-many (respawn 'anywhere)
                                 show
                                 become-combatant))

              (storage "amount-in-world" amount-in-world)
                         
              (enemy-ai (get-ai-from-level ai-level weapon))  ))



; ===== GAME DEFINITIONS ====


(define (instructions-entity)
  (define bg (new-sprite (rectangle 1 1 'solid (make-color 0 0 0 100))))
  
  (define i
    (sprite->entity (~> bg
                        (set-x-scale 260 _)
                        (set-y-scale 150 _)
                        (set-y-offset 60 _))
                    #:position   (posn 0 0) ;(posn (/ (WIDTH) 2) 50)
                    #:name       "instructions"
                    #:components (layer "ui")
                                 (hidden)
                                 (on-start (do-many (go-to-pos-inside 'top-center)
                                                    show))
                                 (on-key 'enter die)
                                 (on-key 'space die)
                                 (on-key "i" die)))

    (add-components i
                  (new-sprite "ARROW KEYS to move"
                              #:y-offset 0 #:color 'yellow)
                  (new-sprite "F to shoot"
                              #:y-offset 20 #:color 'yellow)
                  (new-sprite "NUM KEYS to select weapon"
                              #:y-offset 40 #:color 'yellow)
                  (new-sprite "I to open these instructions"
                              #:y-offset 60 #:color 'yellow)
                  (new-sprite "Z to pick up items"
                              #:y-offset 80 #:color 'yellow)
                  (new-sprite "X to drop items"
                              #:y-offset 100 #:color 'yellow)))

; === WON AND LOST RULES ===
(define (won? g e)
  #f)

(define (lost? g e)
  (health-is-zero? g e))

(define (custom-weapon-entity #:name        [n "Weapon"]
                              #:sprite      [s chest-sprite]
                              #:bullet      [b (custom-bullet)]
                              #:fire-mode   [fm 'normal]
                              #:fire-rate   [fr 3]
                              #:fire-key    [key 'f]
                              #:mouse-fire-button [button #f]
                              #:rapid-fire?       [rf? #t]
                              #:rarity      [rarity 'common])
  (define weapon-component (custom-weapon #:bullet b
                                          #:fire-mode fm
                                          #:fire-rate fr
                                          #:fire-key  key
                                          #:mouse-fire-button button
                                          #:rapid-fire? rf?
                                          #:rule (and/r (weapon-is? n)
                                                        (in-backpack? n))))
  (sprite->entity s
                  #:name n
                  #:position    (posn 0 0)
                  #:components  (active-on-bg 0)
                                (physical-collider)
                                (storage "Weapon" weapon-component)
                                (static)
                                (hidden)
                                (on-start (do-many (respawn 'anywhere)
                                                   (active-on-random)
                                                   show))
                                (storable)))


(define (clone-by-amount-in-world es)
  (define (f e)
    (define to-clone (if (procedure? e)
                         (e)
                         e) )
    
    (define n (if (get-storage "amount-in-world" to-clone)
                  (get-storage-data "amount-in-world" to-clone)
                  1))
    (entity-cloner to-clone n))

  (map f es))

(define (battle-arena-game #:bg             [bg-ent (custom-background)]
                           #:avatar         [p (custom-avatar)]
                           #:enemy-list     [e-list (list (custom-enemy))]
                           #:weapon-list    [weapon-list '()]
                           #:other-entities [ent #f]
                                          . custom-entities)

  (define (weapon-entity->player-system e)
    (get-storage-data "Weapon" e))
    
  (define player-with-weapons
    (add-components p (weapon-selector #:slots 3)
                      (map weapon-entity->player-system weapon-list)))

  (define (add-random-start-pos e)
    (define world-amt (get-storage-data "amount-in-world" e))
    (if (> world-amt 0) 
        (add-components e (hidden)
                          (on-start (do-many (active-on-random)
                                             (respawn 'anywhere)
                                             show)))
        e))
  
  (define (health-entity)
    (define max-health 100)
    (define e (health-bar-entity #:max 100
                                 #:starvation-period #f))
    (~> e
        (update-entity _ posn? (posn 100 20))))

  (define (enemy-counter-entity)
    (define bg (~> (rectangle 1 1 'solid (make-color 0 0 0 100))
                   (new-sprite _ #:animate #f)
                   (set-x-scale 100 _)
                   (set-y-scale 14 _)
                   ))
    
    (sprite->entity bg
                    #:name       "score"
                    #:position   (posn 380 20)
                    #:components (static)
                                 (new-sprite "Enemies Left: 30" #:y-offset -7 #:scale 0.7 #:color 'yellow)
                                 (counter 30)
                                 (layer "ui")))
 
  (define es (filter identity
                     (flatten
                      (list
                       (instructions-entity)
                       (if p (game-over-screen won? health-is-zero?) #f)
                       (if p (enemy-counter-entity) #f)

                       (if p (health-entity) #f)

                       player-with-weapons
              
              
                       (pine-tree (posn 400 140) #:tile 2 (damager 5 (list 'passive)))
                       (pine-tree (posn 93 136)  #:tile 4 (damager 5 (list 'passive)))
                       (round-tree (posn 322 59) #:tile 4 (damager 5 (list 'passive)))

                       (map (λ (w) (entity-cloner w 3)) weapon-list)

                       (clone-by-amount-in-world (flatten e-list))

                       (cons ent custom-entities)
              
                       bg-ent))))

  (displayln (~a "Score estimation for your game: " (score-game es)))
  
  (apply start-game es))

; ==== PREBUILT BULLETS ====
(define (spear #:sprite     [s spear-bullet-sprite]
               #:damage     [dmg 50]
               #:durability [dur 20]
               #:speed      [spd 5]
               #:range      [rng 20])
  (custom-bullet #:position (posn 20 0)
                 #:sprite spear-bullet-sprite
                 #:damage dmg
                 #:durability dur
                 #:speed spd
                 #:range rng
                 #:components (after-time (/ rng 2) (do-many (bounce)
                                                             (horizontal-flip-sprite)))))

(define (sword #:sprite     [s swinging-sword-sprite]
               #:damage     [dmg 50]
               #:durability [dur 20]
               #:speed      [spd 0]
               #:range      [rng 10])
  (custom-bullet #:position (posn 10 0)
                 #:sprite     s
                 #:damage     dmg
                 #:durability dur
                 #:speed      spd
                 #:range      rng
                 #:components (every-tick (change-direction-by 15))))

(define (paint #:sprite     [s   paint-sprite]
               #:damage     [dmg 5]
               #:durability [dur 5]
               #:speed      [spd 3]
               #:range      [rng 15])
  (custom-bullet #:position (posn 25 0)
                 #:sprite     s
                 #:damage     dmg
                 #:durability dur
                 #:speed      spd
                 #:range      rng
                 #:components (on-start (set-size 0.5))
                              (every-tick (scale-sprite 1.1))))


(module+ test
  (battle-arena-game
   #:bg              (custom-background)
   #:avatar          (custom-avatar #:sprite      (row->sprite (random-character-row))
                                    #:key-mode    'wasd
                                    #:mouse-aim?  #t)
   #:weapon-list     (list (custom-weapon-entity #:name "Light Repeater" #:mouse-fire-button 'left #:fire-mode 'random #:fire-rate 10)
                           (custom-weapon-entity #:name "Spread Shot"    #:mouse-fire-button 'left #:fire-mode 'spread #:rapid-fire? #f))))

