#lang ts-game-jam-1

(define (sprite)
  (row->sprite (random-character-row)))

(define (bg-entity)
  (basic-background #:bg-img FOREST-BG
                    #:rows 3
                    #:columns 3
                    #:start-tile 1))

(define carrot-stew-recipe
  (recipe #:product (carrot-stew-entity)
          #:build-time 30
          #:ingredients (list "Carrot")))

(define (crafter-entity)
  (basic-crafter (posn 300 300)
                 #:components (movable)
                              (crafting-menu-set! #:recipes carrot-stew-recipe
                                                  )))

(survival-game-jam #:bg              (bg-entity)
                   #:player          (basic-player-entity (sprite))
                   #:starvation-rate 10
                   #:item-list       (list (coin-entity))
                   #:food-list       (list (food #:entity (carrot-entity) #:amount-in-world 10)
                                           (food #:entity (carrot-stew-entity) #:heals-by 20))
                   #:crafter-list    (list (crafter-entity)))