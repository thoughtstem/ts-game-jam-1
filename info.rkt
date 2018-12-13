#lang info

(define scribblings '(("doc/manual.scrbl" (multi-page))))

(define deps '(
  "https://github.com/thoughtstem/game-engine.git"
  "https://github.com/thoughtstem/game-engine-rpg.git"
  "https://github.com/thoughtstem/game-engine-demos.git?path=game-engine-demos-common"
  ))

(define compile-omit-paths '(
  "test"))

(define test-omit-paths '("doc" "jam" "scoring" "examples"))

(define test-include-paths '(
  "test"))
