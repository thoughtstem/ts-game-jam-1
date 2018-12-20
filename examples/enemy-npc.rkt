#lang ts-game-jam-1

(require ts-racket)

; ===== GAME DEFINITIONS ====
(define (enemy-npc level)
  (custom-enemy #:amount-in-world 1
                #:ai              level
                #:health          100
                #:shield          200
                #:weapon          (custom-weapon
                                   #:bullet (custom-bullet))))


(battle-arena-game
 #:enemy-list (list (enemy-npc 'easy)
                    (enemy-npc 'medium)
                    (enemy-npc 'hard))
 #:avatar    (custom-avatar #:sprite      (row->sprite (random-character-row))
                            #:key-mode    'wasd
                            #:mouse-aim?  #t
                            #:components
                            (storage "Weapon Slot" 1)
                            (on-key 1 (set-storage-named "Weapon Slot" 1))
                            (custom-weapon #:slot 1 #:mouse-fire-button 'left)))

