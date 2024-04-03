import processing.sound.*;
//GUYS FOR THE LOVE OF ALL THINGS HOLY CAN WE PLEASE START CODING CLASSES THAT ARE USEFUL FOR MORE THAN 1 SPECIFIC USECASE
import javax.swing.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

boolean page1 = true;
boolean page2, page3  = false;
float cloudX=400;float cloudX2=100;
PImage plane,plane2,planeHighlighted,arrow,backButtonImage,backButtonHighlighted,cloudImage, backgroundImage;
float x = 400,y = 400,wPlane=230,hPlane=230; 
float w = 300;
float h = 300;
int movedCloud = 0;
int SCREENX, SCREENY = 800;
SoundFile selectionSound;
SoundFile planeFlies;
SoundFile goBackButton;
String searchResult;
String finalSearch;


BarChart1 airlineFlights;
BarChart2 datesTime;
FlightAirportChart airport;
color[] colors; // Array to store colors for each slice

MovingPlane movingPlane1, movingPlane2;

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
dialogBox dropDownMenuAfterSearch;
PImage hamburgerMenu;


void setup()
{
  background(255);
  stroke(10);
  noFill();
  size(800,800); 
  
  selectionSound = new SoundFile(this, "cloudselection.mp3");
  arrow = loadImage("arrow.png");
  plane = loadImage("bluePlane.png");
  PImage passivePlane = loadImage("planeFromRight.png");
  PImage passivePlane2 = loadImage("planeFromRightSide.png");
  plane2 = loadImage("plane3.jpg");
  backButtonImage = loadImage("backButton.png");
  planeHighlighted = loadImage("bluePlaneSelected.png");
  cloudImage = loadImage("cloud.png");
  backButtonHighlighted=loadImage("backArrowSelected.png");
  backgroundImage = loadImage("USMAP.jpg");
  planeFlies = new SoundFile(this, "planeTakeOff.mp3");
  goBackButton = new SoundFile(this, "backButtonSound.mp3");

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
  String text1 = "Airline";
  String text2 = "Airport";
  String text3 = "Date";

  button1 = new Button(50, -10, 250, 250, cartoonCloudImage, cartoonCloudImageSelected, text1, selectionSound);
  button2 = new Button(50, 290, 250, 250, cartoonCloudImage, cartoonCloudImageSelected, text2, selectionSound);
  button3 = new Button(50, 590, 250, 250, cartoonCloudImage, cartoonCloudImageSelected, text3, selectionSound);
  movingPlane1 = new MovingPlane(passivePlane, -200, 170, 3, 300, 160);
  movingPlane2 = new MovingPlane(passivePlane2, 900, 470, 3, 300, 160);

  planeBtn1 = new ImageButton(x,y,plane,planeHighlighted,w,h, planeFlies);
  planeFliesPage2 = new ImageButton(0,400,plane,planeHighlighted,w,h, planeFlies);
  backBtn = new ImageButton(570,30,backButtonImage,backButtonHighlighted,90,70, goBackButton);
  
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
  Object[] queries = {"Late", "Depart By Week", "Cancelled/Diverted By Weeks"};
  String[] airports = {"JFK", "LAX", "FLL", "DCA"};
  dropdownMenu = new dialogBox(airlines);
  dropdownButton = new searchButton(0, 50, 50, 50, hamburgerMenu, dropdownMenu);
  dropDownMenuAfterSearch = new dialogBox(queries);

  
  colors = new color[]{color(#CB6363), 
color(#BD63CB), color(#639DCB), color(#CB9563), 
color(#8C53C9)};

}
void draw()
{
  if(page1){
    background(backgroundImage);
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
    searchResult = searchButton.getSavedInput();
    
    
    if(searchResult == "JFK" || searchResult == "LAX" || searchResult == "FLL" || searchResult == "DCA")
    {
        finalSearch = searchResult;
        
    }
    
    
    println(finalSearch);
  }
  
  else if (page2){
    background(backgroundImage);
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
    
    movingPlane2.updateNegative();

    movingPlane2.display();
  }
  else if (page3){
    background(255);

    switch(movedCloud)
    {
      case 1:
      backBtn.draw();
      backBtn.moveBackButton();
      searchButton.draw();
      //button1.drawCloud();
      airlineFlights.printing();
      //airlineFlights.draw();
      airlineFlights.drawPieChart();
      break;
      case 2:
      backBtn.draw();
      backBtn.moveBackButton();
      searchButton.draw();
      //button2.drawCloud();
      airport.printing();
      airport.drawPieChart();
      break;
      case 3:
      backBtn.draw();
      backBtn.moveBackButton();
      searchButton.draw();
      //button3.drawCloud();
      datesTime.printing();
      datesTime.draw();
      break;
    }
    
  }

}
  
