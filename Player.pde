class Player extends Block
{
    
    Player()
    {
        this.positionX = width*(.5);
        this.positionY = height*(.95);
        this.blockWidth = width*(.1);
        this.blockHeight = height*(.02);
        this.blockCol = color(255);
    }//end player
    
    void updatePlayer()
    {
        if(checkKey(LEFT))
        {
            if((positionX-blockWidth*(.5)) > width*(.05))
            {
                positionX = positionX-width*(.005);
            }//end if
        }//end if
        if(checkKey(RIGHT))
        {
            if((positionX+blockWidth*(.5)) < width*(.95))
            {
                positionX = positionX+width*(.005);
            }//end if
        }//end if
    }//end updatePlayer()
    
}//end Player