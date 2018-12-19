#lang ts-game-jam-1



(define (wander-but-defend w)
  (define wander (apply state 'wander (wander-mode-components 1)))
  (define follow (apply state 'follow (follow-mode-components "follow" 2 w)))

  (define wander->follow
    (transition #:rule (near? "player" 150)
                wander follow))

  (define follow->wander
    (transition #:rule (not/r (near? "player" 150))
                follow wander))
  
  (define ai-machine
    (state-machine wander
                   (list wander follow)
                   (list wander->follow follow->wander)))

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

(define (follow-mode-components target spd w)
  (list (speed 0)
        (use-weapon-against-player w)
        (every-tick (point-to "player"))
        (follow target)))

 


(define (rocket-bullet)
  (custom-bullet #:position (posn 0 -70)
                 #:sprite   (scale 0.5 (beside (rotate 90 (triangle 6 "solid" "orange"))
                                               (rectangle 5 10 "solid" "gray")
                                               (rectangle 16 6 "solid" "gray")
                                               (rotate -90 (triangle 12 "solid" "red"))))
                 #:damage 200
                 #:range 400
                 #:durability 30))

; ===== GAME DEFINITIONS ====
(define (enemy-npc)
  (combatant #:damage-processor (divert-damage #:filter-out '(passive enemy-team))
             (custom-npc #:name "Enemy"
                         #:position (posn 400 300)
                         #:mode #f
                         #:components ;(health 100)
                         (on-rule (λ(g e)
                                    (<= (get-storage-data "health-stat" e) 0)) die)
                         (damager 10 (list 'passive 'enemy-team))
                         (movable)
                         (hidden)
                         (on-start (do-many (respawn 'anywhere)
                                            show))
                         (enemy-ai (wander-but-defend (custom-weapon))
                          )  )))


(define (my-avatar)
  (combatant #:damage-processor (divert-damage #:filter-out '(passive))
   (custom-avatar #:sprite     (row->sprite (random-character-row) #:delay 4)
                  #:key-mode   'wasd
                  #:mouse-aim?  #t
                  #:components (precompiler (custom-bullet))        ;todo: automate this whenever spawn is used
                  (weapon-backpack #:slots 7)
                  (on-key 'n (spawn (enemy-npc)))
                  (custom-weapon #:slot 1 #:mouse-fire-button 'left)
                  (custom-weapon #:slot 2 #:mouse-fire-button 'left #:fire-mode 'random #:fire-rate 10)
                  (custom-weapon #:slot 3 #:mouse-fire-button 'left #:fire-mode 'spread #:rapid-fire? #f)
                  (custom-weapon #:slot 4 #:mouse-fire-button 'left #:fire-mode 'homing #:fire-rate 1.5)
                  )))

(survival-game
 #:bg              (custom-background)
 #:avatar          (my-avatar)
 #:starvation-rate -1000
 #:npc-list        (list (entity-cloner enemy-npc 1))
 #:other-entities  (pine-tree (posn 100 100) #:tile 0 #:components (damager 4 (list 'passive)))
                   (pine-tree (posn 200 100) #:tile 0 #:components (damager 4 (list 'passive)))
                   (pine-tree (posn 300 100) #:tile 0 #:components (damager 4 (list 'passive))))

