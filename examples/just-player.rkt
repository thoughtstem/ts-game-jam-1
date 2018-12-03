#lang ts-game-jam-1

(define (sheet) (scale 2 (random-character-row)))

(define (sprite)
  (row->sprite (sheet)))

(survival-game-jam
 #:player (basic-player-entity (sprite)))