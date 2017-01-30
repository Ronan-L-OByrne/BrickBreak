/*Brick Break Game, Object Oriented Programming Assignment: Year 2 ~ Christmas --SECOND ATTEMPT--
  
  This Program be a brick break like game which meets all of the requirements laid out in the assignment brief

  Date Begun: 23/01/2016;    Date Finished: xx/xx/xxxx;
  Author: Ronan O'Byrne, C15332036;
*/

// Global Variables //
boolean[] keys = new boolean[700];
Player P1;
ArrayList<Ball> objBall = new ArrayList<Ball>();
ArrayList<Destruct> Grid = new ArrayList<Destruct>();
boolean start;
PFont titleFont;
boolean menu = true;

// Setup //
void setup()
{
    size(600, 800);
    background(20, 20, 75);
    
    P1 = new Player();
    
    Ball tempBall = new Ball();
    objBall.add(tempBall);
    
    start = false;
    titleFont = loadFont("Leelawadee-Bold-48.vlw");
    
    createGrid();
}//end setup

// Draw //
void draw()
{
    if(menu)
    {
        background(20, 20, 75);
        fill(200, 100, 70);
        strokeWeight((width+height)*(.002));
        stroke(255);
        rect(width*(.2), height*(.09), width*(.605), height*(.07), (width+height)*(.01));
        
        fill(255);
        textFont(titleFont, (height+width)*(.04));
        textAlign(CENTER,CENTER);
        text("BRICK BREAK", width*(.5), height*(.125));
        
        textFont(titleFont, (height+width)*(.025));
        text("CONTROLS", width*(.5), height*(.25));
        text("_____________", width*(.5), height*(.25));
        text("UP: BEGIN GAME", width*(.5), height*(.3));
        text("LEFT: MOVE LEFT", width*(.5), height*(.35));
        text("RIGHT: MOVE RIGHT", width*(.5), height*(.4));
        
        text("GAME", width*(.5), height*(.55));
        text("_______", width*(.5), height*(.55));
        text("OBJECTIVE: HIT AND DESTROY ALL", width*(.5), height*(.6));
        text("THE BLOCKS", width*(.5), height*(.65));
        text("GREEN BLOCKS: SPAWN AN EXTRA", width*(.5), height*(.7));
        text("BALL", width*(.5), height*(.75));
        text("RED BLOCKS: SPEED UP BALLS", width*(.5), height*(.8));
        text("THAT HIT IT", width*(.5), height*(.85));
        
        text("ENTER TO CONTINUE", width*(.5), height*(.95));
        text("_________________________", width*(.5), height*(.95));
        
        if(checkKey(ENTER))
        {
            menu = false;
        }//end if
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
                    P1.checkPlayer(x);
                }//end else
            }//end for
            
            P1.updatePlayer();
            P1.renderBlock();
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
    
    P1.renderBlock();
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