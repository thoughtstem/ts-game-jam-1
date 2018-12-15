#lang scribble/manual

@title{Training Recommendations}

The Game Jam is not easy.  The tight time constraints require competitors to have a high level
of mastery over various aspects of game design.

Mastery is the key word here.   It is not enough to have simply "been exposed" to some concept.
That is familiarity -- not mastery.

The training program given here is intended to give students mastery over the skills needed
to excel at the Scholastic Game Jam.

It is also intended to be fun!  Mastery requires repetition.  Mastery requires holding oneself
to high standards.  Sometimes it can be a challenge to keep having fun while pursuing mastery.
The following curriculum is intended to keep the road to mastery as fun as possible.

At the end of the day, though, the main ingredient to fun is the energy of the coach.  If you're
a coach, whether you follow these recommendations or not, keep in mind that if you're excited
about the Game Jam, your competitors will be too.  If you're excited about your competitors'
ascendency to mastery, they will be too.

Be loud.  Be proud.  Be a coach.

@section{Training Katas}

@(require 2htdp/image)
@(require ts-game-jam-1)

Coaches will train competitors by helping them acquire the necessary skills to excel
at the Game Jam competition.  Competitors who have mastered these skills will earn katas.
These katas serve as visual, wearable representations of a competitor's hard work.

Kata key:

@(define (meta-kata)     (circle 10 'outline 'black))
@(define (avatar-kata)   (circle 10 'solid   'orange))
@(define (coin-kata)     (circle 10 'solid   'green))
@(define (food-kata)     (circle 10 'solid   'pink))
@(define (npc-kata)      (circle 10 'solid   'black))
@(define (crafter-kata)   (circle 10 'solid   'blue))

@(meta-kata)     - @bold{Meta Katas} - for skills related to excelling as a Game Jam competitor.

@(avatar-kata)   - @bold{Avatar Katas} - for skills related to creating avatars

@(coin-kata)     - @bold{Coin Katas} - for skills related to creating coin items

@(food-kata)     - @bold{Food Katas} - for skills related to creating food items

@(npc-kata)      - @bold{NPC Katas} - for skills related to creating NPCs

@(crafter-kata)   - @bold{Crafter Katas} - for skills related to creating crafters and recipes


@; ------ INTRO KATAS


@subsection{Intro Katas - @italic{(Day 1)}}

We recommend students earn these Intro Katas before earning any other ones.
They help reinforce team values and help orient the competitors toward the
challenges that face them.

@subsubsection{Core Values Kata}

@margin-note[#:left? #t "Hand motions can make these easier to remember and repeat. For
             example: 'It's not about my code.' Point to computer. 'It's about
             what I can code.' Point to brain."]

@margin-note*{Teaching Tip: Depending on the size of your class, you may want to challenge them
             to rattle these off 1 by 1, in pairs or small groups, or as an entire
             class.}

To earn this kata @(meta-kata) they need to:

@italic{Recite the first two ThoughtSTEM core values, in less than 1 minute.}

@itemlist[@item{It's not about my code.     It's about what I can code.}
          @item{It's not about me.          It's about my team.}]



@subsubsection{Game Jam Specs Kata}

To earn this kata @(meta-kata) they need to:

@italic{Recite the specs for the upcoming Game Jam, in less than 1 minute.}

@margin-note*{Teaching Tip: This is a good kata to learn as a team or in small groups.}

@itemlist[@item{Game Type: Survival Game}
          @item{Time Limit: 1 hour}
          @item{Categories:
           @itemlist[@item{Avatar:                 10 points}
                     @item{Coin Items:             25 points}
                     @item{Food Items:             25 points}
                     @item{Non-Player Characters:  45 points}
                     @item{Crafting:               40 points}]}]

This kata should be re-earned any time the specs change.  Or any time there's a new upcoming jam.
The specs do change from time to time.  (And that in itself is a valuable lesson.)


@subsubsection{Kata Kata}

@margin-note*{This kata might be too many "repeat after me" katas. Feel free to share
             the info more informally.}

To earn this kata @(meta-kata) they need to:

@italic{Recite answer to: What is a Kata?, in less than 1 minute.}

A Kata is a small piece of code that I memorize and can write:
@itemlist[@item{Calmly}
          @item{Quickly}
          @item{Accurately}]



@subsubsection{Racket Kata}

@margin-note*{Teaching Tip: Start with all the code projected/written on the board.
              Remove the lines one by one, testing the students each time.}

To earn this kata @(meta-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a red circle that is 80 pixels across.}

To code of this type:

@codeblock{
 #lang racket
 (require 2htdp/image)
 (circle 80 'solid 'red)}

Note: To award this kata, a student should be able to do the above
in images less than 5 minutes.  But doing it once is too easy.  The student should
do this multiple times with different shapes: e.g. blue square, green star,
etc.


@; ------ AVATAR KATAS ------


@subsection{Avatar Katas - @italic{(Day 2)}} 

@margin-note*{Teaching Tip: Start class reciting the first two ThoughtSTEM core values.}

@subsubsection{Paper Avatar Kata}

To earn this kata @(meta-kata) they need to:

@italic{Recite the amount of points they get from an Avatar in their game. in less than 1 minute.}

@margin-note*{Teaching Tip: This is a good kata to learn as a team or in small groups.}

@itemlist[@item{Avatar points:
           @itemlist[@item{Having an avatar              @bold{1 points}}
                     @item{Any avatar within 5 minutes
                                 @italic{(Sprint Bonus) @bold{5 points}}}
                     @item{Avatar animation frame        @bold{1 points}
                                        @itemlist[@item{Maximum 4 animations}]}]}]

@; ------ AVATAR BRONZE

@subsubsection{Bronze Avatar Kata}

To earn this kata @(avatar-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar in it.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (survival-game
   #:avatar (custom-avatar))}

@; ------ AVATAR SILVER

@subsubsection{Silver Avatar Kata}

To earn this kata @(avatar-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has a red circle that is 80 pixels across as an avatar.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1
 
 (define (my-avatar)
   (custom-avatar #:sprite (circle 20 "solid" "red")))

 (survival-game
   #:avatar (my-avatar))}

@; ------ AVATAR GOLD

@subsubsection{Gold Avatar Kata}

@margin-note*{Not including drawing time, but do include exporting time.}

To earn this kata @(avatar-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has a custom image as an avatar.}

To code of this type:

@(define (major-triumph) (bitmap "images/major-triumph.png"))


@codeblock{#lang ts-game-jam-1}
@racketblock[
 (define (my-avatar)
   (custom-avatar #:sprite #, (major-triumph) ))
  
 (survival-game
  #:avatar (my-avatar))]


@; ------ COIN KATAS ------


@subsection{Coin Katas - @italic{(Day 3)}}

@subsubsection{Paper Coin Kata}

To earn this kata @(meta-kata) they need to:

@italic{Recite the amount of points they get from coin items in their game, in less than 1 minute.}

@itemlist[@item{Coin points:   
           @itemlist[@item{Each coin item                    @bold{1 point, max 10}}
                     @item{Any coin within 10 minutes
                                 @italic{(Sprint Bonus)      @bold{5 points}}}
                     @item{For each coin item matching theme @bold{1 point, max 10}}]}]

@; ------ COIN BRONZE

@subsubsection{Bronze Coin Kata}

To earn this kata @(coin-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar and a coin.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (custom-coin)))}

@; ------ COIN SILVER

@subsubsection{Silver Coin Kata}

To earn this kata @(coin-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar and a coin worth 500 points.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (my-coin)
  (custom-coin #:value 500))
 
 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (my-coin)))}

@; ------ COIN GOLD

@subsubsection{Gold Coin Kata}

@margin-note*{Students should run the function (show-coin-sprites) on the interactions window to
 see a list of coin sprites.}

To earn this kata @(coin-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar and a coin with a custom sprite,
 name, value, and amount in world.}

@margin-note*{Teaching Tip: The order of the keywords does not matter.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (my-coin)
  (custom-coin #:sprite          copper-coin-sprite
               #:name            "copper coin"
               #:value           500
               #:amount-in-world 20))

 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (my-coin)))}


@; ------ COIN PLATINUM

@subsubsection{Platinum Coin Kata}

@margin-note*{Teaching Tip: As with any kata, there is not a "daily
 number of required katas", so you can always leave off a kata or return
 to it another day.}

To earn this kata @(coin-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, and more than one coin with a custom
 sprite, name, value, amount in world, and respawn value.}


@margin-note*{Teaching Tip: Any mix of keywords here is okay, as long as they
 all have the required sprite and name, and at least one of them does not respawn.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (my-coin)
  (custom-coin #:sprite copper-coin-sprite
               #:name   "copper coin"))

 (define (special-coin)
  (custom-coin #:sprite          bat-sprite
               #:name            "bat coin"
               #:value           1000
               #:amount-in-world 1
               #:respawn?        #f))

 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (my-coin)
                     (special-coin)))}

@; ------ FOOD KATAS ------


@subsection{Food Katas - @italic{(Day 4)}}

@subsubsection{Paper Food Kata}

To earn this kata @(meta-kata) they need to:

@italic{Recite the amount of points they get from food items in their game, in less than 1 minute.}

@itemlist[@item{Food points:   
           @itemlist[@item{Each food item                    @bold{1 point, max 10}}
                     @item{Any food within 15 minutes
                                 @italic{(Sprint Bonus)      @bold{5 points}}}
                     @item{For each food item matching theme @bold{1 point, max 10}}]}]

@; ------ FOOD BRONZE

@subsubsection{Bronze Food Kata}

To earn this kata @(food-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, and a food item.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (custom-coin))
  #:food-list  (list (custom-food #:amount-in-world 10)))}

@; ------ FOOD SILVER

@subsubsection{Silver Food Kata}

To earn this kata @(food-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, and a food that heals by 20 points.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (my-food)
  (custom-food #:amount-in-world 2
               #:heals-by        20))
 
 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (custom-coin))
  #:food-list  (list (my-food)))}

@; ------ FOOD GOLD

@subsubsection{Gold Food Kata}

@margin-note*{Students should run the function (show-food-sprites) on the interactions window to
 see a list of food sprites.}

To earn this kata @(food-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, and a food item with a custom sprite,
 name, amount in world, and healing power.}

@margin-note*{Teaching Tip: Remember, the order of the keywords does not matter.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (my-food)
  (custom-food #:sprite          apple-sprite
               #:name            "apple food"
               #:amount-in-world 2
               #:heals-by        20))

 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (custom-coin))
  #:food-list  (list (my-food)))}



@; ------ FOOD PLATINUM

@subsubsection{Platinum Food Kata}

@margin-note*{Teaching Tip: Remember, there is no number of "required" katas by day.}

To earn this kata @(food-kata) they need to:

Within ten minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, and more than one food item with a custom
 sprite, name, amount in world, healing power, and respawn value.}

@margin-note*{Teaching Tip: Any mix of keywords here is okay, as long as they
 all have the required sprite and name, and at least one of them does not respawn.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (my-food)
  (custom-food #:sprite          apples-sprite
               #:name            "apple"
               #:amount-in-world 2
               #:heals-by        20))

 (define (special-food)
  (custom-food #:sprite          salad-sprite
               #:name            "salad food"
               #:amount-in-world 1
               #:heals-by        50
               #:respawn?        #f))

 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (custom-coin))
  #:food-list  (list (my-food)
                     (special-food)))}

@; ------ NPC KATAS ------


@subsection{NPC Katas - @italic{(Day 5)}}

@margin-note*{Teaching Tip: NPC is short Non-Player Character.}

@subsubsection{Paper NPC Kata}

To earn this kata @(meta-kata) they need to:

@italic{Recite the amount of points they get from NPCs in their game, in less than 1 minute.}

@itemlist[@item{NPC points:   
           @itemlist[@item{Each NPC item                         @bold{1 point, max 5}}
                     @item{Any NPC within 20 minutes
                                 @italic{(Sprint Bonus)          @bold{5 points}}}
                     @item{For each NPC item matching theme      @bold{1 point, max 5}}
                     @item{For each line of NPC dialog           @bold{1 point, max 20}}
                     @item{For each line of dialog matching theme @bold{1 point, max 20}}]}]

@; ------ NPC BRONZE

@subsubsection{Bronze NPC Kata}

To earn this kata @(npc-kata) they need to:

Within five minutes,translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, a food item, and an NPC.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (custom-coin))
  #:food-list  (list (custom-food #:amount-in-world 10))
  #:npc-list   (list (custom-npc)))}

@; ------ NPC SILVER

@subsubsection{Silver NPC Kata}

To earn this kata @(npc-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, a food, and an NPC that has a custom
 name, walking mode, and starting tile.}

@margin-note*{The tiles are numbered from 0 to 8 (0 being the top-left tile).
The walking modes are: pace, wander, still, and follow.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (my-npc)
  (custom-npc #:name "Sara"
              #:mode 'wander
              #:tile 4))
 
 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (custom-coin))
  #:food-list  (list (custom-food #:amount-in-world 10))
  #:npc-list   (list (my-npc)))}

@; ------ NPC GOLD

@subsubsection{Gold NPC Kata}

To earn this kata @(npc-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, a food item, and a NPC with a custom
        name, walking mode, starting tile, and dialog.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (my-npc)
  (custom-npc #:name   "Sara"
              #:mode   'wander
              #:tile   4
              #:dialog (list "Why, hello there!" "Gotta go now!")))
 
 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (custom-coin))
  #:food-list  (list (custom-food #:amount-in-world 10))
  #:npc-list   (list (my-npc)))}

@; ------ NPC PLATINUM

@subsubsection{Platinum NPC Kata}

@margin-note*{Teaching Tip: Remember, there is no number of "required" katas by day.}

To earn this kata @(npc-kata) they need to:

Within ten minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, a food item, and more than one NPC.}

@margin-note*{Teaching Tip: Any mix of keywords here is okay.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (my-npc-1)
  (custom-npc #:name   "Sara"
              #:mode   'wander
              #:tile   4
              #:dialog (list "Why, hello there!" "Gotta go now!")))

 (define (my-npc-2)
  (custom-npc #:name     "Sonny"
              #:tile     6            
              #:mode     'pace))

 (define (my-npc-3)
  (custom-npc #:name     "Jason"
              #:mode     'follow))
 
 (survival-game
  #:avatar     (custom-avatar)
  #:coin-list  (list (custom-coin))
  #:food-list  (list (custom-food #:amount-in-world 10))
  #:npc-list   (list (my-npc-1)
                     (my-npc-2)
                     (my-npc-3)))}

@; ------ CRAFTER KATAS ------ IN PROGRESS

@subsection{Crafter Katas - @italic{(Day 6)}}

@subsubsection{Paper Crafter Kata}

To earn this kata @(meta-kata) they need to:

@italic{Recite the amount of points they get from Crafters in their game, in less than 1 minute.}

@itemlist[@item{Crafter points:   
           @itemlist[@item{Each Crafter                                @bold{1 point, max 5}}
                     @item{Any Crafter within 25 minutes
                                 @italic{(Sprint Bonus)                @bold{5 points}}}
                     @item{For each crafting recipe                    @bold{1 point, max 15}}
                     @item{For each crafting recipe matching theme     @bold{1 point, max 15}}]}]

@; ------ CRAFTER BRONZE

@subsubsection{Bronze Crafter Kata}

To earn this kata @(crafter-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, a food item, an NPC, and a crafter.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (survival-game
  #:avatar       (custom-avatar)
  #:coin-list    (list (custom-coin))
  #:food-list    (list (custom-food #:amount-in-world 10))
  #:npc-list     (list (custom-npc))
  #:crafter-list (list (custom-crafter)))}

@; ------ CRAFTER SILVER

@subsubsection{Silver Crafter Kata}

To earn this kata @(crafter-kata) they need to:

Within ten minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, an NPC, a crafter, a carrot, and
 new food item that has a custom sprite, name, healing power, and 1 in the world.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (define (carrot-cake)
  (custom-food #:sprite          (rectangle 40 20 "solid" "brown")
               #:name            "Carrot Cake"
               #:heals-by        25
               #:amount-in-world 1))

 (survival-game
  #:avatar       (custom-avatar)
  #:coin-list    (list (custom-coin))
  #:food-list    (list (custom-food #:amount-in-world 10)
                       (carrot-cake))
  #:npc-list     (list (custom-npc))
  #:crafter-list (list (custom-crafter)))}

@; ------ CRAFTER GOLD

@subsubsection{Gold Crafter Kata}

To earn this kata @(crafter-kata) they need to:

Within fifteen minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, an NPC, a crafter, a carrot, and
 new food item that has: a custom sprite, name, and healing power, a custom recipe,
 and a crafter that uses this recipe.}

To code of this type:

@codeblock{
#lang ts-game-jam-1

(define (carrot-cake)
  (custom-food #:sprite   (rectangle 40 20 "solid" "brown")
               #:name     "Carrot Cake"
               #:heals-by 25))

(define carrot-cake-recipe
  (recipe #:product     (carrot-cake)
          #:build-time  5
          #:ingredients (list "Carrot")
         ))

(define (my-oven)
  (custom-crafter #:menu (crafting-menu-set! #:recipes carrot-cake-recipe))) 

(survival-game
 #:avatar       (custom-avatar)
 #:coin-list    (list (custom-coin))
 #:food-list    (list (custom-food #:amount-in-world 10)
                      (carrot-cake))
 #:npc-list     (list (custom-npc))
 #:crafter-list (list (my-oven)))}

@; ------ CRAFTER PLATINUM

@subsubsection{Platinum Crafter Kata}

@margin-note*{Teaching Tip: Remember, there is no number of "required" katas by day.}

To earn this kata @(crafter-kata) they need to:

Within fifteen minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar, a coin, an NPC, two food items with their two
 recipes and a custom crafter that uses these recipes.}

To code of this type:

@codeblock{
#lang ts-game-jam-1

(define (carrot-cake)
  (custom-food #:sprite   (rectangle 40 20 "solid" "brown")
               #:name     "Carrot Cake"
               #:heals-by 25))

(define carrot-cake-recipe
  (recipe #:product     (carrot-cake)
          #:build-time  5
          #:ingredients (list "Carrot")
         ))

(define (carrot-cupcake)
  (custom-food #:sprite   (square 10 "solid" "brown")
               #:name     "Carrot Cupcake"
               #:heals-by 15))

(define carrot-cupcake-recipe
  (recipe #:product     (carrot-cupcake)
          #:build-time  10
          #:ingredients (list "Carrot Cake")
         ))

(define (my-oven)
  (custom-crafter #:menu (crafting-menu-set! #:recipes carrot-cake-recipe
                                                       carrot-cupcake-recipe))) 

(survival-game
 #:avatar       (custom-avatar)
 #:coin-list    (list (custom-coin))
 #:food-list    (list (custom-food #:amount-in-world 10)
                      (carrot-cake))
 #:npc-list     (list (custom-npc))
 #:crafter-list (list (my-oven)))}


@; ------ PRACTICE JAM

@subsection{Practice Game Jam Katas - @italic{(Day 7)}}

@subsubsection{Paper Practice Kata}

@margin-note*{Teaching Tip: Students should start coding this first and then they can customize their game.}

To earn this kata @(meta-kata) they need to:

@italic{Code a simple survival game in under 25 minutes.}

@codeblock{
 #lang ts-game-jam-1

 (survival-game
  #:avatar       (custom-avatar)
  #:coin-list    (list (custom-coin))
  #:food-list    (list (custom-food #:amount-in-world 10))
  #:npc-list     (list (custom-npc))
  #:crafter-list (list (custom-crafter)))}

If they complete this in less than 25 minutes during game jam they would
earn the following number of points:

@itemlist[@item{Avatar:  @bold{+1} Having an avatar 
                         @bold{+5} in less than 5 minutes 
                         @bold{= 6 points.}} 
          @item{Coin:    @bold{+1} Having a coin 
                         @bold{+5} in less than 10 minutes  
                         @bold{= 6 points.}} 
          @item{Food:    @bold{+1} Having a food item 
                         @bold{+5} in less than 15 minutes
                         @bold{= 6 points.}} 
          @item{NPC:     @bold{+1} Having an NPC  
                         @bold{+5} in less than 20 minutes
                         @bold{= 6 points.}} 
          @item{Crafter: @bold{+1} Having a crafter 
                         @bold{+5} in less than 25 minutes
                         @bold{= 6 points.}}
          @item{@bold{Total so far: @italic{+30} points.} }]

@; ------ CUSTOMIZE AVATAR

@subsubsection{Avatar Practice}

To earn this kata @(avatar-kata) they need to:

@italic{Customize their avatar.}

@(define (running-guy) (bitmap "images/running-guy.png"))

@codeblock{#lang ts-game-jam-1}
@racketblock[
 (define (my-avatar)
   (custom-avatar #:sprite (sheet->sprite #,(running-guy)
                                          #:columns 4)))
 
 (survival-game
  #:avatar       (my-avatar)
  #:coin-list    (list (custom-coin))
  #:food-list    (list (custom-food #:amount-in-world 10))
  #:npc-list     (list (custom-npc))
  #:crafter-list (list (custom-crafter)))]

With this new code you would get the following points:

@itemlist[@item{Avatar:  @bold{+4} for animation frames @italic{(1 point per frame)}.}
          @item{@bold{Total so far: @italic{+34} points.} }]

@; ------ CUSTOMIZE COIN

@subsubsection{Coin Practice}

To earn this kata @(coin-kata) they need to:

@italic{Code and customize additional coins.}

@codeblock{
 #lang ts-game-jam-1
 
 (define (my-avatar)
   (...))
 
 (define (red-coin)
   (custom-coin #:sprite (circle 5 'solid 'red)
                #:name "red coin"
                #:amount-in-world 6
                #:value 20
                ))

 (define (blue-coin)
   (custom-coin #:sprite (circle 5 'solid 'blue)
                #:name "blue coin"
                #:amount-in-world 4
                #:value 40
                ))

 (define (green-coin)
   (custom-coin #:sprite (circle 5 'solid 'green)
                #:name "green coin"
                #:amount-in-world 2
                #:respawn? #f
                #:value 60
                ))

 (survival-game
  #:avatar       (my-avatar)
  #:coin-list    (list (red-coin)
                       (blue-coin)
                       (green-coin))
  #:food-list    (list (custom-food #:amount-in-world 10))
  #:npc-list     (list (custom-npc))
  #:crafter-list (list (custom-crafter)))}

With this new code you would get the following points:

@itemlist[@item{Coin:  @bold{+2} for coins  @italic{(1 point per coin; we already had points for one coin)}.}
          @item{Coin:  @bold{+3} for coins matching theme  @italic{(1 point per coin)}.}
          @item{@bold{Total so far: @italic{+39} points.}}
          @item{@italic{Additional possible points: @bold{+14}; code 7 additional theme matching coins.} }]

@; ------ CUSTOMIZE FOOD

@subsubsection{Food Practice}

To earn this kata @(food-kata) they need to:

@italic{Code and customize additional food items.}

@codeblock{
 #lang ts-game-jam-1

 (define (my-avatar)
   (...))

 (define (red-coin)
   (...))

 (define (blue-coin)
   (...))

 (define (green-coin)
   (...))

 (define (pineapple)
   (custom-food #:sprite          (star 5 'solid 'yellow)
                #:name            "pineapple"
                #:heals-by        5
                #:amount-in-world 10))

 (define (mango)
   (custom-food #:sprite          (star 5 'solid 'orange)
                #:name            "mango"
                #:heals-by        50
                #:amount-in-world 1
                #:respawn?        #f))

 (survival-game
   #:avatar       (my-avatar)
   #:coin-list    (list (red-coin)
                        (blue-coin)
                        (green-coin))
   #:food-list    (list (pineapple)
                        (mango))
   #:npc-list     (list (custom-npc))
   #:crafter-list (list (custom-crafter)))}

With this new code you would get the following points:

@itemlist[@item{Food:  @bold{+1} for food item  @italic{(1 point per food; we already had points for one food item)}.}
          @item{Food:  @bold{+2} for food items matching theme  @italic{(1 point per food item)}.}
          @item{@bold{Total so far: @italic{+42} points.}}
          @item{@italic{Additional possible points: @bold{+16}; code 8 additional theme matching food items.} }]


@; ------ CUSTOMIZE NPC

@subsubsection{NPC Practice Kata}

To earn this kata @(npc-kata) they need to:

@italic{Code and customize additional NPCs.}

@codeblock{
 #lang ts-game-jam-1

 (define (my-avatar)
   (...))

 (define (red-coin)
   (...))

 (define (blue-coin)
   (...))

 (define (green-coin)
   (...))

 (define (pineapple)
   (...))

 (define (mango)
   (...))

 (define(my-npc-1)
  (custom-npc #:position (posn 100 100)
              #:tile     1
              #:name     "Sara"
              #:mode     'pace
              #:dialog   (list "Hello!"
                               "I'm busy right now."
                               "Bye!")))
              
(define(my-npc-2)
  (custom-npc #:position (posn 100 200)
              #:tile     2
              #:name     "Sonny"
              #:mode     'wander
              #:dialog   (list "I'm hungry!"
                               "I can't find any food.")))

(survival-game
 #:avatar       (my-avatar)
 #:coin-list    (list (red-coin)
                      (blue-coin)
                      (green-coin))
 #:food-list    (list (pineapple)
                      (mango))
 #:npc-list     (list (my-npc-1)
                      (my-npc-2))
 #:crafter-list (list (custom-crafter)))}

With this new code you would get the following points:

@itemlist[@item{NPC:  @bold{+1} for an NPC  @italic{(1 point per NPC; we already had points for one NPC)}.}
          @item{NPC:  @bold{+2} for NPCs matching theme  @italic{(1 point per NPC)}.}
          @item{NPC:  @bold{+5} for lines of dialog  @italic{(1 point per line)}.}
          @item{NPC:  @bold{+5} for lines of dialog matching theme  @italic{(1 point per line)}.}
          @item{@bold{Total so far: @italic{+50} points.}}
          @item{@italic{Additional possible points: @bold{+33}; code 3 additional NPCs, and add 15 lines of
            theme matching dialog.} }]

@; ------ CUSTOMIZE CRAFTER

@subsubsection{Crafter Practice Kata}

To earn this kata @(crafter-kata) they need to:

@italic{Code and customize additional crafters.}

@codeblock{
 #lang ts-game-jam-1

 (define (my-avatar)
   (...))

 (define (red-coin)
   (...))

 (define (blue-coin)
   (...))

 (define (green-coin)
   (...))

 (define (pineapple)
   (...))

 (define (mango)
   (...))

 (define(my-npc-1)
   (...))
              
(define(my-npc-2)
   (...))

(define (kiwi)
  (custom-food #:sprite (star 5 'solid 'brown)
               #:name "kiwi"
               #:heals-by 50
               ))

(define (frozen-pineapple)
  (custom-food #:sprite (star 10 'solid 'yellow)
               #:name "frozen pineapple"
               #:heals-by 15
               ))

(define kiwi-recipe
  (recipe #:product     (kiwi)
          #:build-time  5
          #:ingredients (list "pineapple" "mango")
         ))
 
(define mango-recipe
  (recipe #:product     (mango)
          #:build-time  10
          #:ingredients (list "pineapple")
         ))

(define frozen-pineapple-recipe
  (recipe #:product     (frozen-pineapple)
          #:build-time  15
          #:ingredients (list "pineapple")
         ))
 
(define (oven-crafter)
  (custom-crafter #:menu (crafting-menu-set! #:recipes kiwi-recipe
                                                       mango-recipe)
                  #:tile 1))

(define (freezer-crafter)
  (custom-crafter #:menu (crafting-menu-set! #:recipes frozen-pineapple-recipe)
                  #:tile 2))

(survival-game
 #:avatar       (my-avatar)
 #:coin-list    (list (red-coin)
                      (blue-coin)
                      (green-coin))
 #:food-list    (list (pineapple)
                      (mango)
                      (kiwi)
                      (frozen-pineapple))
 #:npc-list     (list (my-npc-1)
                      (my-npc-2))
 #:crafter-list (list (oven-crafter)
                      (freezer-crafter)))}

With this new code you would get the following points:

@itemlist[@item{Food:  @bold{+2} for food item  @italic{(1 point per food item)}.}
          @item{Food:  @bold{+2} for food items matching theme  @italic{(1 point per food item)}.}
          @item{Crafter:  @bold{+1} for a crafter  @italic{(1 point per crafter; we already had points for one crafter)}.}
          @item{Crafter:  @bold{+3} for recipes  @italic{(1 point per recipe)}.}
          @item{Crafter:  @bold{+3} for recipes matching theme  @italic{(1 point per recipe)}.}
          @item{@bold{Total so far: @italic{+61} points.}}
          @item{@italic{Additional possible points: @bold{+27}; code 3 additional crafter, and add 12 more
            theme matching recipes.} }]

@subsection{Collaboration Katas}

<Teaching Katas>

* A badge for how you help someone else earn a badge.



For any badge above, if you have already earned it and you've
earned the teaching badge, you can get a badge for helping
someone earn a badge.


@subsection{Competition Katas}

<Practice Jam Katas>

Do a 1 hour game jam.
Do a 1 hour game jam.  Get __ points.
Do a 1 hour game jam.  Get __ points.
Do a 1 hour game jam.  Get __ points.

<Compete in a real game Jam>

1st Competition
2nd Competition
3rd Competition
4th Competition
5th Competition
...




TODO: Somewhere, say something about doing a
coding phase and an art phase...