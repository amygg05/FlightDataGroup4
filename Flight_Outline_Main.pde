import processing.sound.SoundFile;             // Sound library used for audio playback //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import javax.swing.JOptionPane;
import javax.swing.JFrame;                    // Swing library used for JOption Pane dialogs
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;    // Time library used for date/time gathering and formatting
import java.util.Date;                        // Date class for date reading


boolean page1, page2, page3, completedCount, piePressed, barPressed, linePressed;   // Load boolean variables
float cloudX, cloudX2, x1, x2, x3;
PImage plane, planeHighlighted, arrow, homeButtonImage, homeButtonHighlighted, cloudImage, backgroundImage, cartoonCloudImage, cartoonCloudImageSelected, searchIcon, flightTable;
final float x = 400, y = 400, wPlane=230, hPlane=230, w = 300, h = 300;
SoundFile selectionSound, planeFlies, goBackButton;
String searchResult;
float page2X=0, page2Y=400;
color[] colors; // Array to store colors for each slice
int chosenQuery = 1;
String chosenAirline;

MovingPlane movingPlane1, movingPlane2;                                                                    // create planes on page 2
Button pieButton, barButton, lineButton;                                                                   // create chart buttons
ImageButton planeBtn1, homeBtn;                                                                            // create plane and home button
Read_Data readingData;                                   
dialogBox searchBox, dropDownMenuAfterSearch;
searchButton searchButton;
GeneralChart firstChart;
Object[] queries = {"Late by Week", "Depart by Week", "Cancelled/Diverted by Week"};


void setup()
{
  background(255);                                                                                            // set size, background, clear outline on images 
  stroke(10);
  noFill();
  size(800, 800);

  selectionSound = new SoundFile(this, "cloudselection.mp3");                                                 // load sounds
  planeFlies = new SoundFile(this, "planeTakeOff.mp3");
  goBackButton = new SoundFile(this, "backButtonSound.mp3");
  arrow = loadImage("arrow.png");                                                                             // load cloud,plane and home button images
  plane = loadImage("bluePlane.png");
  PImage passivePlane = loadImage("planeFromRight.png");
  PImage passivePlane2 = loadImage("planeFromRightSide.png");
  cartoonCloudImage = loadImage("cartooncloud.png");
  cartoonCloudImageSelected = loadImage("cartooncloudselected.png");
  homeButtonImage = loadImage("homeButton.png");
  planeHighlighted = loadImage("bluePlaneSelected.png");
  cloudImage = loadImage("cloud.png");
  backgroundImage = loadImage("USMAP.jpg");
  searchIcon = loadImage("airline.png");
  PImage pieImage = loadImage("pieImage.png");                                                               // load chart icon images
  PImage barImage = loadImage("barImage.png");
  PImage lineImage = loadImage("lineImage.png");
  flightTable = loadImage("FlightTableNoUS.png");

  pieButton = new Button(50, 300, 150, 150, pieImage, pieImage, selectionSound);                             // create charts
  barButton = new Button(325, 300, 150, 150, barImage, barImage, selectionSound);
  lineButton = new Button(600, 300, 150, 150, lineImage, lineImage, selectionSound);
  
  movingPlane1 = new MovingPlane(passivePlane, -200, 100, 3, 300, 160);                                      // create moving planes
  movingPlane2 = new MovingPlane(passivePlane2, 900, 500, 3, 300, 160);
  
  planeBtn1 = new ImageButton(x, y, plane, planeHighlighted, w, h, planeFlies);                              // creates image button on page 1 and home button
  homeBtn = new ImageButton(700, 20, homeButtonImage, homeButtonHighlighted, 90, 70, goBackButton);

  // Read in file
  data = loadTable("flights_full.csv", "header");
  readingData = new Read_Data(data);
  readingData.readData();


  searchBox = new dialogBox("Enter an airline: ");                                                           // creates search box and dropdown
  searchButton = new searchButton(300, 500, 200, 200, searchIcon, searchBox, selectionSound);
  dropDownMenuAfterSearch = new dialogBox(queries);

  cloudX = 400;                                                                                              // set coordinates for clouds page 1                          
  cloudX2 = 100;
  page1 = true;
  colors = new color[]{color(#CB6363),
    color(#BD63CB), color(#639DCB), color(#CB9563),
    color(#8C53C9)};
}
void draw()
{
  if (page1) {
    page2X=0;                                                                        // plane page 1 coordiantes reset each time
    page2Y=400;
    background(backgroundImage);                                                     // load background image and fonts and text
    PFont stdFont = loadFont("Arial-Black-60.vlw");
    textFont(stdFont);
    planeBtn1.draw();                                                                // draw and move plane button page 1
    planeBtn1.movePage1();
    fill(#2941C1);
    textAlign(CENTER);
    text("Click Here \n For Flight Data", 400, 150);
    image(arrow, x-400, y, wPlane, hPlane);
    image(cloudImage, cloudX, 100, 300, 200);                                        // load cloud images and move them
    image(cloudImage, cloudX2, 100, 300, 200);
    cloudX++;                                     
    cloudX2--;
    searchResult = searchButton.getSavedInput();                    
  } else if (page2) {
    cloudX=400;cloudX2=100;                                                          // reset cloud coordinates
    background(backgroundImage);                                                     // clear screen before drawing
    image(plane, page2X, page2Y, w, h);                                              // draw and move plane from page 1 onto page 2
    page2X+=6;
    page2Y-=7;
    homeBtn.draw();                                                                  // draw home button
    homeBtn.homeButton();
    movingPlane1.display();                                                          // draw and move planes
    movingPlane1.update();
    movingPlane2.display();
    movingPlane2.updateNegative();
    searchButton.draw();                                                             // draw search box and recieve user input
    chosenQuery = searchButton.getSavedQuery();
    chosenAirline = searchButton.getSavedInput();
    image(flightTable, 250 , 10);
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
