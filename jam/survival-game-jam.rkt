#lang racket

(provide survival-game
         basic-player-entity
         random-character-row)

(require game-engine
         game-engine-demos-common)

(require "../scoring/score.rkt")


; ==== BACKDROP COMPONENT ====
; Converts a single bg image to a list of bg tiles
(define (forest-backdrop)
  (bg->backdrop (rectangle (* 3 640) (* 3 480) 'solid 'darkgreen) 
                #:rows       3
                #:columns    3
                #:start-tile 0))

(define WIDTH       (backdrop-width  (forest-backdrop)))
(define HEIGHT      (backdrop-height (forest-backdrop)))
(define TOTAL-TILES (backdrop-length (forest-backdrop)))




; === GAME DIALOG ===
(define player-dialog
  (list "Hello. What's your name?"
        "I'm lost and hungry, can you help me?"))

; Responses must have the same number of lists as items in the player-dialog
(define npc1-response
  (list (list "Oh, hello! My name is Jordan!"
              "It's dangerous out here."
              "You should be careful.")
        (list "Sorry, I don't have any food to spare."
              "If you look around though,\nyou might find carrots.")
        ))

(define npc1-response-sprites
  (dialog->response-sprites npc1-response
                            #:game-width WIDTH
                            #:animated #t
                            #:speed 4))

; ==== RECIPE SYSTEM ====
; todo: add to game engine'
;       rename to receipe->player-system?
(define (recipe->system r)
  (define product-name (get-name (first r)))
  (define i-list (third r))
  (define (remove-items g e1 e2)
    (if ((crafting? product-name) g e2)
        (begin (displayln (~a "CRAFTING: " product-name))
               ((apply do-many (map remove-item-by-name i-list)) g e2)
                   #;((spawn (backpack-entity #:components (on-rule (crafting? product-name) die))
                           #:relative? #f) g _))
        (begin (displayln (~a "NOT CRAFTING: " product-name))
               e2)))
  (observe-change (crafting? product-name) remove-items))

; === ENTITY DEFINITIONS ===
(define (bg-entity)
  (sprite->entity (render-tile (forest-backdrop))
                  #:name     "bg"
                  #:position   (posn 0 0)
                  #:components (static)
                               (forest-backdrop)
                               #;(precompiler
                                (backdrop-tiles (first (forest-backdrop))))))



(define (instructions-entity)
  (sprite->entity (draw-title (~a "Use ARROW KEYS to move.\n"
                                  "Press SPACE BAR to interact.\n"
                                  "Press ENTER to select or close dialog.\n"
                                  "Press I to open these instructions.\n"
                                  "Press Z to pick up items.\n"
                                  "Press X to drop items."))
                  #:position   (posn (/ WIDTH 2) (/ HEIGHT 2))
                  #:name       "instructions"
                  #:components (static)
                               (on-key 'enter die)
                               (on-key 'space die)
                               (on-key "i" die)
                               ))

(define (score-entity)
  (sprite->entity (draw-dialog "Gold: 0")
                  #:name       "score"
                  #:position   (posn 380 20)
                  #:components (static)
                               (counter 0)
                               (layer "ui")
                               (on-key 'space #:rule (player-is-near? "item") (do-many (change-counter-by 10)
                                                                                       (draw-counter-rpg #:prefix "Gold: ")
                                                                                       (spawn (player-toast-entity "+10 GOLD"))))
                               ))


                               


; ==== NEW HELPER SYSTEMS ====
; todo: add to game-engine?
(define (consumable) (on-key 'space #:rule (near? "player") die)) ;health entity also needs a check when consumed.

(define (entity-cloner entity amount)
  (map (thunk* entity) (range amount)))

; ==== BORDERLANDS STYLE POP UPS =====
; todo: add to game-engine?
(define (go-to-entity name #:offset [offset (posn 0 0)])
  (lambda (g e)
    (define target? (get-entity name g))
    (if target?
        (update-entity e posn? (posn-add (get-component target? posn?) offset))
        e)))

(define (text/shadow message size color)
  (overlay/offset (freeze (text/font message size color "Arial" 'default 'normal 'normal #f))
                  -1 1
                  (freeze (text/font message size "black" "Arial" 'default 'normal 'normal #f))))

(define (player-toast-entity message #:color [color "yellow"])
  (sprite->entity (text/shadow message 16 color)
                  #:name       "player toast"
                  #:position   (posn 0 0)
                  #:components (hidden)
                               (layer "ui")
                               (direction 270)
                               ;(physical-collider)
                               (speed 3)
                               (on-start (do-many (go-to-entity "player" #:offset (posn 0 -20))
                                                  (random-direction 240 300)
                                                  (random-speed 2 4)
                                                  show))
                               (every-tick (do-many (move)
                                                    (scale-sprite 1.05)))
                               (after-time 15 die)))


(define (has-gold? amount)
  (lambda (g e)
    (define gold (get-counter (get-entity "score" g)))
    (>= gold amount)))



; === WON AND LOST RULES ===
(define (won? g e)
  #f)

(define (lost? g e)
  #f
  #;(health-is-zero? g e))
                
; === RUN THE GAME ===
#;(start-game (instructions-entity)
            (game-over-screen won? health-is-zero?)
            (score-entity)
            (health-entity)

            (player-entity)
            (npc1-entity)
            
            (crafting-fire (posn 84 274) #:tile 0)
            (crafting-cauldron (posn 250 200) #:tile 1)
            (crafting-table (posn 400 200) #:tile 2)
            
            (builder (posn 300 300) brick-house)      ; CHECKING THAT I DIDN'T BREAK THIS
            
            (pine-tree (posn 400 140) #:tile 2)
            (pine-tree (posn 93 136) #:tile 4)
            (round-tree (posn 322 59) #:tile 4)
            
            (entity-cloner (item-entity) 5)
            (entity-cloner (carrot-entity) 10)
            (bg-entity))

(define (food->component f #:use-key [use-key 'space] #:max-health [max-health 100])
  (define item-name (get-name (first f)))
  (define heal-amount (second f))
  (on-key use-key #:rule (player-is-near? item-name) (do-many (maybe-change-health-by heal-amount #:max max-health)
                                                            (spawn (player-toast-entity (~a "+" heal-amount) #:color "green")))))



(define (basic-player-entity (i (circle 10 'solid 'red)))
  (sprite->entity i
                  #:name       "player"
                  #:position   (posn 100 100)
                  #:components (physical-collider)
                  (sound-stream)
                  (precompiler (player-toast-entity "+5" #:color "green")
                               (player-toast-entity "-1" #:color "red"))
                  (key-movement 10 #:rule (and/r all-dialog-closed?
                                                 (not/r lost?)))
                  (key-animator-system)
                  (stop-on-edge)
                  (backpack-system #:components (observe-change backpack-changed? update-backpack))
                  (player-edge-system)
                  (on-key "o" #:rule player-info-closed? show-move-info)
                  (observe-change lost? (kill-player))
                  (on-key "i" (spawn instructions-entity #:relative? #f))
                  (on-key "m" (open-mini-map #:close-key "m"))
                  (counter 0)
                  (on-key 'enter #:rule player-dialog-open? (get-dialog-selection))
                  (on-rule (not/r all-dialog-closed?) (stop-movement))))


(define (survival-game #:bg              [bg-ent (bg-entity)]
                           #:player          [p      #f #;(basic-player-entity)]
                           #:starvation-rate [sr 40]
                           #:npc-list        [npc    '() #;(list (random-npc (posn 200 200)))]
                           #:item-list       [i-list '() #;(list (item-entity))]
                           #:food-list       [f-list '() #;(list (food #:entity (carrot-entity) #:amount-in-world 10)
                                                                 (food #:entity carrot-stew #:heals-by 20))]
                           #:crafter-list    [c-list '() #;(list (craft-fire))])
  
  (define player-with-recipes
    (if p
        (add-components p (map recipe->system known-recipes-list))
        #f))
  
  (define (health-entity)
    (define max-health 100)
    (if p
        (sprite->entity (draw-health-bar 100 #:max max-health)
                        #:name "health"
                        #:position (posn 100 20)
                        #:components (static)
                        (counter 100)
                        (layer "ui")
                        (apply precompiler (map (lambda(i) (draw-health-bar i #:max 100))
                                                (range 100)))
                        (do-every 50 (do-many (maybe-change-health-by -1 #:max max-health)
                                              (spawn (player-toast-entity "-1" #:color "orangered") #:relative? #f)))
                        (map food->component f-list))
        #f))

  (define es (filter identity
                     (flatten
                      (list
                       (instructions-entity)
                       (if p (game-over-screen won? health-is-zero?) #f)
                       (if p (score-entity) #f)

                       (if p (health-entity) #f)

                       player-with-recipes
              
              
                       ;(pine-tree (posn 400 140) #:tile 2)
                       ;(pine-tree (posn 93 136) #:tile 4)
                       ;(round-tree (posn 322 59) #:tile 4)
              
                       c-list
              
                       (map (λ (ent) (entity-cloner ent 10)) i-list)
                       (map (λ (f) (entity-cloner (first f) (third f))) f-list)
              
                       bg-ent))))


  (displayln (~a "Score estimation for your game: " (score-game es)))
  
  (apply start-game es))

(define (food #:entity entity #:heals-by [heal-amt 5] #:amount-in-world [world-amt 0])
  (list entity heal-amt world-amt))

(define known-recipes-list '())

(define (craft-menu #:open-key     [open-key 'space]
                    #:open-sound   [open-sound #f]
                    #:select-sound [select-sound #f]
                    #:recipes r
                              . recipes)
  (set! known-recipes-list (append (cons r recipes) known-recipes-list))
  (crafting-menu #:open-key open-key
                 #:open-sound open-sound
                 #:select-sound select-sound
                 #:recipes (cons r recipes)))



(define (random-character-row)
  (apply beside
         (map fast-image-data
              (vector->list
               (animated-sprite-frames
                (get-component
                 (random-npc)
                 animated-sprite?))))))


