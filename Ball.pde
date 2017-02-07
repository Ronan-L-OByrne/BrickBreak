class Ball
{
    PVector ballPos;        // Stores the x and y position of the ball
    PVector forward;        // Stores the forward vector of the ball
    float speed;            // Stores the speed of the ball
    float theta;            // Stores the angle the ball is traveling
    float ballDiam;         // Stores the diameter of the ball
    int curPlayer;          // Stores the player it currently is attached to
    float scoreMultiplier;  // Stores the current score multiplier
    
    //Ball Constructor
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
    
    String toString()
    {
            return ballPos.x + "\t" + ballPos.y + "\t" + forward.x + "\t" + forward.y + "\t" + speed + "\t" + theta + "\t" + ballDiam + "\t" + curPlayer + "\t" + scoreMultiplier;
    }//end toString()
    
    //Renders the balls on the screen
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
    
    //Updates the current positon of the ball
    void updateBall()
    {
        // Makes sure the ball is between 0 and Two Pi
        theta = theta % TWO_PI;
        
        // Checks if the ball has started moving yet
        if(!start)
        {
            //Moves the ball to just above the bottom player
            if(curPlayer == 1)
            {
                ballPos.x = objPlayer.get(0).positionX;
                ballPos.y = objPlayer.get(0).positionY-(height*(.025));
                theta = 0;
                
                //Starts moving the ball
                if(checkKey(UP))
                {
                    start = true;
                }//end if
            }//end if
            //Moves the ball to just bellow the top player
            else
            {
                ballPos.x = objPlayer.get(1).positionX;
                ballPos.y = objPlayer.get(1).positionY+(height*(.025));
                theta = PI;
                
                //Starts moving the ball
                if(checkKey('w'))
                {
                    start = true;
                }//end if
            }//end else
        }//end if
        else
        {
            //Checks if the ball has hit the Left wall
            if((ballPos.x-ballDiam*(.5)) < width*(.05))
            {
                theta = PI-(theta-PI);
                
                forward.x = sin(theta);
                forward.y = cos(theta);
                
                ballPos.x = width*(.05)+ballDiam*(.5)+1;
                
                ballPos.add(forward);
            }//end if
            //Checks if the ball has hit the Right wall
            else if((ballPos.x+ballDiam*(.5)) > width*(.95))
            {
                theta = PI+(PI-theta);
                
                forward.x = sin(theta);
                forward.y = -cos(theta);
                
                ballPos.x = width*(.95)-ballDiam*(.5)-1;
                
                ballPos.add(forward);
            }//end else if
            
            //Checks if Pong is being played
            if((menu == 5 || menu == 6) && (objPlayer.get(0).pScore < 5 || objPlayer.get(1).pScore < 5))
            {
                //Checks if Player 1 has scored
                if((ballPos.y-ballDiam*(.5)) < height*(.075))
                {
                    objPlayer.get(0).pScore += 1;
                    
                    start = false;
                    
                    objBall.get(0).curPlayer = 2;
                    objBall.get(0).updateBall();
                }//end else if
                //Checks if Player 2 has scored
                else if((ballPos.y+ballDiam*(.5)) > height*(.97))
                {
                    objPlayer.get(1).pScore += 1;
                    
                    start = false;
                    
                    objBall.get(0).curPlayer = 1;
                    objBall.get(0).updateBall();
                }//end else if
            }//end if
            // Checks if Brick Break is being played
            else if(menu == 3)
            {
                // Checks if the ball has hit the top wall
                if((ballPos.y-ballDiam*(.5)) < height*(.075))
                {
                    // Bounces the ball back
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
                //Checks if the game has been lost 
                else if((ballPos.y) > height*(.97) && objBall.size() == 0)
                {
                    GameOverBB(false);
                }//end else if
            }//end else
            
            //Always moves the ball
            forward.x = sin(theta)*speed;
            forward.y = -cos(theta)*speed;
            
            ballPos.add(forward);
        }//end else
    }//end updateBall()
}//end class ball