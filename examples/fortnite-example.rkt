#lang ts-game-jam-1

;BATTLE MECHANICS - MELEE, RANGED
;BATTLE GEAR - WEAPONS, ARMOR, POWER UPS, POTIONS
;BASE BUILDING - OFFENSIVE, DEFENSIVE

; CORE MECHANICS
;  Harvest Materials by breaking things with your pickaxe.
;  Scavenge for weapons and items of varying rarities in treasure chests, ammo boxes, and supply drops;.
;  Build to defend yourself, move around the map, and attack your opponents.
;  Survive the storm.

; WEAPONS: repeater, heavy-repeater, light-repeater,
;          pistol, blunderbuss, rocket launcher

; TRAPS: chiller, damage trap, cozy campfire, turret
; Structures: walls, floors, stairs, roof
; UTILITY: boogie-bomb, port-a-fort, , port-a-fortress
; Potions: medkit, shield potion, 
; RARITIES: common, uncommon, rare, epic, legendary
; MATERIALS: wood, stone, metal

; MELEE AND RANGED BATTLE MECHANICS
(fortnite2d-game
 #:bg              (custom-background)
 #:avatar          (custom-avatar #:sprite (row->sprite (random-character-row)))
 #:map-size        5
 #:enemy-list      (list (custom-enemy #:sprite (row->sprite (random-character-row))
                                       #:amount-in-world 10
                                       #:ai 'easy
                                       #:total-health 200)
                         (custom-enemy #:sprite (row->sprite (random-character-row))
                                       #:amount-in-world 20
                                       #:ai 'hard
                                       #:damage 5))
 ; ==== BATTLE GEAR - WEAPONS / RANGED BATTLE ====
 #:weapon-list     (list (custom-weapon #:sprite heavy-repeater-sprite
                                        #:bullet (blue-paintball)
                                        #:fire-rate 12
                                        #:damage 18
                                        #:range 40
                                        #:max-ammo 20
                                        #:rarity 'rare)
                         (custom-weapon #:entity rocket-launcher-sprite
                                        #:bullet (rocket)
                                        #:range 400
                                        #:rarity 'legendary))
 ; ==== BASE BUILDING ====
 #:structures-list (list (custom-structure #:sprite wood-wall-sprite #:ingredients (list "Wood")   #:durability 20)
                         (custom-structure #:sprite stone-wall-sprite #:ingredients (list "Stone") #:durability 40)
                         (custom-structure #:sprite metal-wall-sprite #:ingredients (list "Metal") #:durability 60))
 #:traps-list       (list (custom-offense #:name "Rocket Turret"
                                          #:sprite wall-sprite
                                          #:bullet (rocket)
                                          #:damages-by 10
                                          #:durability 100
                                          #:fire-rate 10
                                          #:range 20
                                          #:rarity 'epic)
                          (custom-defense #:name "Lava Pit"
                                          #:sprite lava-sprite
                                          #:damages-by  30
                                          #:rarity 'common))
 #:crafter-list    (list (custom-crafter #:sprite table-sprite #:name "Workbench"   #:menu (weapons-menu))
                         (custom-crafter #:sprite lab-sprite   #:name "Alchemy Lab" #:menu (potions-menu))
                         (custom-crafter #:sprite table-sprite #:name "Workbench"   #:menu (weapons-menu))
                         )
 #:other-entities  (pine-tree (posn 300 100) #:tile 0)
                   (pine-tree (posn 300 100) #:tile 2)
                   (pine-tree (posn 200 100) #:tile 4))
