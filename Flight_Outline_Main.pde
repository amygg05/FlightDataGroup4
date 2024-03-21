
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;


boolean page1 = true;
boolean page2 = false;
boolean page3 = false;
PImage plane;
PImage arrow;
float x = 120;
float y = 150;
float w = 300;
float h = 300;
Chart chart;
BarChart2 datesTime;
FlightAirportChart airport;

boolean boohooo = true;

int SCREENX = 500;
int SCREENY = 500;

Button button1, button2, button3;
Read_Data readingData;
PImage cartoonCloudImage, cartoonCloudImageSelected;
PFont stdFont;


void setup()
{
  PFont font;
  arrow = loadImage("arrow1.png");
  plane = loadImage("plane3.jpg");
  font = loadFont("Verdana-Bold-40.vlw");
  textFont(font);
  size(800, 800); 
  background(225);
  stroke(10);
  noFill();
  Table csv = loadTable("flights2k.csv", "header"); // Table for chart
  chart = new Chart(csv);

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

  button1 = new Button(50, 100, 150, 70, cartoonCloudImage, cartoonCloudImageSelected, "test");
  button2 = new Button(50, 200, 150, 70, cartoonCloudImage, cartoonCloudImageSelected, "test");
  button3 = new Button(50, 300, 150, 70, cartoonCloudImage, cartoonCloudImageSelected, "test");
  
  

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
    background(255);
    fill(128,126,250);
    text("     Click Here \n   For Flight Data",0,50);
    image(plane,150,200,350,350);
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
  
