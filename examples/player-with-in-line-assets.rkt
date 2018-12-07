#lang ts-game-jam-1

(survival-game
 #:bg              (custom-background)
 #:avatar          (custom-avatar #:sprite (row->sprite (random-character-row)))
 #:starvation-rate 20
 ;#:length-of-day   1000
 ;#:enemy-list      (list (enemy #:entity (zombie-entity) #:amount-in-world 5 #:night-only? #t)
 ;                        (enemy #:entity (slime-entity)  #:amount-in-world 10 #:damage 5))
 #:npc-list        (list (random-npc #:mode 'wander #:speed 1)
                         (random-npc #:mode 'wander #:speed 3))
 #:coin-list       (list (coin #:entity (copper-coin-entity) #:value 10  #:amount-in-world 10 )
                         (coin #:entity (silver-coin-entity) #:value 50  #:amount-in-world 5  ))
 #:food-list       (list (food #:entity (carrot-entity)      #:amount-in-world 10)
                         (food #:entity (carrot-stew-entity) #:heals-by 20))
 #:crafter-list    (list (custom-crafter))
 #:other-entities  (pine-tree (posn 300 100) #:tile 0)
                   (pine-tree (posn 300 100) #:tile 2)
                   (pine-tree (posn 200 100) #:tile 4))
