int[] generalCount = new int[4]; // keep 4 as 4 weeks in a month :D //<>//
int choice;
int day;
int rowIndex;
int[] date;
String xAxisLabel;
String title;




class GeneralChart {
  String column;
  String query;
  String airline;
  int choice;
  Read_Data dataR;
  boolean isSame = false;


  GeneralChart(Table loadTable, String airline, int option, Read_Data read)
  {
    data = loadTable;
    this.airline = airline;
    this.choice = option;
    rowIndex = 0;
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
          case 2:// Depature time -- Liv
            column = "DEP_TIME";
            title= "Depature Time";
            xAxisLabel = "Time ";
            int timeDep = data.getInt(rowIndex, column);
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

  void pieDraw()
  {
    float startAngle =0;
    float diameter = min(width, height) * 0.8;
    //float totalAngle =0;

    float totalCount = 0;
    for (int i = 0; i < generalCount.length; i++) {
      totalCount += generalCount[i];
    }

    for (int i=0; i< generalCount.length; i++)
    {
      float angle = radians(map(generalCount[i], 0, totalCount, 0, 360));
      fill(colors[i]);
      arc(width/2, height/2, 300, 300, startAngle, startAngle + angle, PIE);
      startAngle += angle;

      float labelAngle = startAngle - angle / 2;
      float labelX = width/2 + cos(labelAngle) * diameter / 2 * 0.7; // Adjust label position
      float labelY = height/2 + sin(labelAngle) * diameter / 2 * 0.7; // Adjust label position
      textAlign(CENTER, CENTER);
      fill(128, 126, 250);
      PFont newFont = loadFont("BellMTItalic-48.vlw");
      textFont(newFont);
      text(xAxisLabel, labelX, labelY);


      textAlign(CENTER, TOP);
      text(title, 475, 100);
    }
  }


  void draw() {
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
      fill(#A51111);
      textAlign(CENTER, BOTTOM);
      text(generalCount[i], x+ barWidth /2, height -28);
      textAlign(CENTER, TOP);
      //text( xAxisLabel, x+ barWidth /2, height -28);
    }
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("change titles", 100, height -5);//=============chsnge title
    textAlign(RIGHT, BOTTOM);
    translate(30, height /2);
    rotate(-HALF_PI);
    text("change title", 0, 0); //=======change title
  }




  void drawLineGraph() {
    line(60, 770, 60, 45);
    line(60, 770, 770, 770);

    float barWidth = width / (generalCount.length + 1);
    float cubeWidth = 10;
    float cubeHeight = 10;
    float maxDataValue = (max(generalCount)-1);

    //horizontal lines
    double increments = maxDataValue/5;
    double lineIncrements = maxDataValue/5*7;
    for (int countLine = 0; countLine<5; countLine++) {
      textAlign(LEFT);
      text((char)increments, 30, (float)lineIncrements+countLine + 45);
      line((float)60, (float)lineIncrements*countLine + 45, 770, (float)lineIncrements*countLine + 45);
    }

    PVector previousPoint = null;
    for (int i = 0; i<generalCount.length; i++) {
      float x = (i+1) * barWidth;
      float y = map(generalCount[i], 0, maxDataValue, height, 50);

      textSize(15);
      fill(#E82A2A);
      rect(x+ 85, y, cubeWidth, cubeHeight);
      fill(#A51111);
      textAlign(CENTER, BOTTOM);
      //check to make sure this is okay
      text(generalCount[i], x+85, y+25);
      textAlign(CENTER, TOP);
      //THIS HAS TO CHANGE FOR GENERALIZATION
      text("whatever we are measuring (change)", x + barWidth /2, height -28);

      if (previousPoint!=null) {
        line(previousPoint.x+90, previousPoint.y + 5, x+90, y+5);
      }
      //update previous point for next iteration
      previousPoint = new PVector(x, y);
    }
    textSize(20);
    textAlign(CENTER, BOTTOM);
    //TEXT NEEDS GENERALIZATION
    text("query(change)", 100, height -5);
    textAlign(RIGHT, BOTTOM);
    translate(30, height/2);
    //TEXT NEEDS GENERALIZATION
    text("y value(change)", 0, 0);
  }
}
