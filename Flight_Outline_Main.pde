import processing.sound.*; //<>//
import javax.swing.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

boolean completedCount = false;
boolean page1 = true;
boolean page2, page3  = false;
boolean piePressed = false;
boolean barPressed = false;
boolean linePressed = false;
float cloudX=400;
float cloudX2=100;
PImage plane, plane2, planeHighlighted, arrow, homeButtonImage, homeButtonHighlighted, cloudImage, backgroundImage;
float x = 400, y = 400, wPlane=230, hPlane=230;
float w = 300;
float h = 300;
int movedCloud = 0;
int SCREENX, SCREENY = 800;
SoundFile selectionSound;
SoundFile planeFlies;
SoundFile goBackButton;
float x1, x2, x3;
String searchResult;
String finalSearch;
float page2X=0, page2Y=400;
color[] colors; // Array to store colors for each slice

MovingPlane movingPlane1, movingPlane2;

Button pieButton, barButton, lineButton;
ImageButton planeBtn1;
ImageButton planeFliesPage2;
ImageButton homeBtn;
Read_Data readingData;

PImage cartoonCloudImage, cartoonCloudImageSelected;

dialogBox searchBox;
searchButton searchButton;
PImage searchIcon;
dialogBox dropdownMenu;
searchButton dropdownButton;
dialogBox dropDownMenuAfterSearch;
int chosenQuery = 1;
String chosenAirline;
GeneralChart firstChart;
Object[] queries = {"Late by Week", "Depart by Week", "Cancelled/Diverted by Week"};


void setup()
{
  background(255);
  stroke(10);
  noFill();
  size(800, 800);

  selectionSound = new SoundFile(this, "cloudselection.mp3");
  arrow = loadImage("arrow.png");
  plane = loadImage("bluePlane.png");
  PImage passivePlane = loadImage("planeFromRight.png");
  PImage passivePlane2 = loadImage("planeFromRightSide.png");
  plane2 = loadImage("plane3.jpg");
  homeButtonImage = loadImage("homeButton.png");
  planeHighlighted = loadImage("bluePlaneSelected.png");
  cloudImage = loadImage("cloud.png");
  homeButtonHighlighted=loadImage("backArrowSelected.png");
  backgroundImage = loadImage("USMAP.jpg");
  planeFlies = new SoundFile(this, "planeTakeOff.mp3");
  goBackButton = new SoundFile(this, "backButtonSound.mp3");
  PImage pieImage = loadImage("pieImage.png");
  PImage barImage = loadImage("barImage.png");
  PImage lineImage = loadImage("lineImage.png");


  cartoonCloudImage = loadImage("cartooncloud.png");
  cartoonCloudImageSelected = loadImage("cartooncloudselected.png");

  pieButton = new Button(50, 300, 150, 150, pieImage, pieImage, selectionSound);
  barButton = new Button(325, 300, 150, 150, barImage, barImage, selectionSound);
  lineButton = new Button(600, 300, 150, 150, lineImage, lineImage, selectionSound);
  movingPlane1 = new MovingPlane(passivePlane, -200, 170, 3, 300, 160);
  movingPlane2 = new MovingPlane(passivePlane2, 900, 470, 3, 300, 160);

  planeBtn1 = new ImageButton(x, y, plane, planeHighlighted, w, h, planeFlies);
  homeBtn = new ImageButton(700, 20, homeButtonImage, homeButtonHighlighted, 90, 70, goBackButton);

  // Read in file
  data = loadTable("flights_full.csv", "header");
  readingData = new Read_Data(data);
  readingData.readData();


  searchIcon = loadImage("airline.png");
  searchBox = new dialogBox("Enter an airline: ");
  searchButton = new searchButton(300, 300, 200, 200, searchIcon, searchBox);
  Object[] airlines = {"Alaska Airlines (AS)", "American Airlines (AA)", "Delta Airlines (DL) ", "Frontier Airlines (F9)"
    , "Hawaiian Airlines (HA)", "JetBlue Airways (B6)", "Southwest Airlines (WN)", "Spirit Airlines (NK)",
    "United Airlines (UA)", "USAirways (US)", "Allegiant Air LLC (G4)"};
  dropdownMenu = new dialogBox(airlines);
  dropDownMenuAfterSearch = new dialogBox(queries);


  colors = new color[]{color(#CB6363),
    color(#BD63CB), color(#639DCB), color(#CB9563),
    color(#8C53C9)};
}
void draw()
{
  if (page1) {
    page2X=0;
    page2Y=400;
    background(backgroundImage);
    PFont stdFont = loadFont("Arial-Black-60.vlw");
    textFont(stdFont);
    planeBtn1.draw();
    planeBtn1.movePage1();
    fill(128, 126, 250);
    textAlign(CENTER);
    text("Click Here \n For Flight Data", 400, 150);
    image(arrow, x-400, y, wPlane, hPlane);
    image(cloudImage, cloudX, 100, 300, 200);
    image(cloudImage, cloudX2, 100, 300, 200);
    cloudX++;
    cloudX2--;
    searchResult = searchButton.getSavedInput();
  } else if (page2) {
    cloudX=400;cloudX2=100;
    background(backgroundImage);
    image(plane, page2X, page2Y, w, h);
    page2X+=6;
    page2Y-=7;
    homeBtn.draw();
    homeBtn.homeButton();
    searchButton.draw();
    chosenQuery = searchButton.getSavedQuery();
    chosenAirline = searchButton.getSavedInput();
    if (chosenQuery != 0)
    {
      println("chosenQuery: " + chosenQuery);
      page2 = false;
      page3 = true;
    }
  } else if (page3) {
    background(255);
    switch(chosenQuery)
    {
    case 1: // chosen query == "Late"
      homeBtn.draw();
      homeBtn.homeButton();
      if (!barPressed && !linePressed)
      {
        pieButton.justDraw();
        pieButton.pieButtonPressed(1);
      }
      if (!piePressed && !linePressed)
      {
        barButton.justDraw();
        barButton.barButtonPressed(1);
      }
      if(!barPressed && !piePressed)
      {
        lineButton.justDraw();
        lineButton.lineButtonPressed(1);
      }
      break;
    case 2:
      homeBtn.draw();
      homeBtn.homeButton();
      if (!barPressed && !linePressed)
      {
        pieButton.justDraw();
        pieButton.pieButtonPressed(2);
      }
      if (!piePressed && !linePressed)
      {
        barButton.justDraw();
        barButton.barButtonPressed(2);
      }
      if(!barPressed && !piePressed)
      {
        lineButton.justDraw();
        lineButton.lineButtonPressed(2);
      }
      break;
    case 3:
      homeBtn.draw();
      homeBtn.homeButton();
      if (!barPressed && !linePressed)
      {
        pieButton.justDraw();
        pieButton.pieButtonPressed(3);
      }
      if (!piePressed && !linePressed)
      {
        barButton.justDraw();
        barButton.barButtonPressed(3);
      }
      if(!barPressed && !piePressed)
      {
        lineButton.justDraw();
        lineButton.lineButtonPressed(3);
      }
      break;
    }
  }
}
