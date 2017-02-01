class Ball
{
    PVector ballPos;
    PVector forward;
    float speed;
    float theta;
    float ballDiam;
    int curPlayer;
    float scoreMultiplier;
    
    Ball()
    {
        this.curPlayer = 1;
        this.ballPos = new PVector(objPlayer.get(0).positionX, objPlayer.get(0).positionY-(height*(.025)));
        this.forward = new PVector(0, 1);
        this.speed = 4;
        this.theta = 0;
        this.ballDiam = (width+height)*(.01);
        this.scoreMultiplier = 1;
    }//end Ball
    
    void renderBall()
    {
        pushMatrix();
          translate(ballPos.x, ballPos.y);
          strokeWeight((width+height)*(.001));
          stroke(0);
          fill(255);
          ellipse(0, 0, ballDiam, ballDiam);
        popMatrix();
    }//end renderBall()
    
    void updateBall()
    {
        theta = theta % TWO_PI;
        
        if(!start)
        {
            if(curPlayer == 1)
            {
                ballPos.x = objPlayer.get(0).positionX;
                ballPos.y = objPlayer.get(0).positionY-(height*(.025));
                theta = 0;
            
                if(checkKey(UP))
                {
                    start = true;
                }//end if
            }//end if
            else
            {
                ballPos.x = objPlayer.get(1).positionX;
                ballPos.y = objPlayer.get(1).positionY+(height*(.025));
                theta = PI;
            
                if(checkKey('w'))
                {
                    start = true;
                }//end if
            }//end else
        }//end if
        else
        {
            if((ballPos.x-ballDiam*(.5)) < width*(.05))
            {
                theta = PI-(theta-PI);
                
                forward.x = sin(theta);
                forward.y = cos(theta);
                
                ballPos.x = width*(.05)+ballDiam*(.5)+1;
                
                ballPos.add(forward);
            }//end if
            else if((ballPos.x+ballDiam*(.5)) > width*(.95))
            {
                theta = PI+(PI-theta);
                
                forward.x = sin(theta);
                forward.y = -cos(theta);
                
                ballPos.x = width*(.95)-ballDiam*(.5)-1;
                
                ballPos.add(forward);
            }//end else if
            
            if(menu == 4 || menu == 5)
            {
                if((ballPos.y-ballDiam*(.5)) < height*(.075))
                {
                    objPlayer.get(0).pScore += 1;
                    
                    start = false;
                    
                    objBall.get(0).ballPos.x = objPlayer.get(1).positionX;
                    objBall.get(0).ballPos.y = objPlayer.get(1).positionY+(height*(.025));
                    objBall.get(0).curPlayer = 2;
                }//end else if
                else if((ballPos.y) > height*(.97))
                {
                    objPlayer.get(1).pScore += 1;
                    
                    start = false;
                    
                    objBall.get(0).ballPos.x = objPlayer.get(0).positionX;
                    objBall.get(0).ballPos.y = objPlayer.get(0).positionY-(height*(.025));
                    objBall.get(0).curPlayer = 1;
                }//end else if
            }//end if
            else if(menu == 3)
            {
                if((ballPos.y-ballDiam*(.5)) < height*(.075))
                {
                    if(theta < PI)
                    {
                        theta = PI-theta;
                    }//end if
                    else if(theta > PI)
                    {
                        theta = TWO_PI-(theta-PI);
                    }//end else if
                    
                    ballPos.y = height*(.075)+ballDiam*(.5)+1;
                    
                    ballPos.add(forward);
                }//end else if
                else if((ballPos.y) > height*(.97) && objBall.size() == 0)
                {
                    GameOverBB(false);
                }//end else if
            }//end else
            
            forward.x = sin(theta)*speed;
            forward.y = -cos(theta)*speed;
            
            ballPos.add(forward);
        }//end else
    }//end updateBall()
}//end class ball