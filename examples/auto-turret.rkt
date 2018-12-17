#lang ts-game-jam-1

; ==== GENERIC FUNCTIONS ====
; todo: add to game-engine or ts-fornite-game-jam?
(define (custom-bullet #:sprite [s (rectangle 10 2 "solid" "green")]
                       #:speed  [spd 10]
                       #:damage [dmg 10])
  (sprite->entity s
                  #:name       "Bullet"
                  #:position   (posn 20 0)
                  #:components (physical-collider)
                               (direction 0)
                               (damager dmg)
                               (rotation-style 'face-direction)
                               (hidden)
                               (on-start show)
                               (speed spd)
                               (every-tick (move))
                               (on-collide "Enemy" die)
                               (on-collide "Pine Tree Trunk" die)
                               (on-edge 'top die)
                               (on-edge 'bottom die)
                               (on-edge 'left die)
                               (on-edge 'right die)))

(define (tower-bullet)
  (update-entity (custom-bullet #:sprite (scale 0.5 (beside (rotate 90 (triangle 6 "solid" "orange"))
                                                            (rectangle 5 10 "solid" "gray")
                                                            (rectangle 16 6 "solid" "gray")
                                                            (rotate -90 (triangle 12 "solid" "red"))))
                                #:damage 80)
                 posn?
                 (posn 0 -80)))

(define (active-on-current g e)
  (add-components e (active-on-bg (game->current-tile g))))

(define (mouse-button-is-down? button)
  (lambda (g e)
    (mouse-button-down? button g)))

(define (key-is-down? key)
  (lambda (g e)
    (button-down? key g)))

(define (weapon-slot? s)
  (lambda (g e)
    (define current-slot (get-storage-data "Weapon Slot" e))
    (eq? current-slot s)))

(define (set-storage-named key-name data)
  (lambda (g e)
    (set-storage key-name e data)))

(define (custom-weapon #:slot              [slot #f]
                       #:bullet            [b (custom-bullet)]
                       #:fire-mode         [fm 'normal]
                       #:fire-rate         [fr 3]
                       #:fire-key          [key 'f]
                       #:mouse-fire-button [button #f]
                       #:rapid-fire? [rf?     #t])
  (define fire-interval (max 1 (/ 30 fr)))
  (define fire-rule (if button
                        (and/r (mouse-button-is-down? button)
                               (not/r health-is-zero?)
                               (or/r (λ (g e) (eq? slot #f))
                                     (weapon-slot? slot)))
                        (and/r (key-is-down? key)
                               (not/r health-is-zero?)
                               (or/r (λ (g e) (eq? slot #f))
                                     (weapon-slot? slot)))))
  (cond
    [(eq? rf?    #t) (if button
                         (do-every fire-interval #:rule fire-rule (shoot #:bullet (add-components b (on-start #:rule mouse-in-game? point-to-mouse))
                                                                         #:fire-mode fm))
                         (do-every fire-interval #:rule fire-rule (shoot #:bullet b
                                                                         #:fire-mode fm)))]
    [(not button) (on-key   key    #:rule fire-rule (shoot #:bullet b
                                                           #:fire-mode fm))]
    [else         (on-mouse button #:rule fire-rule (shoot #:bullet (add-components b (on-start #:rule mouse-in-game? point-to-mouse))
                                                           #:fire-mode fm))]))

(define (weapon->turret c)
  (cond [(do-every? c) (struct-copy struct-do-every c [rule (near? "Enemy" 120)])]
        [(on-key?   c) (struct-copy struct-on-key   c [rule (near? "Enemy" 120)])]
        [(on-mouse? c) (struct-copy struct-on-mouse c [rule (near? "Enemy" 120)])]
        ))

(define (shoot #:bullet [b (custom-bullet)] #:fire-mode [fm 'normal])
  (lambda (g e)
    ((cond [(eq? fm 'normal) (spawn b)]
           [(eq? fm 'homing) (let ([homing-bullet (~> b
                                                      (update-entity  _ speed? (speed 5))
                                                      (add-components _ (follow "Enemy")
                                                                        (after-time 1000 die)))])
                               (spawn homing-bullet))]
           [(eq? fm 'random) (let ([random-bullet (add-components b (on-start (change-direction-by-random -15 15)))])
                               (spawn random-bullet))]
           [(eq? fm 'spread) (let ([top-bullet    (~> b
                                                      (update-entity  _ speed? (speed 20))
                                                      (add-components _ (on-start (change-direction-by -10))
                                                                        (after-time 10 die)))]
                                   [middle-bullet (~> b
                                                      (update-entity  _ speed? (speed 20))
                                                      (add-components b (after-time 10 die)))]
                                   [bottom-bullet (~> b
                                                      (update-entity  _ speed? (speed 20))
                                                      (add-components b (on-start (change-direction-by 10))
                                                                    (after-time 10 die)))])
                               (do-many (spawn top-bullet)
                                        (spawn middle-bullet)
                                        (spawn bottom-bullet)
                                        (spawn top-bullet)
                                        (spawn middle-bullet)
                                        (spawn bottom-bullet)))]) g e)))

; ===== GAME DEFINITIONS ====
(define (enemy-npc)
  (combatant #:damage-processor (divert-damage)
             (custom-npc #:name "Enemy"
              #:position (posn 400 300)
              #:mode 'wander
              #:components ;(health 100)
                           (on-rule (λ(g e)
                                    (<= (get-storage-data "health-stat" e) 0)) die)
                           (movable)
                           (hidden)
                           (on-start (do-many (respawn 'anywhere)
                                              ;(active-on-random)
                                              show))
                           )))

(define (sword)
  (sprite->entity (rotate 90 (overlay/offset
                              (overlay/offset (rectangle 30 4 "solid" "gray")
                                              -8 0
                                              (rectangle 4 10 "solid" "darkgray"))
                              -30 0
                              (rectangle 30 10 "solid" "transparent")))
                  #:name       "Sword"
                  #:position   (posn 10 0)
                  #:components (physical-collider)
                               (direction 270)
                               (damager 50)
                               (rotation-style 'face-direction)
                               (hidden)
                               (on-start show)
                               (every-tick (change-direction-by 15))
                               (after-time 10 die)))

(define (flame)
  (sprite->entity (overlay (circle 5 "solid" "yellow")
                           (circle 6 "solid" "orange")
                           (circle 7 "solid" "red"))
                  #:name       "Flame"
                  #:position   (posn 25 0)
                  #:components (physical-collider)
                               (direction 0)
                               (damager 5)
                               (speed 3)
                               (rotation-style 'face-direction)
                               (hidden)
                               (on-start (do-many (set-size 0.5)
                                                  show))
                               (every-tick (do-many (move)
                                                    (scale-sprite 1.1)))
                               (after-time 15 die)))

(define (rocket-tower)
  (define size 50)
  (define (gridify-posn p)
    (posn (*
           size (round (/ (posn-x p) size)))
          (* size (round (/ (posn-y p) size)))))
  
  (define (lock-to-grid g e)
    (update-entity e
                   posn?
                   (gridify-posn
                    (get-component e posn?))))

  (define tower-base (overlay/offset 
                      (rectangle 32 24 "solid" "dimgray")
                      0 8
                      (ellipse 50 24 "solid" (make-color 0 0 0 120))))
  
  (define tower-top (above (beside (square 8 "solid" "darkslategray")
                                   (square 8 "solid" "transparent")
                                   (square 8 "solid" "darkslategray")
                                   (square 8 "solid" "transparent")
                                   (square 8 "solid" "darkslategray"))
                         (rectangle 40 10 "solid" "darkslategray")
                         (rectangle 32 32 "solid" "dimgray")))
  
  (precompile! tower-base
               tower-top
               (tower-bullet))

  (define tower-top-entity
    (sprite->entity tower-top
                    #:name "Tower Top"
                    #:position (posn 0 -40)
                    #:components (layer "tops")
                                 (active-on-bg 0)
                                 (on-start active-on-current)))
  
  (sprite->entity tower-base
                  #:name       "Rocket Tower"
                  #:position   (posn 0 0)
                  #:components (physical-collider)
                               (static)
                               (direction 0)
                               (active-on-bg 0)
                               (on-start (do-many active-on-current
                                                  lock-to-grid
                                                  (spawn tower-top-entity)))
                               (every-tick (point-to "Enemy"))
                               (weapon->turret
                                (custom-weapon #:bullet (tower-bullet)
                                               #:fire-mode 'homing
                                               #:fire-rate 5))))
                               
(define (port-a-tower)
  (precompile! (circle 10 "solid" "blue"))
  (sprite->entity (circle 10 "solid" "blue")
                  #:name       "Port-A-Tower"
                  #:position   (posn 20 0)
                  #:components (physical-collider)
                               (direction 0)
                               (speed 3)
                               (rotation-style 'face-direction)
                               (hidden)
                               (on-start show)
                               (every-tick (move))
                               (after-time 30 (do-many (spawn (rocket-tower))
                                                       (do-after-time 1 die)))))

(define (weapon-backpack #:slots [slots 1])
  (define (slot->on-key num)
    (on-key num (set-storage-named "Weapon Slot" num)))
  (list (storage "Weapon Slot" 1)
        (map slot->on-key (range 1 (add1 slots)))))

(define (my-avatar)
  (custom-avatar #:sprite     (row->sprite (random-character-row) #:delay 4)
                 #:key-mode   'wasd
                 #:mouse-aim?  #t
                 #:components (precompiler (custom-bullet)
                                           (sword)
                                           (flame))        ;todo: automate this whenever spawn is used
                              ;(on-mouse 'left (shoot #:fire-mode 'spread))
                              #|(storage "Weapon Slot" 1)
                              (on-key 1 (set-storage-named "Weapon Slot" 1))
                              (on-key 2 (set-storage-named "Weapon Slot" 2))
                              (on-key 3 (set-storage-named "Weapon Slot" 3))
                              (on-key 4 (set-storage-named "Weapon Slot" 4))
                              (on-key 5 (set-storage-named "Weapon Slot" 5))
                              (on-key 6 (set-storage-named "Weapon Slot" 6))
                              (on-key 7 (set-storage-named "Weapon Slot" 7))|#
                              (weapon-backpack #:slots 7)
                              (on-key 'n (spawn (enemy-npc)))
                              (custom-weapon #:slot 1 #:mouse-fire-button 'left)
                              (custom-weapon #:slot 2 #:mouse-fire-button 'left #:fire-mode 'random #:fire-rate 10)
                              (custom-weapon #:slot 3 #:mouse-fire-button 'left #:fire-mode 'spread #:rapid-fire? #f)
                              (custom-weapon #:slot 4 #:mouse-fire-button 'left #:fire-mode 'homing #:fire-rate 1.5)
                              (custom-weapon #:slot 5 #:mouse-fire-button 'left #:bullet (sword) #:rapid-fire? #f)
                              (custom-weapon #:slot 6 #:mouse-fire-button 'left #:bullet (flame) #:fire-mode 'random #:fire-rate 30)
                              (custom-weapon #:slot 7 #:mouse-fire-button 'left #:bullet (port-a-tower) #:rapid-fire? #f)
                              ))

(survival-game
 #:bg              (custom-background)
 #:avatar          (my-avatar)
 #:starvation-rate -1000
 #:npc-list        (list (entity-cloner enemy-npc 10))
 #:other-entities  (pine-tree (posn 300 100) #:tile 0)
                   (pine-tree (posn 300 100) #:tile 2)
                   (pine-tree (posn 200 100) #:tile 4))



