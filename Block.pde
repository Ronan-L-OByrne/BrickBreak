class Block
{
    float positionX;
    float positionY;
    float blockWidth;
    float blockHeight;
    color blockCol;
    
    void renderBlock()
    {
        strokeWeight((width+height)*(.001));
        stroke(0);
        fill(blockCol);
        rect(positionX-blockWidth*(.5), positionY-blockHeight*(.5), blockWidth, blockHeight);
    }//end renderBlock
}//end class Block

class Destruct extends Block
{
    int type;
    
    Destruct(float posX, float posY)
    {
        this.positionX = posX;
        this.positionY = posY;
        this.blockWidth = width*(.17);
        this.blockHeight = height*(.031);
    }//end Destruct()
    
    void checkBlock(int i, int x)
    {
        if(objBall.get(x).ballPos.y+objBall.get(x).ballDiam*(.5) > positionY-blockHeight*(.5) 
        && objBall.get(x).ballPos.y-objBall.get(x).ballDiam*(.5) < positionY+blockHeight*(.5)
        && objBall.get(x).ballPos.x > positionX-blockWidth*(.5)  
        && objBall.get(x).ballPos.x < positionX+blockWidth*(.5))
        {
            if(objBall.get(x).speed > 4)
            {
                objBall.get(x).speed -= .25; 
            }//end if
            
            if(type == 1)
            {
                ((PowerBlock)Grid.get(i)).hitPower();
            }//end if
            else if(type == 3)
            {
                ((HazardBlock)Grid.get(i)).hitHazard(x);
            }//end else if
            
            Grid.remove(i);
            
            if(objBall.get(x).theta >= HALF_PI && objBall.get(x).theta < PI)
            {
                objBall.get(x).theta = map(objBall.get(x).theta, HALF_PI, PI, HALF_PI, 0);
                objBall.get(x).ballPos.y = positionY-blockHeight*(.5)-1;
            }//end if
            else if(objBall.get(x).theta >= PI && objBall.get(x).theta < HALF_PI*3)
            {
                objBall.get(x).theta = map(objBall.get(x).theta, PI, HALF_PI*3, TWO_PI, HALF_PI*3);
            }//end else if
            else if(objBall.get(x).theta > 0 && objBall.get(x).theta < HALF_PI)
            {
                objBall.get(x).theta = map(objBall.get(x).theta, 0, HALF_PI, PI, HALF_PI);
            }//end else if
            else if(objBall.get(x).theta >= HALF_PI*3 && objBall.get(x).theta <= TWO_PI)
            {
                objBall.get(x).theta = map(objBall.get(x).theta, HALF_PI*3, TWO_PI, HALF_PI*3, PI);
            }//end else if
            else if(objBall.get(x).theta == 0)
            {
                objBall.get(x).theta = random(PI-HALF_PI/2, PI+HALF_PI/2);
            }//end else if
            
            if(objBall.get(x).ballPos.y > positionY)
            {
                objBall.get(x).ballPos.y = positionY+blockHeight*(.5)+1;
            }//end if
            else if(objBall.get(x).ballPos.y < positionY)
            {
                objBall.get(x).ballPos.y = positionY-blockHeight*(.5)-1;
            }//end else if
            
            objBall.get(x).forward.x = sin(objBall.get(x).theta);
            objBall.get(x).forward.y = -cos(objBall.get(x).theta);
        }//end else if
        else if(objBall.get(x).ballPos.x+objBall.get(x).ballDiam*(.5) > positionX-blockWidth*(.5)  
             && objBall.get(x).ballPos.x-objBall.get(x).ballDiam*(.5) < positionX+blockWidth*(.5)
             && objBall.get(x).ballPos.y > positionY-blockHeight*(.5) 
             && objBall.get(x).ballPos.y < positionY+blockHeight*(.5))
        {
            if(objBall.get(x).speed > 4)
            {
                objBall.get(x).speed -= .25; 
            }//end if
            
            if(type == 1)
            {
                ((PowerBlock)Grid.get(i)).hitPower();
            }//end if
            else if(type == 3)
            {
                ((HazardBlock)Grid.get(i)).hitHazard(x);
            }//end else if
            
            Grid.remove(i);
            
            if(objBall.get(x).theta >= HALF_PI && objBall.get(x).theta < PI)
            {
                objBall.get(x).theta = map(objBall.get(x).theta, HALF_PI, PI, HALF_PI*3, PI);
            }//end if
            else if(objBall.get(x).theta >= PI && objBall.get(x).theta < HALF_PI*3)
            {
                objBall.get(x).theta = map(objBall.get(x).theta, PI, HALF_PI*3, PI, HALF_PI);
            }//end else if
            else if(objBall.get(x).theta > 0 && objBall.get(x).theta < HALF_PI)
            {
                objBall.get(x).theta = map(objBall.get(x).theta, 0, HALF_PI, TWO_PI, HALF_PI*3);
            }//end else if
            else if(objBall.get(x).theta >= HALF_PI*3 && objBall.get(x).theta <= TWO_PI)
            {
                objBall.get(x).theta = map(objBall.get(x).theta, HALF_PI*3, TWO_PI, HALF_PI, 0);
            }//end else if
            
            if(objBall.get(x).ballPos.x > positionX)
            {
                objBall.get(x).ballPos.x = positionX+blockWidth*(.5)+1;
            }//end if
            else if(objBall.get(x).ballPos.x < positionX)
            {
                objBall.get(x).ballPos.x = positionX-blockWidth*(.5)-1;
            }//end else if
            
            objBall.get(x).forward.x = sin(objBall.get(x).theta);
            objBall.get(x).forward.y = -cos(objBall.get(x).theta);
        }//end else if
    }//end checkBlock
}//end class Destruct

class PowerBlock extends Destruct
{
    PowerBlock(float posX, float posY)
    {
        super(posX, posY);
        this.type = 1;
        this.blockCol = color(random(50,75), random(100,255), random(50,75));
    }//end PowerBlock
    
    void hitPower()
    {
        Ball newBall = new Ball();
        objBall.add(newBall);
    }//end hitPoswer()
}//end clss PowerBlock

class NormalBlock extends Destruct
{
    NormalBlock(float posX, float posY)
    {
        super(posX, posY);
        this.type = 2;
        this.blockCol = color(random(50,75), random(50,75), random(100,255));
    }//end NormalBlock
}//end clss NormalBlock

class HazardBlock extends Destruct
{
    HazardBlock(float posX, float posY)
    {
        super(posX, posY);
        this.type = 3;
        this.blockCol = color(random(150,255), random(75,100), random(75,100));
    }//end HazardBlock
    
    void hitHazard(int x)
    {
        objBall.get(x).speed = objBall.get(x).speed+2;
    }//end hitHazard()
}//end clss HazardBlock