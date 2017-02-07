/*Brick Break Game, Object Oriented Programming Assignment: Year 2 ~ Christmas --SECOND ATTEMPT--
  
  This Program be a brick break and pong like games which meets all of the requirements laid out in the assignment brief

  Date Begun: 23/01/2016;    Date Finished: xx/xx/xxxx;
  Author: Ronan O'Byrne, C15332036;
*/

// Global Variables //
boolean[] keys = new boolean[700];                                   // Array to store whether or not a key is pressed

ArrayList<Player> objPlayer = new ArrayList<Player>();               // ArrayList to hold either 1 or 2 players 
ArrayList<Ball> objBall = new ArrayList<Ball>();                     // ArrayList to hold all the Balls on the screen at a given time
ArrayList<Destruct> Grid = new ArrayList<Destruct>();                // ArrayList to hold all of the Blocks in the grid
ArrayList<ParticleSystem> pSystem = new ArrayList<ParticleSystem>(); // ArrayList of Particle effects for when bricks are hit
ArrayList<Leaderboard> Lead = new ArrayList<Leaderboard>();          // ArrayList of the leaderboard for easy editing

boolean start;                                                       // Used to keep track of if the ball has been fired yet

PFont titleFont;                                                     // Font used throughout the Program

int menu = 0;                                                        // Dictates what menu or game the screen will display
float rad;                                                           // Used for the main menu effects and the initial select screen
char in1='A', in2='A', in3='A';                                      // Stores the User initials Before entering them to the class

// Setup //
void setup()
{
    // Sets the size of the screen
    size(600, 800);
    
    // Creates the first player and adds them to the ArrayList
    Player tempPlayer = new Player(1);
    objPlayer.add(tempPlayer);
    
    // Creates the first ball and adds them to the ArrayList
    Ball tempBall = new Ball();
    objBall.add(tempBall);
    objBall.get(0).speed = 5;
    
    //The ball has not been fired yet
    start = true;
    
    //Loads the font used in the sketch
    titleFont = loadFont("Leelawadee-Bold-48.vlw");
    
    //Load the BrickBreak Leaderboards
    loadData("LeaderBoard.csv");
}//end setup()

// Draw //
void draw()
{
    //Checks which game or menu the user is currently on
    if(menu == 0)
    {
        Menu();               // Game selection screen
    }//end if
    else if(menu == 1)
    {
        instructBrickBreak(); // Brick Break instruction creen
    }//end else if
    else if(menu == 2)
    {
        instructPong();       // Pong instruction screen
    }//end else if
    else if(menu == 3)
    {
        brickBreak(1);         // Brick Break game
    }//end else if
    else if(menu == 4)
    {              
        brickBreak(0);         // Brick Break game
    }//end else if
    else if(menu == 5)
    {
        Pong(1);              // Pong game (1 Player)
    }//end else if
    else if(menu == 6)
    {
        Pong(2);              // Pong game(2 Player)
    }//end else if
    
    //Allows the player to return from the menu from any screen
    if(checkKey(SHIFT))
    {
        objBall.clear();
        objBall.add(new Ball());
        
        if(menu == 3)
        {
            updateBoard(objPlayer.get(0).pScore);
            objPlayer.get(0).pScore = 0;
        }//end if
        
        menu = 0;
    }//end else if
}//end draw

//Used to create the grid used in the Brick Break game
void createGrid()
{
    Destruct temp; //Temporarily stores a block before writing it to the arraylist
    
    // Used to make a grid of blocks
    for(int i =0; i<5; i++)
    {
        for(int j=0; j<10; j++)
        {
            int typeChk = (int)(random(0, 49));
            if(typeChk <= 40)                        // Brick has an 80% chance to be a Normal Block
            {
                temp = new NormalBlock((width*(.145))+width*((.1775)*i), (height*(.1))+height*((.0375)*j));
                Grid.add(temp);
            }//end else if
            else if(typeChk > 40 && typeChk <= 45)   // Brick has a 10% chance to be a Power Block
            {
                temp = new PowerBlock((width*(.145))+width*((.1775)*i), (height*(.1))+height*((.0375)*j));
                Grid.add(temp);
            }//end else if
            else if(typeChk > 45 && typeChk < 50)   // Brick has a 10% chance to be a Hazard Block
            {
                temp = new HazardBlock((width*(.145))+width*((.1775)*i), (height*(.1))+height*((.0375)*j));
                Grid.add(temp);
            }//end else if
        }//end for(j)
    }//end for(i)
}//end createGrid