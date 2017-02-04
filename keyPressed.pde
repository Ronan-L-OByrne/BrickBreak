//Records when a key is Pressed
void keyPressed()
{
    keys[keyCode] = true;
}//end keyPressed
 
//Records when a key is Released
void keyReleased()
{
    keys[keyCode] = false; 
}//end keyReleased

//Checks if a key has been pressed and returns boolean
boolean checkKey(int k)
{
    if (keys.length >= k) 
    {
        return keys[k] || keys[Character.toUpperCase(k)];  
    }//end if
  return false;
}//end checkKey(int k)