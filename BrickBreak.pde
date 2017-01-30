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
    
    Player tempPlayer = new Player();
    objPlayer.add(tempPlayer);
    
    Ball tempBall = new Ball();
    objBall.add(tempBall);
    
    start = false;
    titleFont = loadFont("Leelawadee-Bold-48.vlw");
    
    createGrid();
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
        instructBrickBreak();
    }//end if
    else
    {
        if(Grid.size() == 0)
        {
            GameOver(true);
        }//end if
        else if(objBall.size() == 0)
        {
            GameOver(false);
            
            for(int i=0; i<Grid.size(); i++)
            {
                Grid.get(i).renderBlock();
            }//end for
        
            fill(255);
            textSize((width+height)*(.05));
            text("YOU LOSE", width*(.5), height*(.3));
        }//end else if
        else
        {
            background(20, 20, 75);
            strokeWeight((width+height)*(.0025));
            stroke(255, 195, 100);
            fill(125, 125, 180);
            rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
            
            for(int x=0; x<objBall.size(); x++)
            {
                if((objBall.get(x).ballPos.y) > height*(.97))
                {
                    objBall.remove(x);
                }//end if
                else
                {
                    objBall.get(x).updateBall();
                    objBall.get(x).renderBall();
                    
                    for(int i=0; i<Grid.size(); i++)
                    {
                        Grid.get(i).renderBlock();
                        Grid.get(i).checkBlock(i, x);
                    }//end for
                    objPlayer.get(0).checkPlayer(x);
                }//end else
            }//end for
            
            objPlayer.get(0).updatePlayer();
            objPlayer.get(0).renderBlock();
        }//end else
    }//end else
}//end draw

void GameOver(boolean val)
{
    strokeWeight((width+height)*(.0025));
    
    if(val)
    {
        for(int i=0; i<objBall.size(); i++)
        {
            objBall.get(i).renderBall();
        }//end for
        
        if(checkKey(ENTER))
        {
            objBall.clear();
            Grid.clear();
            
            createGrid();
            
            Ball tempBall = new Ball();
            objBall.add(tempBall);
            
            start = false;
        }//end if
        
        background(20, 100, 35);
        stroke(255);
        fill(125, 180, 125);
        rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
        
        for(int i=0; i<objBall.size(); i++)
        {
            objBall.get(i).renderBall();
        }//end for
        
        fill(255);
        textSize((width+height)*(.05));
        text("YOU WIN", width*(.5), height*(.3));
    }//end if
    else
    {
        if(checkKey(ENTER))
        {
            objBall.clear();
            Grid.clear();
            
            setup();
        }//end if
        
        background(100, 20, 35);
        stroke(0);
        fill(180, 125, 125);
        rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
    }//end else
    
    objPlayer.get(0).renderBlock();
}//end GameOver()

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