class Ball
{
    PVector ballPos;
    PVector forward;
    float speed = 50;
    float theta;
    float ballDiam;
    
    Ball()
    {
        this.ballPos = new PVector(P1.positionX, P1.positionY-(height*(.025)));
        this.forward = new PVector(0, 1);
        this.theta = .75;
        this.ballDiam = (width+height)*(.01);
    }//end Ball
    
    void renderBall()
    {
        stroke(0);
        fill(255);
        ellipse(ballPos.x, ballPos.y, ballDiam, ballDiam);
    }//end renderBall()
    
    void updateBall()
    {
        if(checkKey(UP) && start == false)
        {
           start = true; 
        }//end if
        else
        {
            if((ballPos.x-ballDiam*(.5)) > width*(.05) && (ballPos.x+ballDiam*(.5)) < width*(.95))
            {
                forward.x = sin(theta);
                forward.y = -cos(theta);
                
                ballPos.add(forward);
            }//end if
            else if((ballPos.x-ballDiam*(.5)) < width*(.05))
            {
                theta = HALF_PI+theta;
                
                for(int i = 0; i<(int)(width*(05)-(ballPos.x+ballDiam*(.5))); i++)
                {
                    forward.x = sin(theta);
                    forward.y = -cos(theta);
                    
                    ballPos.add(forward);
                }//end while
            }//end else if
            else if((ballPos.x+ballDiam*(.5)) > width*(.95))
            {
                theta = HALF_PI+theta;
                
                for(int i = 0; i<(int)(width*(.95)-(ballPos.x+ballDiam*(.5))); i++)
                {
                    forward.x = sin(theta);
                    forward.y = -cos(theta);
                    
                    ballPos.add(forward);
                }//end while
            }//end else if
        }//end else
    }//end updatePlayer()
}//end class ball