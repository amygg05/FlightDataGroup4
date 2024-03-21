
boolean page1 = true;
boolean page2 = false;
boolean page3 = false;
PImage plane;
PImage plane2;
PImage planeHighlighted;
PImage arrow;
PImage arrow2;
float x = 500;
float y = 400;
float w = 230;
float h = 230;

int SCREENX = 800;
int SCREENY = 800;

Button button1, button2, button3;
ImageButton planeImage;
ImageButton planeImage2;
Read_Data readingData;
PImage cartoonCloudImage;


void setup()
{
  PFont stdFont;
  arrow = loadImage("arrow1.png");
  plane = loadImage("plane3.jpg");
  plane2 = loadImage("plane3.jpg");
  arrow2 = loadImage("arrow2.jpg");
  planeHighlighted = loadImage("planeHighlighted.jpg");
  size(800,800); 
  background(255);
  stroke(10);
  noFill();
  stdFont = loadFont("Arial-Black-60.vlw");textFont(stdFont);

  // reseult  = default query
  // current query = user query
  cartoonCloudImage = loadImage("cartooncloud.png");
  button1 = new Button(50, 100, 150, 70, cartoonCloudImage, "test", stdFont);
  button2 = new Button(50, 200, 150, 70, cartoonCloudImage, "test", stdFont);
  button3 = new Button(50, 300, 150, 70, cartoonCloudImage, "test", stdFont);

  planeImage = new ImageButton(x,y,plane,arrow2,planeHighlighted,w,h);
  planeImage2 = new ImageButton(0,400,plane,arrow2,planeHighlighted,w,h);
  
  // Read in file 
  data = loadTable("flights2k.csv", "header");
  Read_Data readingData = new Read_Data(data);
  readingData.readData();
  println(readingData.arrivalLateness(37)); // this tests arrivalLateness --> 37 is just a random row index to test
}
void draw()
{
  if(page1){
    planeImage.draw();
    planeImage.move();
    fill(128,126,250);
    text("       Click Here \n   For Flight Data",100,150);
    image(arrow,x-400,y,w,h);
  }
  
  else if (page2){
    background(255);
    planeImage2.draw();
    planeImage2.movePage2();
    button1.draw();
    button2.draw();
    button3.draw();

  }

 
  // switch (current query)
  // case query1
  //   render query 
  //   breaker
  // case query2
  //    ertc.
  



  
   

   
   //do stuff 
  
}

  
  
  // render controls
  
