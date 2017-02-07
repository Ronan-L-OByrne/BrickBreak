//Bulk of the code used in the Birck Break game
void brickBreak(int mode)
{
    background(20, 20, 75);
    
    //Checks if the player name has been set yet in the current game
    if(objPlayer.get(0).pName == null && mode != 0)
    {
        fill(255, 0, 0);
        
        rect(width*(.225)+((width*(.15))*rad), height*(.325), width*(.1), height*(.35));
        
        fill(255, 195, 100);
        textAlign(CENTER,CENTER);
        textFont(titleFont, (width+height)*(.025));
        text("PLESASE ENTER INITIALS", width*(.5), height*(.2));
        text("USE ARROWS KEYS", width*(.5), height*(.8));
        
        //Displayes the curent initials 
        textFont(titleFont, (width+height)*(.03));
        text(in1, width*(.275), height*(.5));
        text(in2, width*(.425), height*(.5));
        text(in3, width*(.575), height*(.5));
        text("E\nN\nT\nE\nR", width*(.725), height*(.5));
        
        //Checks that the current caracter is within the acceptable range for each char
        if(in1 > 95)
        {
            in1 = (char)33;
        }//end if
        else if(in2 > 95)
        {
            in2 = (char)33;
        }//end else if
        else if(in3 > 95)
        {
            in3 = (char)33;
        }//end else if
        
        if(in1 < 33)
        {
            in1 = (char)95;
        }//end if
        else if(in2 < 33)
        {
            in2 = (char)95;
        }//end else if
        else if(in3 < 33)
        {
            in3 = (char)95;
        }//end else if
        
        // Allows the user to scroll through the the characters for each variable
        if(checkKey(UP) && rad == 0 && frameCount % 5 == 0)
        {
            in1 = (char)(in1+1);
        }//end if
        else if(checkKey(UP) && rad == 1 && frameCount % 5 == 0)
        {
            in2 = (char)(in2+1);
        }//end else if
        else if(checkKey(UP) && rad == 2 && frameCount % 5 == 0)
        {
            in3 = (char)(in3+1);
        }//end else if
        else if(checkKey(DOWN) && rad == 0 && frameCount % 5 == 0)
        {
            in1 = (char)(in1-1);
        }//end else if
        else if(checkKey(DOWN) && rad == 1 && frameCount % 5 == 0)
        {
            in2 = (char)(in2-1);
        }//end else if
        else if(checkKey(DOWN) && rad == 2 && frameCount % 5 == 0)
        {
            in3 = (char)(in3-1);
        }//end else if
        // Concatinates the chars into the pName variable
        else if(checkKey(ENTER) && rad == 3)
        {
            objPlayer.get(0).pName = "" + in1 + in2 + in3;
        }//end else if
        else if(checkKey(RIGHT) && frameCount % 10 == 0)
        {
            rad++;
        }//end else if
        else if(checkKey(LEFT) && frameCount % 10 == 0)
        {
            rad--;
        }//end else if
        
        //Checks that rad is between the acceptable values
        if(rad < 0)
        {
            rad = 3;
        }//end if
        else if(rad > 3)
        {
            rad = 0;
        }//end else if
    }//end if
    else
    {
        // If the grid is destroyed the player has won
        if(Grid.size() == 0)
        {
            GameOverBB(true);
        }//end if
        //If there are no balls left the player has lost
        else if(objBall.size() == 0)
        {
            GameOverBB(false);
        }//end else if
        // Otherwise play the game
        else
        {
            strokeWeight((width+height)*(.0025));
            stroke(255, 195, 100);
            fill(125, 125, 180);
            rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
            
            // Renders and updates every ball in the arraylist
            for(int x=0; x<objBall.size(); x++)
            {
                if((objBall.get(x).ballPos.y) > height*(.97))
                {
                    objBall.remove(x);
                }//end if
                else
                {
                    objBall.get(x).updateBall();
                    objBall.get(x).renderBall();
                    
                    for(int i=0; i<Grid.size(); i++)
                    {
                        Grid.get(i).renderBlock();
                        Grid.get(i).checkBlock(i, x);
                    }//end for
                    objPlayer.get(0).checkPlayer(x);
                }//end else
            }//end for
            
            //Updates and renders the player
            if(mode == 0)
            {
                objPlayer.get(0).updatePlayerAI();
            }//end if
            else
            {
                objPlayer.get(0).updatePlayer();
            }
            objPlayer.get(0).renderBlock();
        
            //Updates and renders all of the Particle Systems
            for(int i=0; i< pSystem.size(); i++)
            {
                if(pSystem.get(i).Lifespan > 0)
                {
                    pSystem.get(i).run();
                    pSystem.get(i).Lifespan--;
                }//end if
                else
                {
                    pSystem.remove(i);
                }//end else
            }//end for
        }//end else
        
        // Writes the players score and name
        fill(255, 195, 100);
            
        textFont(titleFont, (width+height)*(.02));
        textAlign(LEFT, CENTER);
        text("SCORE: " + objPlayer.get(0).pScore, width*(.625), height*(.035));
        
        textFont(titleFont, (width+height)*(.015));
        if(mode == 0)
        {
            text("HAL", width*(.475), height*(.035));
        }//end if
        else
        {
            text(objPlayer.get(0).pName, width*(.475), height*(.035));
        }//end else
        
        textFont(titleFont, (width+height)*(.025));
        textAlign(CENTER, CENTER);
        text("BRICKBREAK", width*(.225), height*(.035));
    }//end else
    
    //If the game has not started yet the User can view the leaderboard with the UP arrow
    if((Grid.size() == 0 || objBall.size() == 0) && checkKey(UP))
    {
        background(0);
        fill(255);
        textFont(titleFont, (height+width)*(.025));
        textAlign(CENTER, CENTER);
        text("LEADERBOARD", width*(.5), height*(.1));
        text("_________________", width*(.5), height*(.1));
        
        textAlign(CENTER, CENTER);
        text("PLACE", width*(.2), height*(.2));
        text("_______", width*(.2), height*(.2));
        text("NAME", width*(.45), height*(.2));
        text("_______", width*(.45), height*(.2));
        text("SCORE", width*(.775), height*(.2));
        text("_______", width*(.775), height*(.2));
        
        // Displays the top ten scores in decending order
        for(int i=0; i<Lead.size(); i++)
        {
            text(Lead.get(i).place, width*(.2), height*(.25)+((height*(.075))*i));
            text(Lead.get(i).name, width*(.45), height*(.25)+((height*(.075))*i));
            text(Lead.get(i).score, width*(.775), height*(.25)+((height*(.075))*i));
        }//end for
    }//end else if
}//end brickBreak()

//Bulk of the code used in the Pong Game
void Pong(int noPlayers)
{
    // If Player 1's score is 5 Player 1 wins
    if(objPlayer.get(0).pScore == 5)
    {
        GameOverP(0);
    }//end if
    // If Player 2's score is 5 Player 2 wins
    else if(objPlayer.get(1).pScore == 5)
    {
        GameOverP(1);
    }//end else if
    // Otherwise continue the game
    else
    {
        background(0);
        strokeWeight((width+height)*(.0025));
        stroke(255);
        fill(0);
        rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
        
        ellipse(width*(.5), height*(.525), (width+height)*(.2), (width+height)*(.2));
        line(width*(.05), height*(.525), width*(.95), height*(.525));
        
        // Update, render and check if the ball has hit player 1
        objPlayer.get(0).updatePlayerAI();
        objPlayer.get(0).renderBlock();
        objPlayer.get(0).checkPlayer(0);
        
        // Check if Player 2 is a person or an AI
        if(noPlayers == 1)
        {
            // If AI auto update position
            objPlayer.get(1).updatePlayerAI();
        }//end if
        else if(noPlayers == 2)
        {
            // If other player check for input
            objPlayer.get(1).updatePlayer();
        }//end else if
        
        // Render and Check if the ball has hit Player 2
        objPlayer.get(1).renderBlock();
        objPlayer.get(1).checkPlayer(0);
            
        // Render and update the Ball
        objBall.get(0).renderBall();
        objBall.get(0).updateBall();
    }//end else
    
    textFont(titleFont, (width+height)*(.025));
    fill(255);
    textAlign(CENTER, CENTER);
    
    text("P1: " + objPlayer.get(0).pScore, width*(.1), height*(.035));
    text("P2: " + objPlayer.get(1).pScore, width*(.9), height*(.035));
    textFont(titleFont, (width+height)*(.035));
    text("PONG", width*(.5), height*(.035));
}//end Pong()