class Chart {

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

  }
    
  

  void draw()
  {
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
}
