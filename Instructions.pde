//Creates the initial Menu where the user chooses the game
void Menu()
{
    background(255);
    fill(255, 150, 20);
    strokeWeight((width+height)*(.002));
    stroke(50, 20, 255);
    rect(width*(.2), height*(.09), width*(.605), height*(.07), (width+height)*(.01));
    
    fill(255);
    textFont(titleFont, (height+width)*(.04));
    textAlign(CENTER,CENTER);
    text("C15332036", width*(.5), height*(.125));
    text("", width*(.5), height*(.125));
    
    if((mouseX < width *(.2)  || mouseX > width*(.805)) 
    || (mouseY < height*(.29) || mouseY > height*(.41)))
    {
        fill(200, 100, 70);
        stroke(20, 20, 75);
        rect(width*(.2), height*(.29), width*(.605), height*(.12), (width+height)*(.01));
        
        fill(0);
        textFont(titleFont, (height+width)*(.025));
        text("1. BRICK BREAK", width*(.5), height*(.35));
    }//end if
    else
    {
        fill(20, 20, 75);
        stroke(200, 100, 70);
        rect(width*(.2), height*(.29), width*(.605), height*(.12), (width+height)*(.01));
        
        fill(255);
        textFont(titleFont, (height+width)*(.025));
        text("1. BRICK BREAK", width*(.5), height*(.35));
        
        if(mousePressed)
        {
            menu = 1;
        }//end if
    }//end else
    
    if((mouseX < width *(.2)  || mouseX > width*(.805)) 
    || (mouseY < height*(.59) || mouseY > height*(.71)))
    {
        fill(0);
        stroke(255);
        rect(width*(.2), height*(.59), width*(.605), height*(.12), (width+height)*(.01));
        
        fill(255);
        text("2. PONG", width*(.5), height*(.65));
    }//end if
    else
    {
        fill(255);
        stroke(0);
        rect(width*(.2), height*(.59), width*(.605), height*(.12), (width+height)*(.01));
        
        fill(0);
        text("2. PONG", width*(.5), height*(.65));
        
        if(mousePressed)
        {
            menu = 2;
        }//end if
    }//end else
    
    fill(0);
    text("1 OR 2 TO CONTINUE", width*(.5), height*(.95));
    text("_________________________", width*(.5), height*(.95));
    
    if(checkKey('1'))
    {
        menu = 1;
    }//end if
    else if(checkKey('2'))
    {
        menu = 2;
    }//end if
}//end Menu()

//Provides the user with instructions on how to play Brick Break
void instructBrickBreak()
{
    background(20, 20, 75);
    fill(200, 100, 70);
    strokeWeight((width+height)*(.002));
    stroke(255);
    rect(width*(.2), height*(.09), width*(.605), height*(.07), (width+height)*(.01));
    
    fill(255);
    textFont(titleFont, (height+width)*(.04));
    textAlign(CENTER,CENTER);
    text("BRICK BREAK", width*(.5), height*(.125));
    
    textFont(titleFont, (height+width)*(.025));
    text("CONTROLS", width*(.5), height*(.25));
    text("_____________", width*(.5), height*(.25));
    text("UP: BEGIN GAME", width*(.5), height*(.3));
    text("LEFT: MOVE LEFT", width*(.5), height*(.35));
    text("RIGHT: MOVE RIGHT", width*(.5), height*(.4));
    
    text("GAME", width*(.5), height*(.5));
    text("_______", width*(.5), height*(.5));
    text("OBJECTIVE: HIT AND DESTROY ALL", width*(.5), height*(.55));
    text("THE BLOCKS", width*(.5), height*(.6));
    text("GREEN BLOCKS: SPAWN AN EXTRA", width*(.5), height*(.65));
    text("BALL", width*(.5), height*(.7));
    text("RED BLOCKS: SPEED UP BALLS", width*(.5), height*(.75));
    text("THAT HIT IT", width*(.5), height*(.8));
    
    text("ENTER TO CONTINUE", width*(.5), height*(.9));
    text("_________________________", width*(.5), height*(.9));
    
    text("SHIFT TO RETURN", width*(.5), height*(.95));
    text("_____________________", width*(.5), height*(.95));
    
    if(checkKey(ENTER))
    {
        menu = 3;
        objPlayer.get(0).pScore = 0;
        objBall.get(0).speed = 5;
        createGrid();
    }//end if
    else if(checkKey(SHIFT))
    {
        menu = 0;
    }//end else if
}//end instructBrickBreak()

//Provides the user with instructions on how to play Pong and lets them choose the number of players
void instructPong()
{
    background(0);
    fill(0);
    strokeWeight((width+height)*(.002));
    stroke(255);
    rect(width*(.2), height*(.09), width*(.605), height*(.07), (width+height)*(.01));
    
    fill(255);
    textFont(titleFont, (height+width)*(.04));
    textAlign(CENTER,CENTER);
    text("PONG", width*(.5), height*(.125));
    
    textFont(titleFont, (height+width)*(.025));
    text("CONTROLS", width*(.5), height*(.25));
    text("_____________", width*(.5), height*(.25));
    text("SPACE: BEGIN GAME", width*(.5), height*(.3));
    //textAlign(LEFT,CENTER);
    text("LEFT/A: MOVE LEFT", width*(.5), height*(.35));
    text("RIGHT/D: MOVE RIGHT", width*(.5), height*(.4));
    
    textAlign(CENTER,CENTER);
    text("GAME", width*(.5), height*(.55));
    text("_______", width*(.5), height*(.55));
    text("OBJECTIVE: GET THE BALL PAST ", width*(.5), height*(.6));
    text("THE OTHER PADDLE 5 TIMES", width*(.5), height*(.65));
    
    fill(0);
    rect(width*(.1), height*(.7), width*(.35), height*(.2), (width+height)*(.01));
        
    fill(255);
    text("1 Player", width*(.27), height*(.8));
    
    fill(0);
    rect(width*(.55), height*(.7), width*(.35), height*(.2), (width+height)*(.01));
        
    fill(255);
    text("2 Player", width*(.725), height*(.8));
    
    text("SHIFT TO RETURN", width*(.5), height*(.95));
    text("_____________________", width*(.5), height*(.95));
    
    if(checkKey(ENTER))
    {
        Ball tempBall = new Ball();
        objBall.add(tempBall);
        objBall.get(0).speed = 7;
      
        objPlayer.get(0).pScore = 0;
        
        Player tempPlayer = new Player(2);
        objPlayer.add(tempPlayer);
        
        menu = 4;
    }//end if
    else if(checkKey(SHIFT))
    {
        menu = 0;
    }//end else if
    else if(mouseX >= width*(.1) && mouseX <= width*(.45) && mouseY >= height*(.7) && mouseY <= height*(.9))
    {
        fill(255);
        rect(width*(.1), height*(.7), width*(.35), height*(.2), (width+height)*(.01));
            
        fill(0);
        text("1 Player", width*(.27), height*(.8));
        
        if(mousePressed)
        {
            Ball tempBall = new Ball();
            objBall.add(tempBall);
            objBall.get(0).speed = 7;
          
            objPlayer.get(0).pScore = 0;
        
            Player tempPlayer = new Player(2);
            objPlayer.add(tempPlayer);
            
            menu = 4;
        }//end if
    }//end else if
    else if(mouseX >= width*(.55) && mouseX <= width*(.85) && mouseY >= height*(.7) && mouseY <= height*(.9))
    {
        fill(255);
        rect(width*(.55), height*(.7), width*(.35), height*(.2), (width+height)*(.01));
            
        fill(0);
        text("2 Player", width*(.725), height*(.8));
        
        if(mousePressed)
        {
            Ball tempBall = new Ball();
            objBall.add(tempBall);
            objBall.get(0).speed = 7;
          
            objPlayer.get(0).pScore = 0;
          
            Player tempPlayer = new Player(2);
            objPlayer.add(tempPlayer);
            
            menu = 5;
        }//end if
    }//end else if
}//end instructPong()