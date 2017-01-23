class Player extends Block
{
    Player()
    {
        position = width*(.5);
        blockWidth = width*(.1);
        blockHeight = height*(.02);
    }//end player
    
    void updatePlayer()
    {
        if(checkKey(LEFT))
        {
            if((position-blockWidth*(.5)) > width*(.05))
            {
                position = position-width*(.005);
            }//end if
        }//end if
        if(checkKey(RIGHT))
        {
            if((position+blockWidth*(.5)) < width*(.95))
            {
                position = position+width*(.005);
            }//end if
        }//end if
        if(checkKey(UP))
        {
            
        }//end if
    }//end update()
    
}//end Player