#lang ts-game-jam-1

(survival-game
 #:bg              (basic-background)
 #:player          (basic-player-entity (row->sprite (random-character-row)))
 #:starvation-rate 20
 #:npc-list        (list (random-npc #:mode 'wander) (random-npc #:mode 'wander))
 #:item-list       (list (coin-entity))
 #:food-list       (list (food #:entity (carrot-entity) #:amount-in-world 10)
                         (food #:entity (carrot-stew-entity) #:heals-by 20))
 #:crafter-list    (list (basic-crafter))
 #:other-entities  (pine-tree (posn 300 100) #:tile 0)
                   (pine-tree (posn 300 100) #:tile 2)
                   (pine-tree (posn 200 100) #:tile 4))
