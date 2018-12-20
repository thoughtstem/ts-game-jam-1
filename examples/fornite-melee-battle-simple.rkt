#lang ts-game-jam-1

(battle-arena-game
   #:weapon-list (list (custom-weapon-entity #:name        "Spear"
                                             #:sprite      spear-sprite
                                             #:bullet      (spear #:damage     100
                                                                  #:durability 50
                                                                  #:speed      10
                                                                  #:range      51)
                                             #:rapid-fire? #f )
                       (custom-weapon-entity #:name        "Sword"
                                             #:sprite      sword-sprite
                                             #:bullet      (sword #:damage     20
                                                                  #:durability 50))
                       (custom-weapon-entity #:name        "Paint Thrower"
                                             #:sprite      paint-thrower-sprite
                                             #:bullet      (paint #:damage     10
                                                                  #:durability 20
                                                                  #:range      20)
                                             #:fire-mode   'random
                                             #:fire-rate   30 )))