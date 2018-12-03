#lang ts-game-jam-1

(define (sheet) (random-character-row))

(define (sprite)
  (row->sprite (sheet)))

(survival-game-jam
 #:player (basic-player-entity (sprite)))