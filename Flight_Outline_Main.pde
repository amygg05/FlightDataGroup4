//GUYS FOR THE LOVE OF ALL THINGS HOLY CAN WE PLEASE START CODING CLASSES THAT ARE USEFUL FOR MORE THAN 1 SPECIFIC USECASE

import javax.swing.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

boolean page1 = true;
boolean page2, page3  = false;
float cloudX=400;float cloudX2=100;
PImage plane,plane2,planeHighlighted,arrow,backButtonImage,backButtonHighlighted,cloudImage;
float xPlane = 400;
float yPlane = 400;
float w = 300;
float h = 300;
int movedCloud = 0;
int SCREENX, SCREENY = 800;

BarChart1 airlineFlights;
BarChart2 datesTime;
FlightAirportChart airport;

MovingPlane movingPlane1;

Button button1, button2, button3;
ImageButton planeBtn1;
ImageButton planeFliesPage2;

Read_Data readingData;

PImage cartoonCloudImage, cartoonCloudImageSelected;

dialogBox searchBox;
searchButton searchButton;
PImage searchIcon;

void setup()
{
  background(255);
  stroke(10);
  noFill();
  size(800,800); 
  
  PFont stdFont;
  arrow = loadImage("arrow1.png");
  plane = loadImage("bluePlane.png");
//  stdFont = loadFont("Verdana-Bold-40.vlw");
   stdFont = loadFont("Arial-Black-60.vlw");textFont(stdFont);
  PImage passivePlane = loadImage("planeFromRight.png");
  plane2 = loadImage("plane3.jpg");
  backButtonImage = loadImage("backButton.png");
  planeHighlighted = loadImage("planeHighlighted.jpg");
  cloudImage = loadImage("cloud.png");
  backButtonHighlighted=loadImage("backButtonHighlighted.png");

  Table csv = loadTable("flights2k.csv", "header"); // Table for chart
 
  dateArray = new ArrayList<String>();
  dayArray = new ArrayList<Integer>();
  monthArray = new ArrayList<Integer>();
  yearArray = new ArrayList<Integer>();
  
  airportArray = new ArrayList<String>();
  
  datesTime = new BarChart2(dayArray, monthArray, yearArray, dateArray, csv);
  airport = new FlightAirportChart(csv, airportArray);
  airlineFlights = new BarChart1(csv);
  airlineFlights.tableNew();
  datesTime.tableNew();

  cartoonCloudImage = loadImage("cartooncloud.png");
  cartoonCloudImageSelected = loadImage("cartooncloudselected.png");
  String text1 = "flights";
  String text2 = "schedule";
  String text3 = "arrivals";

  button1 = new Button(50, -10, 250, 250, cartoonCloudImage, cartoonCloudImageSelected, text1);
  button2 = new Button(50, 290, 250, 250, cartoonCloudImage, cartoonCloudImageSelected, text2);
  button3 = new Button(50, 590, 250, 250, cartoonCloudImage, cartoonCloudImageSelected, text3);
  movingPlane1 = new MovingPlane(passivePlane, -200, 170, 3, 300, 160);

  planeBtn1 = new ImageButton(xPlane,yPlane,plane,arrow,planeHighlighted,w,h);
  planeFliesPage2 = new ImageButton(0,400,plane,backButtonImage,backButtonHighlighted,w,h);
  
  // Read in file 
  data = loadTable("flights2k.csv", "header");
  Read_Data readingData = new Read_Data(data);
  readingData.readData();
  println(readingData.arrivalLateness(37)); // this tests arrivalLateness --> 37 is just a random row index to test

  readingData.getDate(1);
  int[] test = readingData.getDate(1);
  println(test[1]);
  
  airport.loadAirport();
  
  searchIcon = loadImage("search.png");
  searchBox = new dialogBox("Enter an airport: ");
  searchButton = new searchButton(750, 0, 50, 50, searchIcon, searchBox);

}
void draw()
{
  if(page1){
    background(255);
    planeBtn1.draw();
    planeBtn1.move();
    fill(128,126,250);
    text("       Click Here \n   For Flight Data",100,150);
    image(arrow,xPlane-400,yPlane,wPlane,hPlane);
    image(cloudImage,cloudX,100,300,200);
    image(cloudImage,cloudX2,100,300,200);
    cloudX++;cloudX2--;
    searchButton.draw();

    
  }
  
  else if (page2){
    background(255);
    planeFliesPage2.draw();
    planeFliesPage2.movePage2Plane();
    searchButton.draw();
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
      searchButton.draw();
      button1.drawCloud();
      airlineFlights.printing();
      airlineFlights.draw();
      break;
      case 2:
      searchButton.draw();
      button2.drawCloud();
      airport.printing();
      airport.draw();
      break;
      case 3:
      searchButton.draw();
      button3.drawCloud();
      datesTime.printing();
      datesTime.draw();
      break;
    }
    
    //if(mousePressed)
    //{
    //  background(255);
    //   page2=false;
    //   page3=true;
    //}
    
  }

}
  
