class Block
{
    float position;
    float blockWidth;
    float blockHeight;
    
    void renderBlock()
    {
        strokeWeight((width+height)*(.001));
        stroke(0);
        fill(255);
        rect(position-blockWidth*(.5), height*(.925), blockWidth, blockHeight);
    }//end renderPlayer
}//end class Block

class Destruct extends Block
{
    Destruct(float pos)
    {
        position = pos;
        blockWidth = width*(.1);
        blockHeight = height*(.02);
    }//end player
}//end class Destruct