class Block
{
    float positionX;
    float positionY;
    float blockWidth;
    float blockHeight;
    color blockCol;
    
    void renderBlock()
    {
        strokeWeight((width+height)*(.001));
        stroke(0);
        fill(blockCol);
        rect(positionX-blockWidth*(.5), positionY-blockHeight*(.5), blockWidth, blockHeight);
    }//end renderPlayer
}//end class Block

class Destruct extends Block
{
    int type;  
  
    Destruct(float posX, float posY, int type)
    {
        this.type = type;
        this.positionX = posX;
        this.positionY = posY;
        this.blockWidth = width*(.1);
        this.blockHeight = height*(.02);
        this.blockCol = color(random(100,255), random(50,75), random(50,75));
    }//end player
}//end class Destruct