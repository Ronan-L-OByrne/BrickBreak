//Provides either the win or lose screens for Brick Break
void GameOverBB(boolean val)
{
    strokeWeight((width+height)*(.0025));
    
    // If the user has won
    if(val)
    {
        for(int i=0; i<objBall.size(); i++)
        {
            objBall.get(i).renderBall();
        }//end for
        
        //Restarts the game, carries over score
        if(checkKey(ENTER))
        {
            objBall.clear();
            Grid.clear();
            
            createGrid();
            
            Ball tempBall = new Ball();
            objBall.add(tempBall);
            
            start = false;
        }//end if
        
        background(20, 100, 35);
        stroke(255);
        fill(125, 180, 125);
        rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
        
        for(int i=0; i<objBall.size(); i++)
        {
            objBall.get(i).renderBall();
        }//end for
        
        fill(255);
        textSize((width+height)*(.05));
        text("YOU WIN", width*(.5), height*(.3));
    
        textSize((width+height)*(.02));
        text("PRESS ENTER TO", width*(.5), height*(.725));
        text("PLAY AGAIN", width*(.5), height*(.755));
        
        text("PRESS SHIFT TO RETURN", width*(.5), height*(.85));
    }//end if
    // If the user has lost
    else
    {
        //Restarts the game, sets score to 0
        if(checkKey(ENTER))
        {
            objBall.clear();
            Grid.clear();
            
            createGrid();
            
            Ball tempBall = new Ball();
            objBall.add(tempBall);
            objPlayer.get(0).pScore = 0;
            
            start = false;
        }//end if
        
        background(100, 20, 35);
        stroke(0);
        fill(180, 125, 125);
        rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
        
        for(int i=0; i<Grid.size(); i++)
        {
            Grid.get(i).renderBlock();
        }//end for
    
        fill(255);
        textSize((width+height)*(.05));
        text("YOU LOSE", width*(.5), height*(.3));
        
        textSize((width+height)*(.02));
        text("ENTER TO PLAY AGAIN", width*(.5), height*(.7));
        text("___________________________", width*(.5), height*(.7));
        
        text("SHIFT TO RETURN", width*(.5), height*(.75));
        text("_____________________", width*(.5), height*(.75));
        
        text("UP FOR LEADERBOARD", width*(.5), height*(.8));
        text("___________________________", width*(.5), height*(.8));
    }//end else
    
    if(checkKey(SHIFT))
    {
        updateBoard(objPlayer.get(0).pScore);
            
        menu = 0;
    }//end if
    
    objPlayer.get(0).renderBlock();
}//end GameOver()

//Provides either the win or lose screens for Pong
void GameOverP(int play)
{
    strokeWeight((width+height)*(.0025));

    objBall.get(0).renderBall();
    
    fill(255);
    textSize((width+height)*(.05));
    text("PLAYER " + (play+1) +" WINS", width*(.5), height*(.275));
    
    textSize((width+height)*(.02));
    text("ENTER TO PLAY AGAIN", width*(.5), height*(.75));
    text("___________________________", width*(.5), height*(.75));
    
    text("SHIFT TO RETURN", width*(.5), height*(.8));
    text("_____________________", width*(.5), height*(.8));
        
    // Restarts the game
    if(checkKey(ENTER))
    {
        objBall.clear();
        
        objPlayer.get(1).pScore = 0;
        objPlayer.get(0).pScore = 0;
        
        Ball tempBall = new Ball();
        objBall.add(tempBall);
        
        start = false;
    }//end if
}//end GameOverP()