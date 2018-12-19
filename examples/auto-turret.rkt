#lang ts-game-jam-1

(define (rocket-bullet)
  (custom-bullet #:position (posn 0 -70)
                 #:sprite   (scale 0.5 (beside (rotate 90 (triangle 6 "solid" "orange"))
                                               (rectangle 5 10 "solid" "gray")
                                               (rectangle 16 6 "solid" "gray")
                                               (rotate -90 (triangle 12 "solid" "red"))))
                 #:damage 200
                 #:range 400
                 #:durability 30))

(define (active-on-current g e)
  (add-components e (active-on-bg (game->current-tile g))))

; ===== GAME DEFINITIONS ====
(define (enemy-npc)
  (combatant #:damage-processor (divert-damage #:filter-out 'passive)
             (custom-npc #:name "Enemy"
                         #:position (posn 400 300)
                         #:mode 'wander
                         #:components ;(health 100)
                         (on-rule (λ(g e)
                                    (<= (get-storage-data "health-stat" e) 0)) die)
                         (damager 10 (list 'passive))
                         (movable)
                         (hidden)
                         (on-start (do-many (respawn 'anywhere)
                                            ;(active-on-random)
                                            show))
                         )))

(define (sword)
  (custom-bullet #:position (posn 10 0)
                 #:sprite   (rotate 90 (overlay/offset
                                        (overlay/offset (rectangle 30 4 "solid" "gray")
                                                        -8 0
                                                        (rectangle 4 10 "solid" "darkgray"))
                                        -30 0
                                        (rectangle 30 10 "solid" "transparent")))
                 #:damage 50
                 #:speed  0
                 #:range  10
                 #:components (every-tick (change-direction-by 15))))

(define (flame)
  (custom-bullet #:position   (posn 25 0)
                 #:sprite     (overlay (circle 5 "solid" "yellow")
                                       (circle 6 "solid" "orange")
                                       (circle 7 "solid" "red"))
                 #:damage     5
                 #:durability 5
                 #:speed      3
                 #:range      15
                 #:components (on-start (set-size 0.5))
                              (every-tick (scale-sprite 1.1))))

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
               (rocket-bullet))

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
                                (custom-weapon #:bullet (rocket-bullet)
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
                               (after-time 30 (do-many (spawn-on-current-tile rocket-tower)
                                                       (do-after-time 1 die)))))

(define (my-avatar)
  (custom-avatar #:sprite     (row->sprite (random-character-row) #:delay 4)
                 #:key-mode   'wasd
                 #:mouse-aim?  #t
                 #:components (precompiler (custom-bullet)
                                           (sword)
                                           (flame))        ;todo: automate this whenever spawn is used
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
 #:npc-list        (list (entity-cloner enemy-npc 2))
 #:other-entities  (pine-tree (posn 100 100) #:tile 0 #:components (damager 4 (list 'passive)))
                   (pine-tree (posn 200 100) #:tile 0 #:components (damager 4 (list 'passive)))
                   (pine-tree (posn 300 100) #:tile 0 #:components (damager 4 (list 'passive))))

