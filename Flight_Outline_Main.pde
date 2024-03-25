


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

boolean page1 = true;
boolean page2 = false;
boolean page3 = false;
PImage plane;
PImage plane2;
PImage planeHighlighted;
PImage arrow;
PImage arrow2;
float xPlane = 500;
float yPlane = 400;
float wPlane = 230;
float hPlane = 230;

int SCREENX = 800;
int SCREENY = 800;
float x = 120;
float y = 150;
float w = 300;
float h = 300;
int movedCloud = 0;


BarChart1 airlineFlights;
BarChart2 datesTime;

FlightAirportChart airport;

MovingPlane movingPlane1;


boolean boohooo = true;



Button button1, button2, button3;
ImageButton planeImage;
ImageButton planeImage2;
Read_Data readingData;

PImage cartoonCloudImage, cartoonCloudImageSelected;


void setup()
{
  PFont stdFont;
  arrow = loadImage("arrow1.png");
  plane = loadImage("plane3.jpg");
  font = loadFont("Verdana-Bold-40.vlw");
  PImage passivePlane = loadImage("planeFromRight.png");
  plane2 = loadImage("plane3.jpg");
  arrow2 = loadImage("arrow2.jpg");
  planeHighlighted = loadImage("planeHighlighted.jpg");
  size(800,800); 
  background(255);
  stroke(10);
  noFill();
  textFont(font);
  size(800, 800); 
  background(225);
  stroke(10);
  noFill();
  Table csv = loadTable("flights2k.csv", "header"); // Table for chart
  //chart = new Chart(csv);

  stdFont = loadFont("ACaslonPro-Bold-48.vlw");textFont(stdFont);

  dateArray = new ArrayList<String>();
  dayArray = new ArrayList<Integer>();
  monthArray = new ArrayList<Integer>();
  yearArray = new ArrayList<Integer>();
  
  airportArray = new ArrayList<String>();
  
  datesTime = new BarChart2(dayArray, monthArray, yearArray, dateArray, csv);
  airport = new FlightAirportChart(csv, airportArray);
  // reseult  = default query
  // current query = user query
  cartoonCloudImage = loadImage("cartooncloud.png");
  cartoonCloudImageSelected = loadImage("cartooncloudselected.png");
  
  String text1 = "flights";
  String text2 = "schedule";
  String text3 = "arrivals";

  button1 = new Button(50, -10, 250, 250, cartoonCloudImage, cartoonCloudImageSelected, text1);
  button2 = new Button(50, 290, 250, 250, cartoonCloudImage, cartoonCloudImageSelected, text2);
  button3 = new Button(50, 590, 250, 250, cartoonCloudImage, cartoonCloudImageSelected, text3);
  movingPlane1 = new MovingPlane(passivePlane, -200, 170, 3, 300, 160);
  
  

  planeImage = new ImageButton(x,y,plane,arrow2,planeHighlighted,w,h);
  planeImage2 = new ImageButton(0,400,plane,arrow2,planeHighlighted,w,h);
  
  // Read in file 
  data = loadTable("flights2k.csv", "header");
  Read_Data readingData = new Read_Data(data);
  readingData.readData();
  println(readingData.arrivalLateness(37)); // this tests arrivalLateness --> 37 is just a random row index to test

  readingData.getDate(1);
  int[] test = readingData.getDate(1);
  println(test[1]);
  

}
void draw()
{
  if(page1){
    planeImage.draw();
    planeImage.move();
    fill(128,126,250);
    text("       Click Here \n   For Flight Data",100,150);
    image(arrow,xPlane-400,yPlane,wPlane,hPlane);
  }
  
  else if (page2){
    background(255);
    planeImage2.draw();
    planeImage2.movePage2();

    button1.draw();
    button2.draw();
    button3.draw();
    float x1 = button1.getX();
    float x2 = button2.getX();
    float x3 = button3.getX();
    if(x1>50)
    {
      movedCloud = 1;
    }
    else if(x2>50)
    {
      movedCloud = 2;
    }
    else
    {
      movedCloud = 3;
    } 
    if(x1>=700 || x2>=700 || x3>=700)
    {
      page2=false;
      page3=true;
    }
    
    movingPlane1.update();
    movingPlane1.display();
  }
  else if (page3){
    background(255);
    switch(movedCloud)
    {
      case 1:
      button1.drawCloud();
      break;
      case 2:
      button2.drawCloud();
      break;
      case 3:
      button3.drawCloud();
    }
    
    if(mousePressed)
    {
      background(255);
       page2=false;
       page3=true;
    }
    
  }
  else if(page3)  // Needs changing to display just temp
  {
    //chart.draw();
    
    while(boohooo)
    {
      
      airport.loadAirport();
      airport.printing();
      airport.draw();
      
      //datesTime.tableNew();
      //datesTime.printing();
      //datesTime.draw();
      boohooo = false;
    }
    
   
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
  
