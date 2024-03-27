//GUYS FOR THE LOVE OF ALL THINGS HOLY CAN WE PLEASE START CODING CLASSES THAT ARE USEFUL FOR MORE THAN 1 SPECIFIC USECASE
import javax.swing.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

boolean page1 = true;
boolean page2, page3  = false;
float cloudX=400;float cloudX2=100;
PImage plane,plane2,planeHighlighted,arrow,backButtonImage,backButtonHighlighted,cloudImage;
float x = 400,y = 400,wPlane=230,hPlane=230; 
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
ImageButton backBtn;
Read_Data readingData;

PImage cartoonCloudImage, cartoonCloudImageSelected;

dialogBox searchBox;
searchButton searchButton;
PImage searchIcon;
dialogBox dropdownMenu;
searchButton dropdownButton;
PImage hamburgerMenu;
void setup()
{
  background(255);
  stroke(10);
  noFill();
  size(800,800); 
  
  arrow = loadImage("arrow1.png");
  plane = loadImage("bluePlane.png");
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

  planeBtn1 = new ImageButton(x,y,plane,planeHighlighted,w,h);
  planeFliesPage2 = new ImageButton(0,400,plane,planeHighlighted,w,h);
  backBtn = new ImageButton(570,30,backButtonImage,backButtonHighlighted,90,70);
  
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
  hamburgerMenu = loadImage("hamburgerMenu.png");
  Object[] airlines = {"Alaska Airlines (AS)","American Airlines (AA)","Delta Airlines (DL) ","Frontier Airlines (F9)"
                      ,"Hawaiian Airlines (HA)","JetBlue Airways (B6)","Southwest Airlines (WN)","Spirit Airlines (NK)",
                        "United Airlines (UA)","USAirways (US)", "Allegiant Air LLC (G4)"};
  dropdownMenu = new dialogBox(airlines);
  dropdownButton = new searchButton(0, 50, 50, 50, hamburgerMenu, dropdownMenu);

}
void draw()
{
  if(page1){
    background(255);
    PFont stdFont = loadFont("Arial-Black-60.vlw");textFont(stdFont);
    planeBtn1.draw();    
    planeBtn1.movePage1();
    fill(128,126,250);
    text("       Click Here \n   For Flight Data",100,150);
    image(arrow,x-400,y,wPlane,hPlane);
    image(cloudImage,cloudX,100,300,200);
    image(cloudImage,cloudX2,100,300,200);
    cloudX++;cloudX2--;
    searchButton.draw();
    dropdownButton.draw();
  }
  
  else if (page2){
    background(255);
    planeFliesPage2.draw();
    planeFliesPage2.movePage2Plane();
    backBtn.draw();
    backBtn.moveBackButton();
    searchButton.draw();
    dropdownButton.draw();
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
      // think this is why back button dont work for page 3->2, as coordinates of clouds need to be reset maybe?
    }
    
    movingPlane1.update();
    movingPlane1.display();
  }
  else if (page3){
    background(255);

    switch(movedCloud)
    {
      case 1:
      backBtn.draw();
      backBtn.moveBackButton();
      searchButton.draw();
      button1.drawCloud();
      airlineFlights.printing();
      airlineFlights.draw();
      break;
      case 2:
      backBtn.draw();
      backBtn.moveBackButton();
      searchButton.draw();
      button2.drawCloud();
      airport.printing();
      airport.draw();
      break;
      case 3:
      backBtn.draw();
      backBtn.moveBackButton();
      searchButton.draw();
      button3.drawCloud();
      datesTime.printing();
      datesTime.draw();
      break;
    }
    
  }

}
  
