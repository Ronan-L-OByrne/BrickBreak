void brickBreak()
{
    if(Grid.size() == 0)
    {
        GameOverBB(true);
    }//end if
    else if(objBall.size() == 0)
    {
        GameOverBB(false);
        
        for(int i=0; i<Grid.size(); i++)
        {
            Grid.get(i).renderBlock();
        }//end for
    
        fill(255);
        textSize((width+height)*(.05));
        text("YOU LOSE", width*(.5), height*(.3));
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
    }//end else
}//end brickBreak()

void Pong(int noPlayers)
{
    if(objPlayer.get(0).pScore == 5)
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
        
        textFont(titleFont, (width+height)*(.025));
        fill(255);
        textAlign(CENTER, CENTER);
        
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
}//end Pong()