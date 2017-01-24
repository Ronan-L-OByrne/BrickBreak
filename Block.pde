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
    
    void checkBlock()
    {
        if(objBall.ballPos.x+objBall.ballDiam*(.5) > positionX-blockWidth*(.5)  && objBall.ballPos.x-objBall.ballDiam*(.5) < positionX+blockWidth*(.5)
        && objBall.ballPos.y+objBall.ballDiam*(.5) > positionY-blockHeight*(.5) && objBall.ballPos.y-objBall.ballDiam*(.5) < positionY+blockHeight*(.5))
        {
            if(objBall.theta < PI && objBall.theta > HALF_PI)
            {
                objBall.theta = PI-objBall.theta;
                objBall.ballPos.y = objBall.ballPos.y+objBall.ballDiam*(.5);
            }//end if
            else if(objBall.theta > PI && objBall.theta < HALF_PI*3)
            {
                objBall.theta = TWO_PI-(objBall.theta-PI);
                objBall.ballPos.y = objBall.ballPos.y+objBall.ballDiam*(.5);
            }//end else if
            else if(objBall.theta > 0 && objBall.theta < HALF_PI)
            {
                objBall.theta = PI+objBall.theta;
                objBall.ballPos.y = objBall.ballPos.y+objBall.ballDiam*(.5);
            }//end else if
            else if(objBall.theta < TWO_PI && objBall.theta > HALF_PI*3)
            {
                objBall.theta = TWO_PI+(objBall.theta-PI);
                objBall.ballPos.y = objBall.ballPos.y+objBall.ballDiam*(.5);
            }//end else if
            
            objBall.forward.x = sin(objBall.theta);
            objBall.forward.y = -cos(objBall.theta);
            
            
            objBall.ballPos.add(objBall.forward);
        }//end else if
    }//end checkBlock
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