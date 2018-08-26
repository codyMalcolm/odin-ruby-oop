# Ruby Object Oriented Programming

## Tic-Tac-Toe

## Objective

To build a command line tic-tac-toe game for two human players.

#### Specifications

##### Main

1. Game should make effective use of Object-Oriented Programming concepts
2. Specific mention is given to take care that information is shared only more than necessary
3. Game is to be played on the command line
4. The board should be displayed between turns

#### Learning Objectives

Develop skills with Object-Oriented programming. Develop Ruby skills.

## Author's Notes

#### Preliminary Thoughts

I have some prior experience with Object Oriented concepts from a Java course I took in the past, so that is helpful. Still, this should be a valuable experience as I probably would not naturally use classes as often as I should. For example, the instructions recommend thinking about what should be a class versus an instance variable or method. I immediately considered squares as candidates for being a class, but it was not instantly obvious to me what other data could be represented as a class. Since, I've recognized how beneficial it would be to also represent the players as a class, and how that would make a lot of sense as well.

#### Final Thoughts

Further to the above, I considered but ultimately decided not to make the game a class to maintain a state. I ultimately decided that doing so was not necessary because there was only ever going to be one game at a time and therefore creating a class was needless complexity. I went a little above and beyond, allowing players to choose their names, their symbols, and giving players the ability to play multiple games.

I had a bit of issue dealing with Ruby's strict scoping, as in other languages I've worked with, variables are in scope in children of a parent function. It seems with Ruby this is not the case, so once I had the program working I did some refactoring to style the program in more of a functional style.

This project was a bit more involved than what I expected it would be, but the creation process felt very natural. I started by creating the two classes in their entirety, and testing them to make sure they worked. Then, I created the loop that handles new games, starting with the prompt to play a new game (and corresponding validation). Once that was settled, I did the initialization of a new game state, including selecting the start player at random and the display board function. Finally, I created the actual turn loop and associated helper functions, including checking the conditions of victory. Once all that was completed, I did a quick refactor to fix the scopes that were too broad, and remove one of the instance variables in the Square class. There's a couple of things I would do differently if I was to try to "perfect" the program, most notably the way the program determines which player to declare the winner in the final statement is...gross. The logic is sound, technically, but I would never do it that way in a project that would require modification or maintenance in the future. Overall though I feel a lot better about the code after the final refactor.

## Miscellaneous

Read more about these projects at [The Odin Project.](https://www.theodinproject.com/courses/ruby-programming/lessons/oop)
