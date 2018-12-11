#lang racket

(require game-engine-rpg/lang/assets
         (except-in ts-racket scale-to-fit)
         (only-in game-engine draw-entity)
         (only-in ts-curric-common text-with-image)
         pict
         pict/code)


;being really slow??? check for accidental loops

(define (show-coin-sprites)

  (define a (inset-frame (draw-entity (copper-coin-entity))))
  (define b (inset-frame (draw-entity (silver-coin-entity))))
  (define h (inset-frame (draw-entity (gold-coin-entity))))
  (define c (inset-frame (draw-entity (cat))))
  (define d (inset-frame (draw-entity (bat))))
  (define e (inset-frame (draw-entity (slime))))
  (define f (inset-frame (draw-entity (snake))))
  (define g (inset-frame (draw-entity (apples))))

   (vl-append
    (code+hints a #:settings hints-on-right
                (list a
                      (hint
                       (code copper-coin-sprite))))
    (code+hints b #:settings hints-on-right
                (list b
                      (hint
                       (code silver-coin-sprite))))
    (code+hints h #:settings hints-on-right
                (list h
                      (hint
                       (code gold-coin-sprite))))
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
                        (text-with-image (code white-cat-sprite) (text " or "))
                        (code black-cat-sprite)))))
    (code+hints d #:settings hints-on-right
                (list d
                      (hint
                       (code bat-sprite))))
    (code+hints e #:settings hints-on-right
                (list e
                      (hint
                       (code slime-sprite))))
    (code+hints f #:settings hints-on-right
                (list f
                      (hint
                       (code snake-sprite))))))

(show-coin-sprites)
