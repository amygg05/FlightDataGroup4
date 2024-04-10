/* //<>//
Authors: Olivia, Leo, Eva, and Amy
 Function: Filters the data according to user input. Contains functions that create the data visualizations.
 */
int[] generalCount = new int[4]; // keep 4 as 4 weeks in a month
int day;
int[] date;
String xAxisLabel;
String title;
float[] angles; // Store angles for animation

class GeneralChart {
  String column;
  String query;
  String airline;
  int choice;
  Read_Data dataR;

  // Authors: Olivia and Leo
  // Function: Constructor assigns data, airline, and choice to the object
  GeneralChart(Table loadTable, String airline, int option, Read_Data read)
  {
    data = loadTable;
    this.airline = airline;
    this.choice = option;
    this.dataR = read;
  }

  // Authors: Olivia, Leo, and Eva
  // Function: Filters the data for only relevant information. Sorts it accordingly for use when graphing
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

          case 1: // Delayed Flights -- Eva
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
            xAxisLabel = "Week ";

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

          case 3: // Diversions -- Leo
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


  // Author: Olivia
  // Function: Draws pie chart using filtered data
  void pieDraw()
  {
    //Variables used to represent the graph
    float startAngle =0;
    float diameter = min(width, height) * 0.8;
    float totalCount = 0;
    angles = new float[generalCount.length];

    //Count for the total segments on the chart
    for (int i = 0; i < generalCount.length; i++) {
      totalCount += generalCount[i];
    }

    // Calculate angles for each slice
    for (int j = 0; j < generalCount.length; j++) {
      angles[j] = radians(map(generalCount[j], 0, totalCount, 0, 360));
    }

    //This for loop draws each part of the pie chart
    for (int i=0; i< generalCount.length; i++)
    {
      float angle = radians(map(generalCount[i], 0, totalCount, 0, 360));
      fill(colors[i]);
      arc(width/2, height/2, 300, 300, startAngle, startAngle + angle, PIE);


      float labelAngle = startAngle - angle / 2;
      float labelX = width/2 + cos(labelAngle) * diameter / 2 * 0.7; // Adjust label position for name of slice
      float labelY = height/2 + sin(labelAngle) * diameter / 2 * 0.7; // Adjust label position for name of slice

      // Display percentage in slice
      float midAngle = startAngle + angles[i]/2;
      float perX = width/2 + 80 * cos(midAngle); // Adjust label position for percentage of slice
      float perY = height/2 + 50 * sin(midAngle); // Adjust label position for percentage of slice
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(25);
      text(nf(generalCount[i]*100/totalCount, 0, 1) + "%", perX, perY);

      startAngle += angle;

      //labels pie chart
      textAlign(CENTER, CENTER);
      fill(128, 126, 250);
      PFont newFont = loadFont("BellMTItalic-48.vlw");
      textFont(newFont);
      text(xAxisLabel + " " + (i + 1) + " ", labelX, labelY);

      //Title
      textAlign(CENTER, TOP);
      text(title, 400, 100);
    }
  }

  // Author: Olivia
  // Function: Draws bar chart using filtered data
  void draw() {
    line(60, 770, 60, 65);    // y-axis
    line(60, 770, 770, 770);  // x-axis

    //values used to represent data
    float barWidth = width / (generalCount.length +1);
    float maxDataValue = (max(generalCount) -1);

    // loop builds the graphs
    for (int i =0; i< generalCount.length; i++)
    {
      float x = (i+1) * barWidth;
      float y = map(generalCount[i], 0, maxDataValue, height, 100);
      float barHeight = height- y;


      //labels indivdual bars
      textSize(15);
      fill(#DC88DE);
      rect(x, y, barWidth - 10, barHeight -30);
      fill(#000000);
      textAlign(CENTER, BOTTOM);
      text(generalCount[i], x+ barWidth /2, y + 20);
      text((i+1), x+ barWidth /2, height-12);
      textAlign(CENTER, TOP);
    }

    //labels bar chart
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("Weeks in January", 120, height -5);
    textAlign(RIGHT, BOTTOM);
    translate(30, height /2);
    rotate(-HALF_PI);
    text(getQueryString(this.choice), 200, 0);
  }

  // Author: Amy
  // Function: Draws line graph using filtered data
  void drawLineGraph() {
    //axes
    line(60, 770, 60, 45);
    line(60, 770, 770, 770);

    //variables
    float cubeLineXPos = width / (generalCount.length + 1);
    float cubeWidth = 10;
    float cubeHeight = 10;
    float maxDataValue = (max(generalCount)-1);

    //horizontal lines
    double increments = maxDataValue/7;
    for (int countLine = 0; countLine<8; countLine++) {
      line(60, 770-(725/7)*countLine, 770, 770-(725/7)*countLine);
      textAlign(LEFT);
      text((int)increments*countLine, 60, 770-(725/7)*countLine);
    }

    //production of graph
    PVector previousPoint = null;
    for (int i = 0; i<generalCount.length; i++) {
      float x = (i+1) * cubeLineXPos;
      float y = map(generalCount[i], 0, maxDataValue, height, 50);

      //data points
      textSize(15);
      fill(#E82A2A);
      rect(x+ 85, y, cubeWidth, cubeHeight);
      fill(#A51111);
      textAlign(CENTER, BOTTOM);
      textAlign(CENTER, TOP);
      text((i+1), x + cubeLineXPos /2, height -23);

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
    text("Weeks in January", 120, height -5);
    textAlign(RIGHT, BOTTOM);
    translate(30, height/2);
    rotate(-HALF_PI);
    text(getQueryString(this.choice), 200, 0);
  }
  //in this class the queries are taken in as ints (either 1,2, or 3).
  //This method takes that input and put is back into string form for axes labels - Amy
  String getQueryString(int choice) {
    if (choice == 1) {
      return "Total Lateness (Number of Flights)";
    } else if (choice == 2) {
      return "Departures";
    } else if (choice == 3) {
      return "Cancellations or Diversions";
    }
    return "";
  }
}
