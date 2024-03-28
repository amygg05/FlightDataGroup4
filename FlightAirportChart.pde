//JFK LAX FLL DCA 
ArrayList<String> airportArray;
float[] count = new float[4];

String[] airportName = {"JFK", "LAX", "FLL", "DCA"};


  

class FlightAirportChart {
  
  FlightAirportChart(Table loadedTable, ArrayList<String> place)
  {
    table = loadedTable;
    airportArray = place;
  }
  
  void loadAirport()
  {
    for(TableRow row :  table.rows()){
      String airportString = row.getString("ORIGIN");
      switch (airportString){
         case "JFK":
           count[0] ++;
           break;
         case "LAX":
           count[1] ++;
           break;
         case "FLL":
           count[2] ++;
           break;
         case "DCA":
           count[3] ++;
           break;
           
      }
    }
  }
  
  void printing(){
  for(int i = 0; i<4; i++)
  {
    println("Airport "+ (i+1) + " count: "+ count[i]);
  }
  }
  
  void drawPieChart(){
    float startAngle =0;
    float diameter = min(width, height) * 0.8;
    //float totalAngle =0;
    
     float totalCount = 0;
    for (int i = 0; i < count.length; i++) {
        totalCount += count[i];
    }
    
    for (int i=0; i< count.length; i++)
    {
      float angle = radians(map(count[i], 0, totalCount, 0, 360));
      fill(colors[i]);
      arc(width/2, height/2, 300, 300, startAngle, startAngle + angle, PIE);
      startAngle += angle;
      
      float labelAngle = startAngle - angle / 2;
      float labelX = width/2 + cos(labelAngle) * diameter / 2 * 0.7; // Adjust label position
      float labelY = height/2 + sin(labelAngle) * diameter / 2 * 0.7; // Adjust label position
      textAlign(CENTER, CENTER);
      fill(128,126,250);
      PFont stdFont = loadFont("BellMTItalic-48.vlw");textFont(stdFont);
      text(airportName[i], labelX, labelY);
    }
  } 
  
  void draw(){
    line(60, 770, 60, 45);
    line(60, 770, 770, 770);
    
    float barWidth = width / (count.length +1);
    float maxDataValue = (max(count) -1);
  
  for(int i =0; i< count.length; i++)
  {
    float x = (i+1) * barWidth;
    float y = map(count[i], 0, maxDataValue, height, 50);
    float barHeight = height- y;
    
    
    textSize(15);
    fill(#E82A2A);
    rect(x, y, barWidth - 10, barHeight -30);
    fill(#A51111);
    textAlign(CENTER, BOTTOM);
    text(count[i], x+ barWidth /2, height -28);
    textAlign(CENTER, TOP);
    text( airportName[i] , x+ barWidth /2, height -28);
    
  }
  textSize(20);
  textAlign(CENTER, BOTTOM);
  text("Airports", 100, height -5);
  textAlign(RIGHT, BOTTOM);
  translate(30, height /2);
  rotate(-HALF_PI);
  text("Plane Amount", 0, 0);
  }
    
  }
  
  
