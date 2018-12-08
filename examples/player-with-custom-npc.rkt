#lang ts-game-jam-1

(define player-dialog
  (list "Hello. What's your name?"
        "I'm lost and hungry, can you help me?"))

(define npc-response
  (list (list "Oh, hello! My name is Jordan!"
              "It's dangerous out here."
              "You should be careful.")
        (list "Sorry, I don't have any food to spare."
              "If you look around though,\nyou might find carrots.")
        ))

(define (bg-entity)
  (custom-background #:bg-img SNOW-BG))

(define (avatar-entity)
  (custom-avatar #:sprite     (row->sprite (random-character-row))
                 #:position   (posn 400 300)
                 #:components (player-dialog-with "Jordan"
                                                  #:dialog-list player-dialog)))
  
(define (npc-entity)
  (custom-npc #:position (posn 200 200)
              #:tile     0
              #:name     "Jordan"
              #:dialog   npc-response
              #:mode     'pace))

(survival-game #:bg              (bg-entity)
               #:avatar          (avatar-entity)
               #:starvation-rate 1
               #:npc-list        (list (npc-entity))
               #:coin-list       (list (custom-coin))
               #:food-list       (list (custom-food #:entity (carrot-entity) #:amount-in-world 10)
                                       (custom-food #:entity (carrot-stew-entity) #:heals-by 40))
               #:crafter-list    (list (custom-crafter #:position (posn 340 300)))
               #:other-entities  (pine-tree (posn 73 317)  #:tile 0 #:hue 100)
                                 (pine-tree (posn 200 100) #:tile 2 #:hue 200)
                                 (pine-tree (posn 349 223) #:tile 4 #:hue 30))