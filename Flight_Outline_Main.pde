int SCREENX = 400;
int SCREENY = 400;
Button button1, button2, button3;
Read_Data readingData;
PImage cartoonCloudImage;
PFont stdFont;

void setup()
{
  size(400, 400); 
  background(100);
  stroke(10);
  noFill();
  stdFont = loadFont("ACaslonPro-Bold-48.vlw");textFont(stdFont);
  // reseult  = default query
  // current query = user query
  
  cartoonCloudImage = loadImage("cartooncloud.png");

  button1 = new Button(50, 100, 150, 70, cartoonCloudImage, "test", stdFont);
  button2 = new Button(50, 200, 150, 70, cartoonCloudImage, "test", stdFont);
  button3 = new Button(50, 300, 150, 70, cartoonCloudImage, "test", stdFont);
  

  
 
  
  // Read in file 
  data = loadTable("flights2k.csv", "header");
  Read_Data readingData = new Read_Data(data);
  readingData.readData();
  println(readingData.arrivalLateness(37)); // this tests arrivalLateness --> 37 is just a random row index to test

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
  
