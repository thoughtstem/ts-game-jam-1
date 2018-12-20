#lang ts-game-jam-1

(define (my-spear)
  (custom-bullet #:position (posn 20 0)
                 #:sprite spear-bullet-sprite
                 #:damage 50
                 #:durability 50
                 #:speed 5
                 #:range 20
                 #:components (after-time 10 (bounce))))

(define (my-sword)
  (custom-bullet #:position (posn 10 0)
                 #:sprite sword-sprite
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

(battle-arena-game
   #:bg              (custom-background)
   #:avatar          (custom-avatar #:sprite      (row->sprite (random-character-row))
                                    #:key-mode    'wasd       ;OPTIONAL
                                    #:mouse-aim?  #t          ;OPTIONAL
                                    )
   #:weapon-list     (list (custom-weapon-entity #:name              "Spear"
                                                 #:sprite            sword-sprite
                                                 #:mouse-fire-button 'left        ;OPTIONAL
                                                 #:bullet            (my-sword)
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
                                                 #:mouse-fire-button 'left        ;OPTIONAL
                                                 #:fire-mode         'random
                                                 #:fire-rate          30
                                                 #:rarity            'epic        ;OPTIONAL
                                                 )))