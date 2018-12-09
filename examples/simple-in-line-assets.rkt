#lang ts-game-jam-1

(survival-game
 #:bg              (custom-background)
 #:avatar          (custom-avatar #:sprite (row->sprite (random-character-row)))
 #:starvation-rate 20
 #:npc-list        (list (custom-npc)
                         (custom-npc))
 #:coin-list       (list (custom-coin)
                         (custom-coin #:entity (copper-coin-entity) #:value 5))
 #:food-list       (list (custom-food #:amount-in-world 10)
                         (custom-food #:entity (carrot-stew-entity) #:heals-by 20))
 #:crafter-list    (list (custom-crafter))
 #:other-entities  (pine-tree (posn 300 100) #:tile 0)
                   (pine-tree (posn 300 100) #:tile 2)
                   (pine-tree (posn 200 100) #:tile 4))
