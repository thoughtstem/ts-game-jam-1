#lang scribble/manual
 
@title{Scholastic Game Jam}

Welcome to ThoughtSTEM's official Scholastic Game Jam rules.

What is the Scholastic Game Jam?  It's a competition in which
players have a limited amount of time to create a
video game on a theme announced on the day of the
competition.

Winning teams usually receive some kind of prize.

For more information, see the resources below.  

@table-of-contents[]

@section{How to Enter}

Note that the Scholastic Game Jam is for K-12 students --
not for adults.  Also, the ThoughtSTEM Scholastic Game Jam is a team
competition -- meaning that competitors must belong to an officially
registered team.

In order to belong to an officially registered team, your school
must be a ThoughtSTEM school.  This means that ThoughtSTEM has provided
a trained Game Jam coach and is running weekly practices at your school.
If this is the case, you don't need to worry about anything.
Your school's coach will register the school's competitors and team(s).

If your school is not yet a ThoughtSTEM school, please
reach out to us at contact@"@"thoughtstem.com.  Currently, any school
in the San Diego area is eligible to join the Game Jam league.

Note that if your child is already enrolled in a ThoughtSTEM
after school program, then the registration is already
taken care of.  And (unless we have announced otherwise)
the upcoming Game Jam is going to be held at your school.

Competitors who perform well at their local 
competitions @bold{may} be invited by their coaches to
participate in the regional competitions.

So to sum up:

@itemlist[@item{Local competitions will be organized by your coach and will be held at your school.}
          @item{Regional competitions may be entered by invitation only.}]

@section{Day of Competition}

On the day of competition (or before), the coach will
register each student on a school's team and will
also note which competitors will be competing solo
and which will be competing in pairs.

The players will sit in their designated area and
await the announcement of the Game Jam prompt.
Until the day of competition, the prompt is a closely
guarded secret.  When the prompt is announced, all
teams may begin working on their game immediately.
They may continue until the scoring phase begins.

During the scoring phase, judges will calculate a
@bold{game score} for each game created during the
Game Jam.  The @bold{game scores} will be summed to
produce the team's @bold{raw score}.  For the purposes
of ranking teams and determining winning teams, the @bold{raw score}
is divided by the number of games to get the team's @bold{final score}.

This prevents larger teams from having an unfair advantage over
smaller teams.

@subsection{Example}

Suppose a team consists of Jimmy, Sally, Marco, and Marta.
Suppose that Jimmy and Marco are competing as a pair.
Now, suppose the final game scores are as follows:

1) 100 points for Jimmy and Marco's game.
2) 100 points for Sally's game.
3) 100 points for Martha's game.

The sum of these game scores gives a @bold{raw score} of 300.  The @bold{final score}
for the team would be 300 points divided by the 3 games.

Or 100 points.

This is the score that judges will use to rank teams.
If no other team has a better @bold{final score} than 100, then
Jimmy, Sally, Marco, and Martha's team wins.

@section{How are Games Scored?}

Judges will use a semi-automated process score games.
It is partially automated, to facilitate fast judging.
But part of the score is subjective, to prevent competitors
"gaming the system" -- i.e. just jumping through the hoops
but without actually creating a fun, playable game.

The scoring process for the upcoming Game Jam is explained on
this page.

@subsection{Overview}

@bold{Game Type:} Survival Game with Crafting

@bold{Scorable Features:}

@itemlist[
 @item{Avatar}
 @item{Inventory Items}
 @item{Food}
 @item{Non-Player Characters}
 @item{Crafting/Recipes}]

@subsection{Score Sheet}

For convenience, we've created this scoresheet
for players, coaches, spectators, and judges to
use.  It is intended to serve as a quick overview
of the scoring system.  (For more details, though,
see the following sections.)

@(require "../scoring/scoresheet.rkt" racket)
@(scoresheet)

@(define (plus s)
   (text (~a "+" s) 24 'darkgreen))

@(define (minus s)
   (text (~a "-" s) 24 'darkred))


@subsection{Avatar}

The game must have an avatar that can be moved
with the arrow keys.  The avatar must lose health
over time and must gain health by eating food.

@bold{Sprint Bonus:}

@(plus 5) Have a player within the first 5 minutes of competition.

(NOTE: To claim this sprint bonus, a competitor must signal a judge
and demonstrate a working game with an avatar.  Signals must be made
before the 5 minute mark in order to gain the sprint bonus points.)

@bold{Computer-Scored Points:}

@itemlist[@item{@(plus 1) for having an avatar at all}
          @item{@(plus 1) per animation frame. Max @(plus 4)}]

@bold{Human-Scored Points:}

@itemlist[@item{@(plus 5) for having an avatar that matches the theme.}
          @item{@(plus 5) per animation frame that matches the theme.  Max @(plus 4)}]

Although the definition of "matching the theme" is always subjective
and up to the judges' discretions, some rules of thumb are:

@itemlist[@item{If the prompt implies a main character, the avatar should look like that.}
          @item{Animation frames should suggest locomotion.  Example: If the avatar is a space ship,
           a theme-matching animation might imply some kind of propultion system.  Example: If the avatar is a unicorn,
           a theme-matching animation might imply a unicorn walking.}]

@subsection{Example}

Suppose the Game Jam prompt is announced to be: "Slimes vs Unicorns.
Slimes have taken over the forest, and the unicorns must learn to
survive in the desert."

Suppose that within the first 5 minutes of the competition, Marco creates a
avatar that looks like a red circle.  This qualifies him for a +5 sprint bonus.

Suppose he goes on to create three animation frames of unicorn walking,
which his avatar use while walking and replaces the red circle with these
animation frames.  (The sprint bonus has already been awarded, so he does
not lose the bonus points.)

Assuming nothing changes about the avatar before the end of the Game Jam,
Marco's Avatar score would end up like this:

@(avatar-section #:sprint-bonus 5
                 #:avatar-points 1
                 #:animation-points 3
                 #:theme-avatar-points 1
                 #:theme-animation-points 3)

@subsection{Food}

The game must have food items that the avatar
can consume in-game.

@bold{Sprint Bonus:}

@(plus 5) Have a food item within the first 10 minutes of competition.

(NOTE: To claim this sprint bonus, a competitor must signal a judge
and demonstrate a working game with a food item.  Signals must be made
before the 10 minute mark in order to gain the sprint bonus points.)

@bold{Computer-Scored Points:}

@itemlist[@item{@(plus 1) for each food item in game. Max @(plus 10)}]

@bold{Human-Scored Points:}

@itemlist[@item{@(plus 1) for each food item that matches the theme. Max @(plus 10)}]

Although the definition of "matching the theme" is always subjective
and up to the judges' discretions, some rules of thumb are:

@itemlist[@item{If the prompt implies a main character, the food should be something that avatar might "eat".
           Example: If the avatar is a spaceship, some "food" might be a barrel of fuel.
           Example: If the avatar is a unicorn, some food might be berries.}
          @item{Any food items should seem like they belong in the world.  A barrel of fuel probably doesn't
           belong in a world full of unicorns.  (The exception is, of course, if the unicorn is a robotic unicorn --
           in which case perhaps a barrel of fule @bold{does} match the theme -- but berries would not.)}]

@subsection{Example}

Suppose (as in the example in the previous section) that
Marco creates three food items:

@itemlist[
   @item{Prickly Pears, which give the avatar @(plus 1) health}
   @item{Sand Bread, which gives the avatar @(plus 5) health}
   @item{Prickly Pear Pie, which gives the avatar @(plus 10) health}]

Also, suppose he created the berries within the first 10 minutes of
the competition.  This would qualify him for a @(plus 5) sprint bonus.

Assuming nothing changes related to food items before the end of the
competition, the final food score would look like:

@(food-section #:sprint-bonus 5
               #:food-points 3
               #:theme-food-points 3)

That would be a total of @(plus 11) points.  Added to his
previous score of @(plus 13), that would be @(plus 24) points so far!

@subsection{Non-Food Items}

The game must have non-food items that can be
picked up and used for crafting. 

Computer-Scored Points:

* +1 for each non-food item in game.  Max +10.
* +5 sprint bonus.  Implement at least one non-food
item within the first 15 minutes of the competition.

Human-Scored Points:

* +1 per non-food item for theme cohesion.  Max +10

@subsection{Example}

Suppose we continue our example from the previous section.
Marco creates on non-food item -- a Sand Grinding Rock.
But suppose he loses some time because he must track down a
bug in his code.  He ends up completing his Sand Grinding Rock by the 16-minute
mark.  This means he cannot get the sprint bonus in this category.

However, he does recieve +1 for having an item and +1 for
the fact that a Sand Grinding Rock does sound like something a unicorn
might need to survive in a desert.

That's +2 in this category.  He's at +32 so far.

@subsection{Non-Player Characters}

The game must have Non-Player Characters (NPCs). 

Computer-Scored Points:

* +1 for each NPC in game.  Max +5.
* +1 for each line of dialog an NPC has (Max +4 per NPC).
* +5 sprint bonus.  Implement at least one NPC
within the first 20 minutes of the competition.

Human-Scored Points:

* +1 per NPC for theme cohesion.  Max +5.
* +1 for each line of dialog an NPC has that is cohesive with
the theme (Max +4 per NPC).

@subsection{Example}

Suppose, in our running example, Marco creates
1 NPC by the 19-minute mark.

The NPC is a desert nomad with two lines of
dialog about the weather in the desert and one
line about how to make Prickly Pear Pie.

Marco would receive the sprint bonus of +5, along
with +1 for having an NPC and +3 for its lines of dialog.
Since the NPC looks it belongs in the
desert, Marco would also get an additional +1.  And
since the dialog lines are all theme-cohesive, he would
get an additional +3.

That's a total of: +13.  He now has +45 total.

@subsection{Crafting/Recipes/Tech-tree}

The game must have "recipes", allowing new items
to be created from existing ones.

A recipe involves three things:

* Inputs.  A list of input items.  E.g. marshmallows,
chocolate, and crackers.
* Output.  A single output item.  E.g. a chocolate s'more.
* Trigger. An in-game entity that serves as the place
where the recipe can be triggered. E.g. a campfire.

Note that the word "recipe" does not imply
that the inputs or outputs must be food.  Here's
another example:

* Inputs.  A list of input items.  E.g. wood and matches.
* Output.  A single output item.  E.g. a campfire.
* Trigger. An in-game entity that serves as the place
where the recipe can be triggered. E.g. a firepit.

And yes, the output of one recipe can become
either the inputs of another recipe or even the
trigger for another recipe.  For example, to make
s'mores, you may have to first produce a campfire.

Computer-Scored Points:

* +1 for each recipe in game.  Max +10.
* +1 for each ingredient in a recipe.  Max +4 per recipe.
* +5 sprint bonus.  Implement at least one recipe
within the first 25 minutes of the competition.

Human-Scored Points:

* +1 per recipe for theme cohesion.  Max +10
* +1 for each theme-cohesive ingredient in a recipe.  Max +4 per recipe.

Note that all recipes must be craftable in game.

@subsection{Example}

Suppose, in our running example, Marco creates two
recipes:

* Triggered at the cooking cauldron: Prickly Pears + Sand Bread can make Prickly Pear Pie.
* Triggered at the cooking cauldron: Sand + Sand Grinding Rock makes Sand Bread

These recipes form a chain (one is the input to another)

<Tree or chain?  Can we simplify this??
[>

@section{Documentation}

All games at the next Scholastic Game Jam will be launched with the same
function:

@racketblock[
             (survival-game)
             ]

This alone doesn't do anything interesting.  It just creates a "game"
with no characters, no food, no NPCs -- nothing really, except a green
background:

@(rectangle 480 360 'solid 'darkgreen)

Contestants will build atop this basic "game" during the Game Jam for
one hour after the prompt is announced.
The resulting games are what will be judged during Game Jam.

Note that every time you run @racket[(survival-game ...)], you will
also get (in the interations window) an estimated score card for your
game:

@(scoresheet)

Running @racket[(survival-game)] with no parameters produces an empty
score sheet.

<Game jam flier?>

<API for Scoring a game?>



@subsection{Avatar}

@defproc[(basic-avatar [appearance (or/c image? animated-sprite?) #f])
         entity?]{
  Returns an avatar entity with health bar and inventory already setup.

  In its simplest form, you can add a basic avatar to the game like this:

  @racketblock[
               (survival-game
                #:avatar (basic-avatar))
  ]

  With a more complex form, you can declare that the avatar should look
  like a blue square:

  @racketblock[
               (survival-game
                #:avatar (basic-avatar (square 50 'solid 'blue)))
  ]

 You can also specify that the avatar should use an animation -- i.e.
 to give the avatar a walking animation.

 To make an animation, you must convert a still image to a collection of
 animation frames:

  @racketblock[
               (define (my-still-image)
                 (random-character-row))
               
               (define (my-animation)
                 (row->animation (my-still-image)))
               
               (survival-game
                #:avatar (basic-avatar (my-animation)))
  ]

  Note the 3 step process above.  It is a common pattern:

  @itemlist[@item{First declare a still image.  This can be any image
             with a collection of animation frames arranged in a row.}
            @item{Then convert the still image into an animation with
              @racket[row->animation].}
            @item{Then start a new @racket[survival-game] with an avatar
              that uses that animation.}]
}



Food
Non-Food
NPC
Recipes


@section{Training Recommendations}

@subsection{Training Badges}

@(require 2htdp/image)

Coaches will train competitors by helping them acquire the necessary skills to excel
at the Game Jam competition.  Competitors who have mastered these skills will receive
badges.  These badges serve as visual, wearable representations of a competitor's hard work.

Badge key:

@(define (meta-badge) (circle 10 'solid 'gray))
@(define (avatar-badge) (circle 10 'solid 'red))
@(define (food-badge) (circle 10 'solid 'orange))
@(define (non-food-badge) (circle 10 'solid 'gold))
@(define (npc-badge) (circle 10 'solid 'green))
@(define (recipe-badge) (circle 10 'solid 'blue))

@(meta-badge)     - @bold{Meta Badges} - for skills related to excelling as a Game Jam competitor.

@(avatar-badge)   - @bold{Avatar Badges} - for skills related to creating avatars

@(food-badge)     - @bold{Food Badges} - for skills related to creating food items

@(non-food-badge) - @bold{Non-Food Badges} - for skills related to creating non-food items

@(npc-badge)      - @bold{NPC Badges} - for skills related to creating NPCs

@(recipe-badge)   - @bold{Recipe Badges} - for skills related to creating recipes



@subsubsection{Day 1 Badges}

These are called "day 1" badges because we recommend that competitors earn these
badges before earning any other badges.  They help reenforce team values and help
orient the competitors toward the challenges that face them.

@(meta-badge) @bold{Core Values: Level 1} (1 minute.)

@italic{Can recite the first three ThoughtSTEM core values}

@itemlist[@item{It's not about my code.     It's about what I can code.}
          @item{It's not about me.          It's about us.}]


[Hand motions?]


@(meta-badge) @bold{Game Jam Specs: Level 1} (1 minute.)

@italic{Can recite the specs for the upcoming Game Jam.}

@itemlist[@item{Game Type: Survival Game}
          @item{Time Limit: 40 minutes}
          @item{Categories:
           @itemlist[@item{Avatar:                 20 points}
                     @item{Food Items:             25 points}
                     @item{Non-Food Items:         25 points}
                     @item{Non-Player Characters:  30 points}
                     @item{Crafting:               55 points}]}]

This badge should be re-earned any time the specs change.  Or any time there's a new upcoming jam.
The specs do change from time to time.  (And that in itself is a valuable lesson.)


@(meta-badge) @bold{Meta Kata: Level 1} (1 minute.)

@italic{Can recite answer to: What is a Kata badge?}

A Kata is a small piece of code that I memorize and can write:
@itemlist[@item{Calmly}
          @item{Quickly}
          @item{Accurately}]


@(avatar-badge) @bold{First Kata} (5 minute)

Within five minutes, the student can translate an English sentence of this type:

@italic{Make an avatar that looks like a red circle that is 80 pixels across.}

To code of this type:

@racketblock[
 (survival-game-jam
  #:player (basic-player-entity (square 40 'solid 'red)))
 ]

Note: To award this badge, a student should be able to do the above
in under 1 minute.  But doing it once is too easy.  The student should
do this multiple times with different shapes: e.g. blue square, green star,
etc.





<Kata Badges>

avatar:   5 minutes, 2.5 minutes
Food:     5 minutes, 2.5 minutes
Non-Food: 5 minutes, 2.5 minutes
NPC:      5 minutes, 2.5 minutes
Recipes:  5 minutes, 2.5 minutes


<Sprint Badges>

Under 5 minutes:  avatar + Food
Under 10 minutes: avatar + Food + Non-Food
Under 15 minutes: avatar + Food + Non-Food + NPC
Under 15 minutes: avatar + Food + Non-Food + NPC + Recipe


<x10 Badges>

Under 5 minutes:  10 different NPCs
Under 5 minutes:  10 different Non-Food Items
Under 5 minutes:  10 different Food Items
Under 5 minutes:  10 different Recipes
Under 10 minutes: 10 different Recipes in a tree


Note that these badges must be "refreshed".
You don't get to keep them if you're not practicing...

@subsection{Collaboration Badges}

<Teaching badges>

* A badge for how you help someone else earn a badge.



For any badge above, if you have already earned it and you've
earned the teaching badge, you can get a badge for helping
someone earn a badge.


@subsection{Competition Badges}

<Practice Jam Badges>

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

