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
    
    //updates the position of the player
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
    
    //Checks if the ball is hitting the player
    void checkPlayer()
    {
        if(objBall.ballPos.x+objBall.ballDiam*(.5) > positionX-blockWidth*(.5)  && objBall.ballPos.x-objBall.ballDiam*(.5) < positionX+blockWidth*(.5)
        && objBall.ballPos.y+objBall.ballDiam*(.5) > positionY-blockHeight*(.5) && objBall.ballPos.y-objBall.ballDiam*(.5) < positionY+blockHeight*(.5))
        {
            if(objBall.theta > 0 && objBall.theta < HALF_PI)
            {
                println("IF NO. 2");
            }//end if
            else if(objBall.theta > HALF_PI*3 && objBall.theta < TWO_PI)
            {
                println("IF NO. 3");
            }//end else
            else if(objBall.theta > PI && objBall.theta < HALF_PI*3)
            {
                println("IF NO. 4");
                float temp = map(objBall.ballPos.x, positionX-blockWidth*(.5), positionX+blockWidth*(.5), 0, PI);
                objBall.theta = PI-temp;
                objBall.ballPos.y = (positionY-blockHeight*(.5))-objBall.ballDiam*(.5)-1;
            }//end else if
            else if(objBall.theta < PI && objBall.theta > HALF_PI)
            {
                println("IF NO. 5");
                float temp = map(objBall.ballPos.x, positionX-blockWidth*(.5), positionX+blockWidth*(.5), 0, PI);
                objBall.theta = TWO_PI+(temp);
                objBall.ballPos.y = (positionY-blockHeight*(.5))-objBall.ballDiam*(.5)-1;
            }//end else if
        }//end if
    }//end checkPlayer()
}//end Player