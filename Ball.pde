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
        if(start == false)
        {
            ballPos.x = P1.positionX;
            if(checkKey(UP))
            {
                start = true;
            }//end if
        }//end if
        else if(start)
        {
            if((ballPos.x-ballDiam*(.5)) > width*(.05) && (ballPos.x+ballDiam*(.5)) < width*(.95) && (ballPos.y-ballDiam*(.5)) >= height*(.075))
            {
                forward.x = sin(theta)*3;
                forward.y = -cos(theta)*3;
                
                ballPos.add(forward);
            }//end if
            else if((ballPos.x-ballDiam*(.5)) < width*(.05))
            {
                println("LEFT WALL");
            println(theta);
                theta = PI-(theta-PI);
                
                forward.x = sin(theta);
                forward.y = cos(theta);
                
                ballPos.x = width*(.05)+ballDiam*(.5)+1;
                
                ballPos.add(forward);
            }//end else if
            else if((ballPos.x+ballDiam*(.5)) > width*(.95))
            {
                println("RIGHT WALL");
            println(theta);
                theta = PI+(PI-theta);
                
                forward.x = sin(theta);
                forward.y = -cos(theta);
                
                ballPos.x = width*(.95)-ballDiam*(.5)-1;
                
                ballPos.add(forward);
            }//end else if
            else if((ballPos.y-ballDiam*(.5)) < height*(.075))
            {
                println("TOP WALL");
            println(theta);
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
                
                ballPos.y = height*(.075)+ballDiam*(.5)+1;
                
                ballPos.add(forward);
            }//end else if
        }//end else
    }//end updatePlayer()
}//end class ball