// NK = SPIRIT [0], AA = AMERICAN AIRLINES [1], AS = ALASKAN AIRLINES [2], B6 = JETBLUE [3], OTHER [4]

int[] flightsCount = new int[5];
class BarChart1{
  
  BarChart1(Table passedTable)
  {
    table = passedTable;
  }

  void tableNew()
  {
    for(TableRow row :  table.rows()){
      String carrier = row.getString("MKT_CARRIER");
      switch (carrier){
        case "NK":
          flightsCount[0] ++;
          break;
        case "AA":
          flightsCount[1] ++;
          break;
        case "AS":
          flightsCount[2] ++;
          break;
        case "B6":
          flightsCount[3] ++;
          break;
        default:
         flightsCount[4] ++;
          break;
      }
      
    }
  }
 void printing(){
  for(int i = 0; i<=4; i++)
  {
    println("Airline"+ (i + 1) + "count: "+ flightsCount[i]);
  }
 }
  void draw(){
  line(60, 470, 60, 45);
  line(60, 470, 60, 370);
  
  float barWidth = width / (flightsCount.length +1);
  float maxDataValue = (max(flightsCount) -1);
  
  for(int i =0; i< flightsCount.length; i++)
  {
    float x = (i +1 )* barWidth;
    float y = map(flightsCount[i], 0, maxDataValue, height, 50);
    float barHeight = height- y;
    
    
    textSize(12);
    fill(#3e9e89);
    rect(x, y, barWidth - 10, barHeight -30);
    fill(#3e549e);
    textAlign(CENTER, BOTTOM);
    text(flightsCount[i], x+ barWidth /2, height -28);
    textAlign(CENTER, TOP);
    text("Airline " + (i + 1), x+ barWidth /2, height -28);
    
  }
  textSize(12);
  textAlign(CENTER, BOTTOM);
  text("                                                                                                             Airlines : [1 = SPIRIT NK, 2 = AMERICAN AIRLINES AA, 3 = ALASKAN AIRLINES AS, 4 = JETBLUE B6, 5 = OTHER AIRLINE]", 230, height -2);
  textAlign(RIGHT, BOTTOM);
  translate(30, height /2);
  rotate(-HALF_PI);
  textSize(17);
  text("Amount of Flights", 0, 0);
  }
  }
  
