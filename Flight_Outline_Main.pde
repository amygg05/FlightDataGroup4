

Button button1, button2, button3;

import java.util.ArrayList;
ArrayList<String> flights = new ArrayList<>();
Read_Data newStorage = new Read_Data();

String[] lines;
Read_Data readDataObj;
Read_Data[] oneLine;

void setup()
{
  size(400, 400); 
  background(100);
  stroke(10);
  noFill();
  // Read in file 
  // reseult  = default query
  // current query = user query


  lines = loadStrings("flights2k.csv");
  button1 = new Button(50, 100, 150, 50);
  button2 = new Button(50, 225, 150, 50);
  button3 = new Button(50, 350, 150, 50);

    newStorage.readData();
  

}

void draw()
{
  background(100);
  

  button1.draw();
  button2.draw();
  button3.draw();

  

  // switch (current query)
  // case query1
  //   render query 
  //   breaker
  // case query2
  //    ertc.
  



  
   

   
   //do stuff 
  
}

  
  
  // render controls
  
