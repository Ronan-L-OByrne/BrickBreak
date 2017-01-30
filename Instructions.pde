void Menu()
{
    background(255);
    fill(255, 150, 20);
    strokeWeight((width+height)*(.002));
    stroke(50, 20, 255);
    rect(width*(.2), height*(.09), width*(.605), height*(.07), (width+height)*(.01));
}//end Menu()

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
    
    text("GAME", width*(.5), height*(.55));
    text("_______", width*(.5), height*(.55));
    text("OBJECTIVE: HIT AND DESTROY ALL", width*(.5), height*(.6));
    text("THE BLOCKS", width*(.5), height*(.65));
    text("GREEN BLOCKS: SPAWN AN EXTRA", width*(.5), height*(.7));
    text("BALL", width*(.5), height*(.75));
    text("RED BLOCKS: SPEED UP BALLS", width*(.5), height*(.8));
    text("THAT HIT IT", width*(.5), height*(.85));
    
    text("ENTER TO CONTINUE", width*(.5), height*(.95));
    text("_________________________", width*(.5), height*(.95));
    
    if(checkKey(ENTER))
    {
        menu = 4;
    }//end if
}//end instructBrickBreak()