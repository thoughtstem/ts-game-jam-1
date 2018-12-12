#lang ts-game-jam-1

(define (enemy-npc)
  (custom-npc #:name "Enemy"
              #:position (posn 400 300)
              #:mode 'wander
              #:components (health 100)
                           (movable)
                           (hidden)
                           (on-collide "Green Laser" (change-health-by -10))
                           (on-start (do-many (respawn 'anywhere)
                                              (active-on-random)
                                              show))
                           ))

(define (laser)
  (sprite->entity (rectangle 10 2 "solid" "green")
                  #:name       "Green Laser"
                  #:position   (posn 20 0)
                  #:components (physical-collider)
                               (direction 0)
                               (rotation-style 'face-direction)
                               (hidden)
                               (on-start (do-many show
                                                  point-to-mouse))
                               (speed 10)
                               (every-tick (move))
                               (on-collide "Enemy" die)
                               (on-collide "Pine Tree Trunk" die)
                               (on-edge 'top die)
                               (on-edge 'bottom die)
                               (on-edge 'left die)
                               (on-edge 'right die)))

(define (my-avatar)
  (custom-avatar #:sprite     (row->sprite (random-character-row) #:delay 4)
                 #:key-mode   'wasd
                 #:mouse-aim?  #t
                 #:components (precompiler (laser)) ;todo: automate this whenever spawn is used
                              (on-mouse      'left (spawn (laser)))
                              ;(on-mouse-hold 'left (spawn (laser))) ; this will spawn every tick
                              ))

(survival-game
 #:bg              (custom-background)
 #:avatar          (my-avatar)
 #:starvation-rate 0
 #:npc-list        (list (enemy-npc)
                         (enemy-npc)
                         (enemy-npc)
                         (enemy-npc)
                         (enemy-npc))
 #:other-entities  (pine-tree (posn 300 100) #:tile 0)
                   (pine-tree (posn 300 100) #:tile 2)
                   (pine-tree (posn 200 100) #:tile 4))
