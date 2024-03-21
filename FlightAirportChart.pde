//JFK LAX FLL DCA 
ArrayList<String> airportArray;
int[] count = new int[4];

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
    
    
    textSize(25);
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
  
  
