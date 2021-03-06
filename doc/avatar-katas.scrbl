#lang scribble/manual

@title{Avatar Katas - @italic{(Day 2)}}


@(require 2htdp/image)
@(require ts-game-jam-1)


@(define (meta-kata)     (circle 10 'outline 'black))
@(define (avatar-kata)   (circle 10 'solid   'orange))


@margin-note*{Teaching Tip: Start class reciting the first two ThoughtSTEM core values.}

@section{Paper Avatar Kata}

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

@section{Bronze Avatar Kata}

To earn this kata @(avatar-kata) they need to:

Within five minutes, translate an English sentence of this type:

@italic{Make a game that has an avatar in it.}

To code of this type:

@codeblock{
 #lang ts-game-jam-1

 (survival-game
   #:avatar (custom-avatar))}

@; ------ AVATAR SILVER

@section{Silver Avatar Kata}

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

@section{Gold Avatar Kata}

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