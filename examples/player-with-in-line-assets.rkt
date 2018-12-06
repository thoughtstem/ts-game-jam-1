#lang ts-game-jam-1

; Create a surivival game that spawns
(survival-game
 #:bg              (custom-background)
 #:avatar          (custom-avatar #:sprite (row->sprite (random-character-row)))
 #:starvation-rate 20
 ;#:length-of-day   1000
 ;#:enemy-list      (list (enemy #:entity (zombie-entity) #:amount-in-world 5 #:night-only? #t)
 ;                        (enemy #:entity (slime-entity)  #:amount-in-world 10))
 #:npc-list        (list (random-npc #:mode 'wander #:speed 1)
                         (random-npc #:mode 'wander #:speed 3))
 #:item-list       (list (coin-entity))
 #:food-list       (list (food #:entity (carrot-entity)      #:amount-in-world 10)
                         (food #:entity (carrot-stew-entity) #:heals-by 20))
 #:crafter-list    (list (custom-crafter))
 #:other-entities  (pine-tree (posn 300 100) #:tile 0)
                   (pine-tree (posn 300 100) #:tile 2)
                   (pine-tree (posn 200 100) #:tile 4))
