// Global Variables //
boolean[] keys = new boolean[500];
Player P1;
ArrayList<Destruct> Grid = new ArrayList<Destruct>();

// Setup //
void setup()
{
    size(600, 800);
    background(20, 20, 75);
    
    P1 = new Player();
    
    for(int i=0; i<50; i++)
    {
        for(int j=0; i<10; i++)
        {
          
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
    
    P1.renderBlock();
    P1.updatePlayer();
}//ned draw