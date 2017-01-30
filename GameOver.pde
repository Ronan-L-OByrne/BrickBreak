void GameOverBB(boolean val)
{
    strokeWeight((width+height)*(.0025));
    
    if(val)
    {
        for(int i=0; i<objBall.size(); i++)
        {
            objBall.get(i).renderBall();
        }//end for
        
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
    }//end if
    else
    {
        if(checkKey(ENTER))
        {
            objBall.clear();
            Grid.clear();
            
            setup();
        }//end if
        
        background(100, 20, 35);
        stroke(0);
        fill(180, 125, 125);
        rect(width*(.05), height*(.075), width*(.9), height*(.9), (width+height)*(.01));
    }//end else
    
    if(checkKey(SHIFT))
    {
        menu = 0;
    }//end if
    
    objPlayer.get(0).renderBlock();
}//end GameOver()

void GameOverP(int play)
{
    strokeWeight((width+height)*(.0025));

    for(int i=0; i<objBall.size(); i++)
    {
        objBall.get(i).renderBall();
    }//end for
    
    if(checkKey(ENTER))
    {
        objBall.clear();
        
        Ball tempBall = new Ball();
        objBall.add(tempBall);
        
        start = false;
    }//end if
    
        objBall.get(0).renderBall();
    
    fill(255);
    textSize((width+height)*(.05));
    text("PLAYER" + play +"WINS", width*(.5), height*(.3));
}//end GameOverP()