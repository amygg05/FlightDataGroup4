boolean page1 = true;
boolean page2 = false;
boolean page3 = false;
PImage plane;
PImage plane2;
PImage arrow;
float x = 200;
float y = 200;
float w = 150;
float h = 150;

int SCREENX = 400;
int SCREENY = 400;

Button button1, button2, button3;
ImageButton planeImage;
ImageButton planeImage2;
Read_Data readingData;
PImage cartoonCloudImage;
PFont stdFont;


void setup()
{
  PFont font;
  arrow = loadImage("arrow1.png");
  plane = loadImage("plane3.jpg");
  plane2 = loadImage("plane3.jpg");
  font = loadFont("Verdana-Bold-40.vlw");
  textFont(font);
  size(400, 400); 
  background(255);
  stroke(10);
  noFill();
  stdFont = loadFont("ACaslonPro-Bold-48.vlw");textFont(stdFont);
  // reseult  = default query
  // current query = user query
  cartoonCloudImage = loadImage("cartooncloud.png");
  button1 = new Button(50, 100, 150, 70, cartoonCloudImage, "test", stdFont);
  button2 = new Button(50, 200, 150, 70, cartoonCloudImage, "test", stdFont);
  button3 = new Button(50, 300, 150, 70, cartoonCloudImage, "test", stdFont);
  planeImage = new ImageButton(x,y,plane,w,h);
  planeImage2 = new ImageButton(200,200,plane,w,h);

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
    text("     Click Here \n   For Flight Data",0,50);
    image(arrow,50,200,100,100);
  }
  
  else if (page2){
    background(255);
    button1.draw();
    button2.draw();
    button3.draw();
    fill(180,30,60);
    rect(x,y,40,100);
    planeImage2.draw();
    planeImage2.movePage2();
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
  
