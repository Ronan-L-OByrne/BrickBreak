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
    void checkPlayer(int x)
    {
        if(objBall.get(x).ballPos.x+objBall.get(x).ballDiam*(.5) > positionX-blockWidth*(.5)  && objBall.get(x).ballPos.x-objBall.get(x).ballDiam*(.5) < positionX+blockWidth*(.5)
        && objBall.get(x).ballPos.y+objBall.get(x).ballDiam*(.5) > positionY-blockHeight*(.5) && objBall.get(x).ballPos.y-objBall.get(x).ballDiam*(.5) < positionY+blockHeight*(.5))
        {
            if(objBall.get(x).theta >= 0 && objBall.get(x).theta < HALF_PI)
            {
                println("IF NO. 2");
            }//end if
            else if(objBall.get(x).theta >= HALF_PI*3 && objBall.get(x).theta <= TWO_PI)
            {
                println("IF NO. 3");
            }//end else
            else if(objBall.get(x).ballPos.x <= positionX)
            {
                println("IF NO. 4");
                float temp = map(objBall.get(x).ballPos.x, positionX-blockWidth*(.5), positionX, HALF_PI+PI+(HALF_PI/4), TWO_PI);
                objBall.get(x).theta = temp;
                objBall.get(x).ballPos.y = (positionY-blockHeight*(.5))-objBall.get(x).ballDiam*(.5)-1;
            }//end else if
            else if(objBall.get(x).ballPos.x > positionX)
            {
                println("IF NO. 5");
                float temp = map(objBall.get(x).ballPos.x, positionX, positionX+blockWidth*(.5), 0, HALF_PI-(HALF_PI/4));
                objBall.get(x).theta = temp;
                objBall.get(x).ballPos.y = (positionY-blockHeight*(.5))-objBall.get(x).ballDiam*(.5)-1;
            }//end else if
            else if(objBall.get(x).theta >= PI && objBall.get(x).theta < HALF_PI*3)
            {
            }//end else if
            else if(objBall.get(x).theta >= HALF_PI && objBall.get(x).theta <= PI)
            {
                
            }//end else if
        }//end if
    }//end checkPlayer()
}//end Player