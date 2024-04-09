int[] generalCount = new int[4]; // keep 4 as 4 weeks in a month :D //<>// //<>//
int day;
int[] date;
String xAxisLabel;
String title;


class GeneralChart {
  String column;
  String query;
  String airline;
  int choice;
  Read_Data dataR;


  GeneralChart(Table loadTable, String airline, int option, Read_Data read)
  {
    data = loadTable;
    this.airline = airline;
    this.choice = option;
    this.dataR = read;
  }

  void dataWant()
  {
    if (!completedCount)
    {
      for (int rowIndex = 1; rowIndex < data.getRowCount(); rowIndex++)
      {
        date = dataR.getDate(rowIndex);
        day = date[1];
        String comp = data.getString(rowIndex, 1);

        if (airline.equals(comp)) {
          switch (choice) {    //Each case is for a different button --> date/ lateness/ cancellations

          case 1: // Lateness -- Eva
            int lateness = dataR.arrivalLateness(rowIndex);
            title = "No. Late Flights/Week";
            xAxisLabel = "Week";
            if (lateness > 0)
            {
              if (day > 21)
              {
                generalCount[3] ++;
              } else if (day > 14 && day < 22)
              {
                generalCount[2] ++;
              } else if (day > 7 && day < 15)
              {
                generalCount[1] ++;
              } else if (day > 0 && day < 8)
              {
                generalCount[0] ++;
              }
            }
            completedCount = true;
            break;
            
           // Depature time -- Olivia 
          case 2:   
            //variable for titles for charts and axis
            column = "DEP_TIME";
            title= "Depature Time";
            xAxisLabel = "Time ";
            
            //Retrieves data from csv that gets the departure time
            int timeDep = data.getInt(rowIndex, column);
            
            //Gets count of days in each week
            if (timeDep != 0)
            {
              if (day >0 && day < 8)
              {
                generalCount[0]++;
              } else if (day >7 && day < 15)
              {
                generalCount[1]++;
              } else if (day >14 && day < 22)
              {
                generalCount[2]++;
              } else if (day >21 )
              {
                generalCount[3]++;
              }
            }
            
            
            completedCount = true;
            break;

          case 3:
            title= "Diversions/Cancellations";
            xAxisLabel = "Week";
            column = "CANCELLED";
            int cancelled = data.getInt(rowIndex, column);
            if (cancelled == 1) {
              if (day >0 && day < 8) {
                generalCount[0] ++;
              } else if (day >= 8 && day < 16) {
                generalCount[1] ++;
              } else if (day >= 16 && day < 24) {
                generalCount[2] ++;
              } else if (day >=24 && day < 32) {
                generalCount[3] ++;
              }
            }
            column = "DIVERTED";
            int diverted = data.getInt(rowIndex, column);
            if (diverted == 1) {
              if (day >0 && day < 8) {
                generalCount[0] ++;
              } else if (day >= 8 && day < 16) {
                generalCount[1] ++;
              } else if (day >= 16 && day < 24) {
                generalCount[2] ++;
              } else if (day >=24 && day < 32) {
                generalCount[3] ++;
              }
            }
            completedCount = true;
            break;
          }
        }
      }
    }
  }



  void pieDraw()  // Pie chart function - Olivia
  {
    //Variables used to represent the graph
    float startAngle =0;
    float diameter = min(width, height) * 0.8;
    float totalCount = 0;
    
    //Count for the total segments on the chart 
    for (int i = 0; i < generalCount.length; i++) {
      totalCount += generalCount[i];
    }

    //This for loop draws each part of the pie chart
    for (int i=0; i< generalCount.length; i++)
    {
      float angle = radians(map(generalCount[i], 0, totalCount, 0, 360));
      fill(colors[i]);
      arc(width/2, height/2, 300, 300, startAngle, startAngle + angle, PIE);
      startAngle += angle;  

      float labelAngle = startAngle - angle / 2;
      float labelX = width/2 + cos(labelAngle) * diameter / 2 * 0.7; // Adjust label position
      float labelY = height/2 + sin(labelAngle) * diameter / 2 * 0.7; // Adjust label position
      
      //labels pie chart
      textAlign(CENTER, CENTER);
      fill(128, 126, 250);
      PFont newFont = loadFont("BellMTItalic-48.vlw");
      textFont(newFont);
      text(xAxisLabel + " " + (i + 1), labelX, labelY);


      textAlign(CENTER, TOP);
      text(title, 475, 100);
    }
  }


  void draw() {   // Bar chart function - Olivia 
    line(60, 770, 60, 45);
    line(60, 770, 770, 770);

    float barWidth = width / (generalCount.length +1);
    float maxDataValue = (max(generalCount) -1);

    for (int i =0; i< generalCount.length; i++)
    {
      float x = (i+1) * barWidth;
      float y = map(generalCount[i], 0, maxDataValue, height, 50);
      float barHeight = height- y;


      textSize(15);
      fill(#E82A2A);
      rect(x, y, barWidth - 10, barHeight -30);
      fill(#000000);
      textAlign(CENTER, BOTTOM);
      text(generalCount[i], x+ barWidth /2, y + 20);
      text((i+1), x+ barWidth /2, height-12);
      textAlign(CENTER, TOP);
    }
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("Weeks in January", 100, height -5);
    textAlign(RIGHT, BOTTOM);
    translate(30, height /2);
    rotate(-HALF_PI);
    text(getQueryString(this.choice), 0, 0);
  }

  //this method draws a lineGraph that is able adapt to whichever query selected - Amy
  void drawLineGraph() {
    //axes
    line(60, 770, 60, 45);
    line(60, 770, 770, 770);

    //variables
    float barWidth = width / (generalCount.length + 1);
    float cubeWidth = 10;
    float cubeHeight = 10;
    float maxDataValue = (max(generalCount)-1);

    //horizontal lines
    double increments = maxDataValue/7;
    for (int countLine = 0; countLine<8; countLine++) {
      line(60, 770-(725/7)*countLine, 770, 770-(725/7)*countLine);
      textAlign(LEFT);
      text((int)increments*countLine, 30, 770-(725/7)*countLine);
    }

    //production of graph
    PVector previousPoint = null;
    for (int i = 0; i<generalCount.length; i++) {
      float x = (i+1) * barWidth;
      float y = map(generalCount[i], 0, maxDataValue, height, 50);

      //data points
      textSize(15);
      fill(#E82A2A);
      rect(x+ 85, y, cubeWidth, cubeHeight);
      fill(#A51111);
      textAlign(CENTER, BOTTOM);
      //do we want actual data value there?
      //text(generalCount[i], x+85, y+25);
      textAlign(CENTER, TOP);
      text("Week " + (i+1), x + barWidth /2, height -23);

      //connecting the dots
      if (previousPoint!=null) {
        line(previousPoint.x+90, previousPoint.y + 5, x+90, y+5);
      }
      //update previous point for next iteration
      previousPoint = new PVector(x, y);
    }
    //text for axes headers
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("Weeks in January", 100, height -5);
    textAlign(RIGHT, BOTTOM);
    translate(30, height/2);
    rotate(-HALF_PI);
    text(getQueryString(this.choice), 0, 0);
  }
  
  String getQueryString(int choice){
    if(choice == 1){
      return "Lateness (Mins)";
    } else if (choice == 2){
      return "Departures";
    } else if (choice == 3){
      return "Cancellations or Diversions";
    }
    return "";
  }
}
