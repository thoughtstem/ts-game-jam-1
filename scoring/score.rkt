#lang racket

(provide score-game)

(require game-engine
         game-engine-demos-common
         2htdp/image)

(module+ test
  #;(require "../jam/survival-game-jam.rkt")

  ;Should test with this...
  #;(surival-game-jam ;#:starvation-rate 100
     ;#:food-list (list (food #:entity (carrot-entity)      #:heals-by 20 #:amount-in-world 15)
     ;                  (food #:entity (orange-entity)      #:heals-by 40 #:amount-in-world 10)
     ;                  (food #:entity (orange-cake-entity) #:heals-by 60))
     ;#:crafter-list (list (fire-pit))
     )

  
  (define npc1-response
    (list (list "Oh, hello! My name is Jordan!"
                "It's dangerous out here."
                "You should be careful.")
          (list "Sorry, I don't have any food to spare."
                "If you look around though,\nyou might find carrots."
                "Hello.")))

  (define npc1-response-sprites
    (dialog->response-sprites npc1-response
                              #:game-width 600
                              #:animated #t
                              #:speed 4))
  
  (score-game
   (sprite->entity (circle 40 'solid 'red)
                   #:name       "player"
                   #:position   (posn 0 0))

   (sprite->entity (circle 10 'solid 'red)
                   #:name       "food"
                   #:position   (posn 0 0))

   (sprite->entity (circle 10 'solid 'red)
                   #:name       "food"
                   #:position   (posn 0 0))

   (create-npc #:sprite (circle 20 'solid 'green)
               #:name        "npc"
               #:position    (posn 202 249)
               #:active-tile 0
               #:dialog      npc1-response-sprites
               #:mode        'pace)))

(define/contract (score-game es)
  (-> (listof entity?) number?)
  (calc-scores es
               (if-exists  (player?) #:give 5)
               (for-each   (food?)   #:give 1 #:max 10)
               (for-each   (item?)   #:give 1 #:max 10)
               (for-each   (npc?)
                           #:give 1
                           #:bonus (lines-of-dialog))))



(define/contract (calc-scores es . rules) ;Rules are functions from entity lists to numbers
  (->* ((listof entity?)) #:rest (listof procedure?) number?)
  (apply + (map (apply-rule-to es) rules)))

(define/contract (apply-rule-to es)
  (-> (listof entity?) (-> procedure? number?))
  (lambda (r)
    (r es)))

(define/contract (for-each pred #:give amount #:max (max 100) #:bonus (bonus (thunk* 0)))
  (->* ((-> entity? (or/c number? boolean?))
        #:give number?)
       (#:max number?
        #:bonus (-> entity? number?))
       (-> (listof entity?) number?))
  
  (lambda (es)
    (define matching
      (filter pred es))

    (define bonus-points
      (apply + (map bonus matching)))

    (min max
         (+ (* amount (length matching))
            bonus-points))))

(define (if-exists pred #:give amount)
  (lambda (es) 
    (define matching
      (filter pred es))

    (if (empty? matching) 0 amount)))

(define (with-name n)
  (lambda (e)
    (entity-has-name? n e)))

(define (entity-has-name? n e)
  (string-contains? (get-name e) n))

(define (lines-of-dialog)
  (lambda (npc)
    (length (flatten (get-storage-data "dialog" npc)))))


(define (player?) (with-name "player"))
(define (food?)   (with-name "food"))
(define (item?)   (with-name "item"))
(define (npc?)    (with-name "npc"))
