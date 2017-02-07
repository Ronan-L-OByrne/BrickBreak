//Creates the initial Menu where the user chooses the game
void Menu()
{
    background(100, 75, 150);
    //background(100, 25, 100);
    
    // Draws the sun graphic in the background of the main menu
    DrawSun(color(255, 255, 50));
    
    fill(0);
    strokeWeight((width+height)*(.002));
    stroke(255);
    rect(width*(.18), height*(.09), width*(.64), height*(.07), (width+height)*(.01));
    
    fill(255);
    textFont(titleFont, (height+width)*(.04));
    textAlign(CENTER,CENTER);
    text("2 IN 1 DELUX", width*(.5), height*(.125));
    
    for(int i=0; i<4; i++)
    {
        for(int j=0; j<5; j++)
        {
            fill(255, 75, 50);
            stroke(255, 125, 100);
            if(j%2 == 0)
            {
                rect((width*(.3))*i, height*(.225)+(height*(.05))*j, width*(.3), height*(.05));
            }//end if
            else
            {
                rect(-(width*(.15))+(width*(.3))*i, height*(.225)+(height*(.05))*j, width*(.3), height*(.05));
            }//end else
        }//end for(j)
    }//end for(i)
    
    fill(0);
    stroke(255);
    rect(0, height*(.525), width, height*(.25));
    fill(255);
    
    rect(width*(.025), height*(.625), width*(.025), height*(.05)); // 525
    rect(width*(.95), height*(.625), width*(.025), height*(.05)); // 775
    
    objBall.get(0).ballPos.y = height*(.65);
    objBall.get(0).renderBall();
    if(objBall.get(0).ballPos.x-objBall.get(0).ballDiam*(.5) <= width*(.05))
    {
        objBall.get(0).speed = 5;
        
        objBall.get(0).ballPos.x = width*(.05)+objBall.get(0).ballDiam*(.5)+1;
    }//end if
    else if(objBall.get(0).ballPos.x+objBall.get(0).ballDiam*(.5) >= width*(.95))
    {
        objBall.get(0).speed = -5;
        
        objBall.get(0).ballPos.x = width*(.95)-objBall.get(0).ballDiam*(.5)-1;
    }//end else if
    else
    {
        objBall.get(0).ballPos.x += objBall.get(0).speed;
    }//end else
    
    if(mouseX > width *(.2)  && mouseX < width*(.805) && mouseY > height*(.29) && mouseY < height*(.41))
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
    }//end if
    else
    {
        fill(200, 100, 70);
        stroke(20, 20, 75);
        rect(width*(.2), height*(.29), width*(.605), height*(.12), (width+height)*(.01));
        
        fill(0);
        textFont(titleFont, (height+width)*(.025));
        text("1. BRICK BREAK", width*(.5), height*(.35));
    }//end else
    
    if(mouseX > width *(.2)  && mouseX < width*(.805) && mouseY > height*(.59) && mouseY < height*(.71))
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
        
    }//end if
    else
    {
        fill(0);
        stroke(255);
        rect(width*(.2), height*(.59), width*(.605), height*(.12), (width+height)*(.01));
        
        fill(255);
        text("2. PONG", width*(.5), height*(.65));
    }//end else
    
    fill(0);
    text("1 OR 2 TO CONTINUE", width*(.5), height*(.95));
    text("_________________________", width*(.5), height*(.95));
    
    if(checkKey('1'))
    {
        menu = 1;
    }//end else if
    else if(checkKey('2'))
    {
        menu = 2;
    }//end else if
}//end Menu()

//Provides the user with instructions on how to play Brick Break
void instructBrickBreak()
{
    background(20, 20, 75);
    
    DrawSun(color(25, 25, 80));
    
    fill(255);
    textFont(titleFont, (height+width)*(.0225));
    text("CONTROLS", width*(.5), height*(.2));
    text("_____________", width*(.5), height*(.2));
    text("UP: BEGIN GAME", width*(.5), height*(.25));
    text("LEFT: MOVE LEFT", width*(.5), height*(.3));
    text("RIGHT: MOVE RIGHT", width*(.5), height*(.35));
    
    text("GAME", width*(.5), height*(.45));
    text("_______", width*(.5), height*(.45));
    text("OBJECTIVE: HIT AND DESTROY ALL", width*(.5), height*(.5));
    text("THE BLOCKS", width*(.5), height*(.55));
    text("GREEN BLOCKS: SPAWN AN EXTRA", width*(.5), height*(.6));
    text("BALL", width*(.5), height*(.65));
    text("RED BLOCKS: SPEED UP BALLS", width*(.5), height*(.7));
    text("THAT HIT IT", width*(.5), height*(.75));
    
    text("ENTER TO CONTINUE", width*(.5), height*(.85));
    text("_________________________", width*(.5), height*(.85));
    
    text("SHIFT TO RETURN", width*(.5), height*(.9));
    text("_____________________", width*(.5), height*(.9));
    
    text("UP FOR LEADERBOARD", width*(.5), height*(.95));
    text("___________________________", width*(.5), height*(.95));
    
    if(checkKey(ENTER))
    {
        objBall.clear();
        Grid.clear();
        
        objBall.add(new Ball());
        
        rad = 0;
        
        menu = 3;
        objPlayer.get(0).pScore = 0;
        objBall.get(0).speed = 5;
        start = false;
        createGrid();
    }//end if
    else if(checkKey(UP))
    {
        displayLeaderboard();
    }//end else if
    
    fill(200, 100, 70);
    strokeWeight((width+height)*(.002));
    stroke(255);
    rect(width*(.2), height*(.04), width*(.605), height*(.07), (width+height)*(.01));
    
    fill(255);
    textFont(titleFont, (height+width)*(.04));
    textAlign(CENTER,CENTER);
    text("BRICK BREAK", width*(.5), height*(.075));
}//end instructBrickBreak()

//Provides the user with instructions on how to play Pong and lets them choose the number of players
void instructPong()
{
    background(0);
    
    DrawSun(color(10));
    
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
        objBall.clear();
        Ball tempBall = new Ball();
        objBall.add(tempBall);
        objBall.get(0).speed = 6;
        start = false;
      
        objPlayer.get(0).pScore = 0;
        
        Player tempPlayer = new Player(2);
        objPlayer.add(tempPlayer);
        
        menu = 4;
    }//end if
    else if(mouseX >= width*(.1) && mouseX <= width*(.45) && mouseY >= height*(.7) && mouseY <= height*(.9))
    {
        fill(255);
        rect(width*(.1), height*(.7), width*(.35), height*(.2), (width+height)*(.01));
            
        fill(0);
        text("1 Player", width*(.27), height*(.8));
        
        if(mousePressed)
        {
            objBall.clear();
            Ball tempBall = new Ball();
            objBall.add(tempBall);
            objBall.get(0).speed = 6;
            start = false;
          
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
            objBall.clear();
            Ball tempBall = new Ball();
            objBall.add(tempBall);
            objBall.get(0).speed = 6;
            start = false;
          
            objPlayer.get(0).pScore = 0;
          
            Player tempPlayer = new Player(2);
            objPlayer.add(tempPlayer);
            
            menu = 5;
        }//end if
    }//end else if
}//end instructPong()

void DrawSun(color col)
{
    noStroke();
    fill(col);//fill(255, 255, 50);
    ellipse(width*(.5), height*(1.045), width*(.8), height*(.35));
    
    strokeWeight((width+height)*(.002));
    stroke(col);//stroke(255, 255, 50);
    
    rad = (HALF_PI+(rad+(PI/20)*(2)))%HALF_PI*3;
    float cx = width*(.5);
    float cy = height;
    
    for(int i=0; i<=20; i++)
    {
        float x = cx+sin(rad)*height*2;
        float y = cy+cos(rad)*height*2;
        
        rad = (HALF_PI+(rad+(PI/20)*(2)))%HALF_PI*3;
        
        line(x, y, cx, cy);
    }//end for
}//end DrawSun