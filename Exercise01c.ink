/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 In the assignment:
 * Add four more knots
 * Assign at least TWO new variables through player choices
 * Print at least one of the variables to the player in a passage
 * Check the value of a variable and have it do something
*/

VAR pet_name = ""
VAR torches = 0
VAR east_cave_lit = 0
VAR west_cave_lit = 0
VAR coins = 0



-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you. The cave might be less intimidating then. What was your pet's name?
* [Charlie] 
    ~ pet_name = "Charlie" 
    -> cave_mouth
* [Susan] 
    ~ pet_name = "Susan" 
    -> cave_mouth
* [Spot] 
    ~ pet_name = "Spot" 
    -> cave_mouth



== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You have {torches} torches

You have {coins} coins


+ {east_cave_lit == 0} [Take the east tunnel] -> east_tunnel
+ {east_cave_lit == 1} [Take the east tunnel] -> east_tunnel_lit
+ {west_cave_lit == 0} [Take the west tunnel] -> west_tunnel
+ {west_cave_lit == 1} [Take the west tunnel] -> west_tunnel_lit
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit 
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel. It is very dark, you can't see anything.

{ pet_name == "Spot": Spot would love it here in the west} 

* {torches > 0} [Light Torch] -> west_tunnel_lit 
+ [Go Back] -> cave_mouth
-> END

== west_tunnel_lit == 
The light of your torch reveals a skeleton dressed in fancy clothing.
~ west_cave_lit = 1
+ [Go Back] -> cave_mouth
+ [Examine skeleton] -> examine_skeleton

== examine_skeleton ==
The skeletons eyes glow with a supernatural light and its bones creak as it stands up to greet you. {coins >= 100: "You didn't happen to steal those coins from me did you?"}
* {coins >= 100} [Lie] -> lie_skeleton
* {coins >= 100} [Confess] -> confess_skeleton
+ [Go Back] -> west_tunnel_lit

== lie_skeleton ==
If you say so...
+ [Go Back] -> west_tunnel_lit

== confess_skeleton ==
Well give them back then!
* [Return coins] -> return_coins
* [Refuse] -> death

== death ==
As soon as your words leave your mouth, you feel extreme tension in your head. Seconds later your head explodes causing instant death.
-> END

=== return_coins ===
I'll let you off easy this time.
~ coins = 0
+ [Go Back] -> west_tunnel_lit

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
~ east_cave_lit = 1
+ [Go Back] -> cave_mouth
* [Gather coins] -> coin_pickup

=== coin_pickup ===
You grab as many coins as you can carry.
~ coins = coins + 100
* [Go Back] -> east_tunnel_lit


-> END