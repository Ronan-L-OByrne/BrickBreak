//Bulk of the code used in the Birck Break game
void brickBreak()
{
    if(objPlayer.get(0).pName == null)
    {
        if(rad < 0)
        {
            rad = 0;
        }//end if
        
        background(20, 20, 75);
        fill(255, 0, 0);
        
        rect(width*(.25)+((width*(.2))*rad), height*(.4), width*(.1), height*(.2));
        
        fill(255, 195, 100);
        textAlign(CENTER,CENTER);
        textFont(titleFont, (width+height)*(.025));
        text("PLESASE ENTER INITIALS", width*(.5), height*(.2));
        
        textFont(titleFont, (width+height)*(.03));
        text(in1, width*(.3), height*(.5));
        text(in2, width*(.5), height*(.5));
        text(in3, width*(.7), height*(.5));
        text("FIN", width*(.9), height*(.5));
        
        if(in1 > 90)
        {
            in1 = (char)38;
        }//end if
        else if(in2 > 90)
        {
            in2 = (char)38;
        }//end else if
        else if(in3 > 90)
        {
            in3 = (char)38;
        }//end else if
        
        if(in1 < 38)
        {
            in1 = (char)90;
        }//end if
        else if(in2 < 38)
        {
            in2 = (char)90;
        }//end else if
        else if(in3 < 38)
        {
            in3 = (char)90;
        }//end else if
        
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
        else if(checkKey(RIGHT) && frameCount % 5 == 0)
        {
            rad = (rad+1)%4;
        }//end else if
        else if(checkKey(LEFT) && frameCount % 5 == 0)
        {
            rad = (rad-1)%4;
        }//end else if
        else if(checkKey(ENTER) && rad == 3)
        {
            objPlayer.get(0).pName = "" + in1 + in2 + in3;
        }//end else if
    }//end if
    else if(Grid.size() == 0)
    {
        GameOverBB(true);
    }//end if
    else if(objBall.size() == 0)
    {
        GameOverBB(false);
    }//end else if
    else
    {
        background(20, 20, 75);
        strokeWeight((width+height)*(.0025));
        stroke(255, 195, 100);
        fill(125, 125, 180);
        rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
        
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
        
        objPlayer.get(0).updatePlayer();
        objPlayer.get(0).renderBlock();
    
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
        
        
        fill(255, 195, 100);
        
        textFont(titleFont, (width+height)*(.02));
        textAlign(LEFT, CENTER);
        text("SCORE: " + objPlayer.get(0).pScore, width*(.625), height*(.035));
        
        textFont(titleFont, (width+height)*(.015));
        text(objPlayer.get(0).pName, width*(.475), height*(.035));
        
        textFont(titleFont, (width+height)*(.025));
        textAlign(CENTER, CENTER);
        text("BRICKBREAK", width*(.225), height*(.035));
    }//end else
    
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
    if(checkKey(SHIFT))
    {
        menu = 0;
    }//end if
    else if(objPlayer.get(0).pScore == 5)
    {
        GameOverP(0);
    }//end if
    else if(objPlayer.get(1).pScore == 5)
    {
        GameOverP(1);
    }//end else if
    else
    {
        background(0);
        strokeWeight((width+height)*(.0025));
        stroke(255);
        fill(0);
        rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
        
        ellipse(width*(.5), height*(.525), (width+height)*(.2), (width+height)*(.2));
        line(width*(.05), height*(.525), width*(.95), height*(.525));
        
        
        objPlayer.get(0).updatePlayer();
        objPlayer.get(0).renderBlock();
        objPlayer.get(0).checkPlayer(0);
        
        if(noPlayers == 1)
        {
            objPlayer.get(1).updatePlayerAI();
        }//end if
        else if(noPlayers == 2)
        {
            objPlayer.get(1).updatePlayer();
        }//end else if
        
        objPlayer.get(1).renderBlock();
        objPlayer.get(1).checkPlayer(0);
            
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