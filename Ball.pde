class Ball
{
    PVector ballPos;
    PVector forward;
    float speed;
    float theta;
    float ballDiam;
    
    Ball()
    {
        this.ballPos = new PVector(objPlayer.get(0).positionX, objPlayer.get(0).positionY-(height*(.025)));
        this.forward = new PVector(0, 1);
        this.speed = 4;
        this.theta = 0;
        this.ballDiam = (width+height)*(.01);
    }//end Ball
    
    void renderBall()
    {
        pushMatrix();
          translate(ballPos.x, ballPos.y);
          //rotate(theta);
          strokeWeight((width+height)*(.001));
          stroke(0);
          fill(255);
          ellipse(0, 0, ballDiam, ballDiam);
        popMatrix();
    }//end renderBall()
    
    void updateBall()
    {
        theta = theta % TWO_PI;
        if(start == false)
        {
            ballPos.x = objPlayer.get(0).positionX;
            if(checkKey(UP))
            {
                start = true;
            }//end if
        }//end if
        else if(start)
        {
            if(menu == 3)
            {
                if((ballPos.x-ballDiam*(.5)) < width*(.05))
                {
                    //println("LEFT WALL");
                    //println(theta);
                    theta = PI-(theta-PI);
                    
                    forward.x = sin(theta);
                    forward.y = cos(theta);
                    
                    ballPos.x = width*(.05)+ballDiam*(.5)+1;
                    
                    ballPos.add(forward);
                }//end else if
                else if((ballPos.x+ballDiam*(.5)) > width*(.95))
                {
                    //println("RIGHT WALL");
                    //println(theta);
                    theta = PI+(PI-theta);
                    
                    forward.x = sin(theta);
                    forward.y = -cos(theta);
                    
                    ballPos.x = width*(.95)-ballDiam*(.5)-1;
                    
                    ballPos.add(forward);
                }//end else if
                else if((ballPos.y-ballDiam*(.5)) < height*(.075))
                {
                    //println("TOP WALL");
                    //println(theta);
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
                else if((ballPos.y) > height*(.97) && objBall.size() == 0)
                {
                    GameOverBB(false);
                }//end else if
                else
                {
                    forward.x = sin(theta)*speed;
                    forward.y = -cos(theta)*speed;
                    
                    ballPos.add(forward);
                }//end if
            }//end if
            else if(menu == 4)
            {
                if((ballPos.x-ballDiam*(.5)) < width*(.05))
                {
                    theta = PI-(theta-PI);
                    
                    forward.x = sin(theta);
                    forward.y = cos(theta);
                    
                    ballPos.x = width*(.05)+ballDiam*(.5)+1;
                    
                    ballPos.add(forward);
                }//end else if
                else if((ballPos.x+ballDiam*(.5)) > width*(.95))
                {
                    theta = PI+(PI-theta);
                    
                    forward.x = sin(theta);
                    forward.y = -cos(theta);
                    
                    ballPos.x = width*(.95)-ballDiam*(.5)-1;
                    
                    ballPos.add(forward);
                }//end else if
                else if((ballPos.y-ballDiam*(.5)) < height*(.075))
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
                    
                    ballPos.y = height*(.075)+ballDiam*(.5)+1;
                    
                    ballPos.add(forward);
                }//end else if
                else if((ballPos.y) > height*(.97) && objBall.size() == 0)
                {
                    GameOverBB(false);
                }//end else if
                else
                {
                    forward.x = sin(theta)*speed;
                    forward.y = -cos(theta)*speed;
                    
                    ballPos.add(forward);
                }//end if
            }//end else
        }//end else
    }//end updatePlayer()
}//end class ball