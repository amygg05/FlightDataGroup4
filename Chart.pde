class Chart {

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
  }
    
  

  void draw()
  {
    background(255);
    stroke(0);
    line(50, height-50, width-50, height-50); // X-axis
    line(50, height-50, 50, 50); // Y-axis
    
    
    for (int i=0; i< Data.length; i++)
    {
      float xpos = 50 + i*xSpacing;
      float ypos = (height - 50 - Data[i] ) * (ySpacing);
      //size = (value/max_value) * max_size;

    //  size = (value/max_value) * max_size;
      
      
  }

}
}
