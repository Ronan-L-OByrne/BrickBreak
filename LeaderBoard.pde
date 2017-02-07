//Leaderboard Class
class Leaderboard
{
    int place;
    String name;
    int score;
    
    //Constructor for the Leaderboard
    Leaderboard(int place, String name, int score)
    {
        this.place = place;
        this.name = name;
        this.score = score;
    }//end Leaderboard
    
    String toString()
    {
        return place + ".\t" + name + "\t" + score;
    }//end toString()
}//end class Leaderboard

//Update the Leaderboard
void updateBoard(int score)
{
    //Checks if the users score is the new Best
    if(score > Lead.get(0).score)
    {
        Lead.add(0, new Leaderboard(1, objPlayer.get(0).pName, score));
        Lead.remove(10);
        
        for(int i=0; i<Lead.size(); i++)
        {
            Lead.get(i).place = i+1;
        }//end for
        
        //Saves the table
        writeData("LeaderBoard.csv");
    }//end if
    //Checks if the users score has beaten the lowest score
    else if(score > Lead.get(9).score)
    {
        for(int i=0; i<Lead.size()-1; i++)
        {
            //Checks if the score is between two of the current Scores
            if(score <= Lead.get(i).score && score > Lead.get(i+1).score)
            {
                Lead.add(i+1, new Leaderboard(i+2, objPlayer.get(0).pName, score));
                Lead.remove(10);
                break;
            }//end if
        }//end for
        
        //Resets the place number
        for(int i=0; i<Lead.size(); i++)
        {
            Lead.get(i).place = i+1;
        }//end for
        
        //Saves the table
        writeData("LeaderBoard.csv");
    }//end else if
}//end updateBoard()

//Load data from the table
void loadData(String file)
{
    Table t = loadTable(file);
    
    //For every row in the table
    for(int i=1; i<t.getRowCount(); i++)
    {
        TableRow row = t.getRow(i); // Variable to temporaraly hold the current
        
        //Loads all the data from the current row
        int place = i;
        String name = row.getString(1);
        int score = row.getInt(2);
        
        //Adds the data to the ArrayList
        Leaderboard temp = new Leaderboard(place, name, score);
        Lead.add(temp);
    }//end for
}//end loadData()

// Function to display the leaderboard.
void displayLeaderboard()
{
    background(20, 20, 75);
    
    //Draws the faint sun in the background
    DrawSun(color(25, 25, 80));
    
    fill(255);
    textFont(titleFont, (height+width)*(.025));
    textAlign(CENTER, CENTER);
    text("LEADERBOARD", width*(.5), height*(.15));
    text("_________________", width*(.5), height*(.15));
    
    textAlign(CENTER, CENTER);
    text("PLACE", width*(.2), height*(.225));
    text("_______", width*(.2), height*(.225));
    text("NAME", width*(.45), height*(.225));
    text("_______", width*(.45), height*(.225));
    text("SCORE", width*(.775), height*(.225));
    text("________", width*(.775), height*(.225));
    
    //Displays all of the entries in the leaderboard
    for(int i=0; i<Lead.size(); i++)
    {
        text(Lead.get(i).place, width*(.2), height*(.275)+((height*(.075))*i));
        text(Lead.get(i).name, width*(.45), height*(.275)+((height*(.075))*i));
        text(Lead.get(i).score, width*(.775), height*(.275)+((height*(.075))*i));
    }//end for
  
}//end displayLeaderboard()

//Writes data to the table
void writeData(String file)
{
    //Table t = loadTable(file);
    Table temp = new Table();
    
    temp.addColumn("Position", Table.INT);
    temp.addColumn("Name", Table.STRING);
    temp.addColumn("Score", Table.INT);
    
    //Fills each of the columns
    for(int i=0; i<10; i++)
    {
        temp.addRow();
        
        temp.setInt(i, "Position", (i+1));
        temp.setString(i, "Name", Lead.get(i).name);
        temp.setInt(i, "Score", Lead.get(i).score);
    }//end for
    
    //Saves the new table to the file
    saveTable(temp, "data/" + file);
}//end loadData()