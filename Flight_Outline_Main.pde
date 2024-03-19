boolean page1 = true;
boolean page2 = false;
boolean page3 = false;
PImage plane;
PImage arrow;
float x = 120;
float y = 150;
float w = 300;
float h = 300;

int SCREENX = 400;
int SCREENY = 400;

Button button1, button2, button3;
Read_Data readingData;
PImage cartoonCloudImage;
PFont stdFont;

void setup()
{
  PFont font;
  arrow = loadImage("arrow1.png");
  plane = loadImage("plane3.jpg");
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
  
  // Read in file 
  data = loadTable("flights2k.csv", "header");
  Read_Data readingData = new Read_Data(data);
  readingData.readData();
  println(readingData.arrivalLateness(37)); // this tests arrivalLateness --> 37 is just a random row index to test

}

void draw()
{
  if(page1){
    background(255);
    fill(128,126,250);
    text("     Click Here \n   For Flight Data",0,50);
    image(plane,120,150,300,300);
    image(arrow,50,200,100,100);
     if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
     println("The mouse is over the button");
     if(mousePressed){
       background(255);
       page1=false;
       page2=true;
  }
     }
  }
  else if (page2){
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
  
