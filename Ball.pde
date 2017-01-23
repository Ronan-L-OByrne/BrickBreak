class Ball
{
    PVector ballPos;
    PVector forward;
    float speed = 5;
    float theta;
    float ballDiam;
    
    Ball()
    {
        this.ballPos = new PVector(P1.positionX, P1.positionY-(height*(.025)));
        this.forward = new PVector(0, 1);
        this.theta = PI*.25;
        this.ballDiam = (width+height)*(.01);
    }//end Ball
    
    void renderBall()
    {
        pushMatrix();
          translate(ballPos.x, ballPos.y);
          rotate(theta);
          stroke(0);
          fill(255);
          ellipse(0, 0, ballDiam, ballDiam);
        popMatrix();
    }//end renderBall()
    
    void updateBall()
    {
        if(checkKey(UP) && start == false)
        {
           start = true; 
        }//end if
        else if(start)
        {
            if((ballPos.x-ballDiam*(.5)) > width*(.05) && (ballPos.x+ballDiam*(.5)) < width*(.95) && (ballPos.y-ballDiam*(.5)) >= height*(.075))
            {
                forward.x = sin(theta)*2;
                forward.y = -cos(theta)*2;
                
                ballPos.add(forward);
            }//end if
            else if((ballPos.x-ballDiam*(.5)) <= width*(.05))
            {
                theta = PI-(theta-PI);
                
                forward.x = sin(theta);
                forward.y = cos(theta);
                
                for(int i=0; i<10; i++)
                {
                    ballPos.add(forward);
                }//end while
                //while((ballPos.x-ballDiam*(.5)) <= width*(.05));
            }//end else if
            else if((ballPos.x+ballDiam*(.5)) >= width*(.95))
            {
                theta = PI+(PI-theta);
                
                forward.x = sin(theta);
                forward.y = -cos(theta);
                
                for(int i=0; i<10; i++)
                {
                    ballPos.add(forward);
                }//end while=
            }//end else if
            else if((ballPos.y-ballDiam*(.5)) <= height*(.075))
            {
                if(theta < PI)
                {
                    theta = PI-theta;
                }//end if
                else if(theta > PI)
                {
                    theta = TWO_PI-(theta-PI);
                }//end else if
                
                forward.x = sin(theta);
                forward.y = -cos(theta);
                
                for(int i=0; i<10; i++)
                {
                    ballPos.add(forward);
                }//end while
            }//end else if
        }//end else
    }//end updatePlayer()
}//end class ball