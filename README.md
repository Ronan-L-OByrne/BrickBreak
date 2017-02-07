# BrickBreak and Pong (2 in 1 Delux)
This is a simple program that contains two games, BrickBreak and Pong.

The project was written in the Processing IDE as my Year 2 Christmas assignment for the Object 
Oriented Programming module while studying Computer Science (Hons) at the Dublin Institute of 
Technology.

Course Code: DT228/2, Student Number: C15332036.

The assignment was to use Processing to create a game using the skills we learned during the 
year sofar and preferably skills we learned in our own time, the game should meet all of the 
requirements laid out in the brief.

Link to video of the sketch running:
 
# Contents
The project contains two games, BrickBreak and Pong, that the user can play in various modes
or specate the computer playing.

It Contains:

1. A Menu that allows you the pick the game you want to play.

2. BrickBreak, which contains:

	1. An instruction Page.

	2. A leaderboard that is read into and written from the program.
	
	3. Initials enter screen that will be used when writting into the leaderboard.

	4. Normal game that allows the user to play the game.

	5. Spectator mode that allows the user to watch the AI play the game.
	
3. Pong, which contains:

	1. An instruction Page.

	2. 1 Player mode where the user plays against an AI.
	
	3. 2 Player mode which allows the user to play against a friend.

	4. Spectator mode that allows the user to watch the AI play the game.

# BrickBreak Controls
* Arrow Keys to navigate the initial select screen, Enter over the enter button to start the game

* Left and Right Arrows to move the paddle.

* Up Arrow to start the game.

* Shift to return to the main menu.

#  Pong Controls
* Player 1
	* Left and Right Arrows to move the paddle.

	* Up Arrow to start the game.
	
* Player 2
	* A and D Keys to move the paddle.

	* W Key to start the game.

* Shift to return to the main menu.

# Key Notes
* Uses Polymorphism and Inheritence for various classes most notably with the Block class.

* Fully scalable and functional at any resolution.

* Basic AI programmed to play against the player or itself.

* Shift brings the user back to the Main Menu from any other screen.

* Particle effects occur whenever the user breaks a block in BrickBreak.

* Particles gradually become transparent before being removed from the ArrayList.

* Reads and writes a leaderboard to and from a .csv file.

* User is able to enter their initials before playing BrickBreak.

* Multiple balls can be used with varying speeds in BrickBreak at any one time.

* Much of the functionallity of the program is done throught methods.

* In BrickBreak if the Ball goes directly between two blocks then it may destroy the whole row.