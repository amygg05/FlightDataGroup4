class Chart {

<<<<<<< Updated upstream
int spacing =1;
int barWidth = 15;
int padding = 50;

float size=0;
int maxSize =100;

int boarderSize = 400;

float xSpacing;
float ySpacing;
Table data;

  Chart(Table passedTable)
  {
      data = passedTable;  

=======
int height =400;
int width = 400;
float xSpacing;
float ySpacing;
float Data[];

  Chart(float ReadData[])
  {
      Data = ReadData;
       xSpacing  = (width -100) / (ReadData.length -1);
       ySpacing = (height -100) / max(ReadData);
>>>>>>> Stashed changes
  }
    
  

  void draw()
  {
<<<<<<< Updated upstream
    stroke(0);
    line(padding, boarderSize-padding, boarderSize-padding, boarderSize-padding); // X-axis
    line(padding, boarderSize-padding, padding, padding); // Y-axis
    
    float maxie = getMaxVal(); // == 5095
    
    for (int i=0; i< data.getRowCount(); i++)
    {
      int val = data.getInt(i, "DISTANCE");
      
      float xpos = padding + (i);  // + (barWidth + spacing)
      float ypos = val; //+  (boarderSize-padding)
      float size = ((val/maxie) * maxSize);
      println(xpos, ypos);
      fill(50);
      
      rect(xpos, ypos/120, barWidth, size);
      println("Bar Sucess");
      
      
      // problem ==> graph shapped in the wrong area @ 0,0 (i think?) -> main issue is y, x is also off 
  }
}
public float getMaxVal(){
    int finalVal = 0;
    for (int i=0; i< data.getRowCount(); i++)
    {
     int val = data.getInt(i, "DISTANCE");
     if (finalVal< val)
     {
       finalVal = val;
     }     
  }
  return (float)finalVal;
  }
=======
    background(255);
    stroke(0);
    line(50, height-50, width-50, height-50); // X-axis
    line(50, height-50, 50, 50); // Y-axis
    
    
    for (int i=0; i< Data.length; i++)
    {
      float xpos = 50 + i*xSpacing;
      float ypos = (height - 50 - Data[i] ) * (ySpacing);
      size = (value/max_value) * max_size;
      
      
    
  }

}
>>>>>>> Stashed changes
}
