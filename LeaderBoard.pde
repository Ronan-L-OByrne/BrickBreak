//Leaderboard Class
class Leaderboard
{
    int place;
    String name;
    int score;
    
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
    if(score > Lead.get(0).score)
    {
        Lead.add(0, new Leaderboard(1, "NEW", score));
        Lead.remove(9);
        
        writeData("LeaderBoard.csv");
    }//end if
    else if(score > Lead.get(9).score)
    {
        for(int i=0; i<Lead.size()-1; i++)
        {
            if(score <= Lead.get(i).score && score > Lead.get(i+1).score)
            {
                Lead.add(i+1, new Leaderboard(i+2, "NEW", score));
                Lead.remove(9);
                break;
            }//end if
        }//end for
        
        for(int i=0; i<Lead.size(); i++)
        {
            Lead.get(i).place = i+1;
        }//end for
        
        writeData("LeaderBoard.csv");
    }//end else if
}//end updateBoard()

//Load data from the table
void loadData(String file)
{
    Table t = loadTable(file);
    
    for(int i=1; i<t.getRowCount(); i++)
    {
        TableRow row = t.getRow(i); // Variable to temporaraly hold the current
        
        int place = i;
        String name = row.getString(1);
        int score = row.getInt(2);
        
        Leaderboard temp = new Leaderboard(place, name, score);
        Lead.add(temp);
        
        println(Lead.get(i-1).toString());
    }//end for
}//end loadData()

//writes data to the table
void writeData(String file)
{
    //Table t = loadTable(file);
    Table temp = new Table();
    
    temp.addColumn("Position", Table.INT);
    temp.addColumn("Name", Table.STRING);
    temp.addColumn("Score", Table.INT);

    for(int i=0; i<10; i++)
    {
        //TableRow row = t.getRow(i);
        temp.addRow();
        
        temp.setInt(i, "Position", i);
        temp.setString(i, "Name", Lead.get(i).name);
        temp.setInt(i, "Score", Lead.get(i).score);
    }//end for
    
    saveTable(temp, "data/" + file);
}//end loadData()