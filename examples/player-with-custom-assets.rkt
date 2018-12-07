#lang ts-game-jam-1

(define (bg-entity)
  (custom-background #:bg-img SNOW-BG))

(define (avatar-entity)
  (custom-avatar #:sprite   (star 20 "solid" "gold")
                 #:position (posn 400 300)))

(define (rare-gold-coin-entity)
  (custom-coin #:sprite (circle 10 "solid" "gold")
               #:name "Rare Gold Coin"
               #:random-position? #t
               #:respawn?         #f))

(define (carrot-cake-entity)
  (custom-food #:sprite           (rectangle 40 20 "solid" "brown")
               #:name             "Carrot Cake"
               #:random-position? #f
               #:respawn?         #f))

(define carrot-cake-recipe
  (recipe #:product     (carrot-cake-entity)
          #:build-time  50
          #:ingredients (list "Carrot")))

(define (oven-entity)
  (custom-crafter #:position   (posn 300 300)
                  #:sprite     (rectangle 50 50 "solid" "black")
                  #:menu       (crafting-menu-set! #:recipes carrot-cake-recipe)
                  #:components (movable)))

(survival-game #:bg              (bg-entity)
               #:avatar          (avatar-entity)
               #:starvation-rate 1
               #:npc-list        (list (random-npc (posn 400 300) #:tile 1 #:mode 'pace)
                                       (random-npc (posn 300 300) #:tile 2 #:mode 'wander))
               #:coin-list       (list (coin #:entity (custom-coin)           #:value 10  #:amount-in-world 10)
                                       (coin #:entity (rare-gold-coin-entity) #:value 500 #:amount-in-world 1))
               #:food-list       (list (food #:entity (carrot-entity)  #:amount-in-world 10)
                                       (food #:entity (carrot-cake-entity) #:heals-by 40))
               #:crafter-list    (list (oven-entity))
               #:other-entities        (pine-tree (posn 100 100) #:tile 0))