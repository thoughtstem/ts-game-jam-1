#lang ts-game-jam-1

(survival-game
 #:bg              (custom-background)
 #:avatar          (custom-avatar #:sprite (row->sprite (random-character-row)))
 #:starvation-rate 20
 ;#:length-of-day   1000
 ;#:enemy-list      (list (enemy #:entity (zombie-entity) #:amount-in-world 5 #:night-only? #t)
 ;                        (enemy #:entity (slime-entity)  #:amount-in-world 10 #:damage 5))
 #:npc-list        (list (custom-npc  #:position (posn 200 300)
                                      #:tile     3
                                      #:mode     'pace
                                      #:speed     1)
                         (custom-npc  #:position (posn 100 100)
                                      #:tile     5
                                      #:mode     'wander
                                      #:speed    3))
 #:coin-list       (list (custom-coin #:entity (copper-coin-entity)
                                      #:value 50
                                      #:amount-in-world 10)
                         (custom-coin #:entity (silver-coin-entity)
                                      #:value 100
                                      #:amount-in-world 5))
 #:food-list       (list (custom-food #:entity (carrot-entity)
                                      #:amount-in-world 10)
                         (custom-food #:entity (carrot-stew-entity)
                                      #:heals-by 20))
 #:crafter-list    (list (custom-crafter #:position   (posn 100 300)
                                         #:components (movable)))
 #:other-entities  (pine-tree (posn 300 100) #:tile 0)
                   (pine-tree (posn 300 100) #:tile 2)
                   (pine-tree (posn 200 100) #:tile 4))
