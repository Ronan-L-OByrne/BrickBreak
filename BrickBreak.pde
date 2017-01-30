/*Brick Break Game, Object Oriented Programming Assignment: Year 2 ~ Christmas --SECOND ATTEMPT--
  
  This Program be a brick break like game which meets all of the requirements laid out in the assignment brief

  Date Begun: 23/01/2016;    Date Finished: xx/xx/xxxx;
  Author: Ronan O'Byrne, C15332036;
*/

// Global Variables //
boolean[] keys = new boolean[700];
ArrayList<Player> objPlayer = new ArrayList<Player>();
ArrayList<Ball> objBall = new ArrayList<Ball>();
ArrayList<Destruct> Grid = new ArrayList<Destruct>();
boolean start;
PFont titleFont;
int menu = 0;

// Setup //
void setup()
{
    size(600, 800);
    background(20, 20, 75);
    
    Player tempPlayer = new Player(1);
    objPlayer.add(tempPlayer);
    
    Ball tempBall = new Ball();
    objBall.add(tempBall);
    
    start = false;
    titleFont = loadFont("Leelawadee-Bold-48.vlw");
}//end setup

// Draw //
void draw()
{
    if(menu == 0)
    {
        Menu();
    }//end if
    else if(menu == 1)
    {
        instructBrickBreak();
    }//end if
    else if(menu == 2)
    {
        instructPong();
    }//end if
    else if(menu == 3)
    {
        brickBreak();
    }//end else if
    else if(menu == 4)
    {
        Pong();
    }//end else
}//end draw

void createGrid()
{
    Destruct temp = new Destruct();
    for(int i=0; i<5; i++)
    {
        for(int j=0; j<10; j++)
        {
            int typeChk = (int)(random(0, 50));
            if(typeChk <= 40)
            {
                temp = new NormalBlock((width*(.145))+width*((.1775)*i), (height*(.1))+height*((.0375)*j));
                Grid.add(temp);
            }//end else if
            else if(typeChk > 40 && typeChk <= 45)
            {
                temp = new PowerBlock((width*(.145))+width*((.1775)*i), (height*(.1))+height*((.0375)*j));
                Grid.add(temp);
            }//end else if
            else if(typeChk > 45 && typeChk <= 50)
            {
                temp = new HazardBlock((width*(.145))+width*((.1775)*i), (height*(.1))+height*((.0375)*j));
                Grid.add(temp);
            }//end else if
        }//end for(j)
    }//end for(i)
}//end createGrid