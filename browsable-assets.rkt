#lang racket

(require game-engine-rpg/lang/assets
         (except-in ts-racket scale-to-fit)
         (only-in game-engine draw-entity)
         (only-in ts-curric-common text-with-image)
         pict
         pict/code)

(provide show-coin-sprites)



(define (show-coin-sprites)

  (define a (inset-frame (draw-entity (copper-coin-entity))))
  (define b (inset-frame (draw-entity (silver-coin-entity))))
  (define c (inset-frame (draw-entity (cat))))
  (define d (inset-frame (draw-entity (bat))))
  ;(define e (inset-frame (draw-entity (slime)))) ;save for later
  ;(define f (inset-frame (draw-entity (snake)))) ;save for later
  (define g (inset-frame (draw-entity (apples))))

  (inset-frame
   (vl-append
    (scale (text "Try these sprites as your coin!") 1.5)
    (ghost (rectangle 10 10))
    (code+hints a #:settings hints-on-right
                (list a
                      (hint
                       (code copper-coin-sprite))))
    (code+hints b #:settings hints-on-right
                (list b
                      (hint
                       (code silver-coin-sprite))))
    (code+hints g #:settings hints-on-right
                (list g
                      (hint
                       (code apples-sprite))))
    (code+hints c #:settings hints-on-right
                (list c
                      (hint
                       (vl-append
                        (code cat-sprite)
                        (text "Also try:")
                        (code white-cat-sprite)
                        (code black-cat-sprite)))))
    (code+hints d #:settings hints-on-right
                (list d
                      (hint
                       (code bat-sprite))))
    #;(code+hints e #:settings hints-on-right
                (list e
                      (hint
                       (code slime-sprite))))
    #;(code+hints f #:settings hints-on-right
                (list f
                      (hint
                       (code snake-sprite)))))))

(module+ test
  (show-coin-sprites))
