// Global Variables //
boolean[] keys = new boolean[500];
Player P1;
Ball objBall;
ArrayList<Destruct> Grid = new ArrayList<Destruct>();
boolean start = false;

// Setup //
void setup()
{
    size(600, 800);
    background(20, 20, 75);
    
    P1 = new Player();
    objBall = new Ball();
    
    Destruct temp;
    for(int i=0; i<8; i++)
    {
        for(int j=0; j<10; j++)
        {
            int typeChk = (int)(random(0, 80));
            if(typeChk <= 70)
            {
                temp = new Destruct((width*(.115))+width*((.11)*i), (height*(.095))+height*((.03)*j), 1);
                Grid.add(temp);
            }//end else if
            else if(typeChk > 70 && typeChk <= 75)
            {
                temp = new Destruct((width*(.115))+width*((.11)*i), (height*(.095))+height*((.03)*j), 2);
                Grid.add(temp);
            }//end else if
            else if(typeChk > 75 && typeChk <= 80)
            {
                temp = new Destruct((width*(.115))+width*((.11)*i), (height*(.095))+height*((.03)*j), 3);
                Grid.add(temp);
            }//end else if
        }//end for(j)
    }//end for(i)
}//end setup

// Draw //
void draw()
{
    strokeWeight((width+height)*(.0025));
    stroke(255, 195, 100);
    fill(125, 125, 180);
    rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
    
    P1.updatePlayer();
    P1.renderBlock();
    P1.checkPlayer();
    
    for(int i=0; i<Grid.size(); i++)
    {
        Grid.get(i).renderBlock();
        Grid.get(i).checkBlock(i);
    }//end for
    
    objBall.updateBall();
    objBall.renderBall();
}//ned draw