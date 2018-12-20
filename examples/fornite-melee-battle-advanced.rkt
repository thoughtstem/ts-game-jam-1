#lang ts-game-jam-1

(define (my-spear)
  (custom-bullet #:position (posn 20 0)
                 #:sprite spear-bullet-sprite
                 #:damage 50
                 #:durability 50
                 #:speed 5
                 #:range 20
                 #:components (on-start (set-rotation-style 'normal))
                              (after-time 10 (bounce))))

(define (my-sword)
  (custom-bullet #:position (posn 10 0)
                 #:sprite swinging-sword-sprite
                 #:damage 50
                 #:durability 20
                 #:speed  0
                 #:range  10
                 #:components (every-tick (change-direction-by 15))))

(define (my-paint)
  (custom-bullet #:position (posn 25 0)
                 #:sprite paint-sprite
                 #:damage 5
                 #:durability 5
                 #:speed  3
                 #:range  15
                 #:components (on-start (set-size 0.5))
                              (every-tick (scale-sprite 1.1))
                              ))

(define (my-flying-dagger)
  (custom-bullet #:position (posn 20 0)
                 #:sprite   flying-sword-sprite
                 #:damage 10
                 #:speed  2
                 #:range  40
                 #:durability 20
                 #:components (on-start (do-many (set-size 0.5)))
                              (do-every 10 (random-direction 0 360))))

(define (my-ring-of-fire)
  (custom-bullet #:position   (posn 25 0)
                 #:sprite     flame-sprite
                 #:damage     5
                 #:durability 20
                 #:speed      10
                 #:range      36
                 #:components (on-start (set-size 0.5))
                              (every-tick (do-many (scale-sprite 1.05)
                                                   (change-direction-by 10)))))

(battle-arena-game
   #:bg              (custom-background)
   #:avatar          (custom-avatar #:sprite      (row->sprite (random-character-row))
                                    #:key-mode    'wasd       ;OPTIONAL
                                    #:mouse-aim?  #t          ;OPTIONAL
                                    )
   #:weapon-list     (list (custom-weapon-entity #:name              "Spear"
                                                 #:sprite            spear-sprite
                                                 #:mouse-fire-button 'left        ;OPTIONAL
                                                 #:bullet            (my-spear)
                                                 #:rapid-fire?       #f           ;OPTIONAL
                                                 #:rarity            'rare        ;OPTIONAL
                                                 )
                           (custom-weapon-entity #:name              "Sword"
                                                 #:sprite            sword-sprite
                                                 #:mouse-fire-button 'left        ;OPTIONAL
                                                 #:bullet            (my-sword)
                                                 #:rapid-fire?       #f           ;OPTIONAL
                                                 #:rarity            'rare        ;OPTIONAL
                                                 )
                           (custom-weapon-entity #:name              "Paint Thrower"
                                                 #:sprite             paint-thrower-sprite
                                                 #:bullet             (my-paint)
                                                 #:mouse-fire-button 'left        ;OPTIONAL
                                                 #:fire-mode         'random
                                                 #:fire-rate          30
                                                 #:rarity            'epic        ;OPTIONAL
                                                 )
                           (custom-weapon-entity #:name              "Flying Dagger Spell"
                                                 #:sprite             (overlay (text "FD" 12 "black")
                                                                               (square 30 "solid" "purple")
                                                                               (square 32 "solid" "white"))
                                                 #:bullet             (my-flying-dagger)
                                                 #:mouse-fire-button 'left        ;OPTIONAL
                                                 #:fire-mode         'spread
                                                 #:fire-rate          2
                                                 #:rarity            'legendary       ;OPTIONAL
                                                 )
                           (custom-weapon-entity #:name              "Ring of Fire Spell"
                                                 #:sprite             (overlay (text "ROF" 12 "black")
                                                                               (square 30 "solid" "yellow")
                                                                               (square 32 "solid" "white"))
                                                 #:bullet             (my-ring-of-fire)
                                                 #:mouse-fire-button 'left        ;OPTIONAL
                                                 #:fire-rate          30
                                                 #:rarity            'legendary        ;OPTIONAL
                                                 )))