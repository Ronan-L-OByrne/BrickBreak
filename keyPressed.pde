//Checking when a key is pressed
void keyPressed()
{ 
    keys[keyCode] = true;
}//end keyPressed
 
void keyReleased()
{
    keys[keyCode] = false; 
}//end keyReleased

boolean checkKey(int k)
{
    if (keys.length >= k) 
    {
        return keys[k] || keys[Character.toUpperCase(k)];  
    }//end if
  return false;
}//end checkKey(int k)