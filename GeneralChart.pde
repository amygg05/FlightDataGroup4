int[] generalCount = new int[4]; // keep 4 as 4 weeks in a month :D
int choice;
int day;
int rowIndex;
int[] date;

class GeneralChart {
  String column;
  String query;
  GeneralChart(Table loadTable, String airline, int option) 
  {
    data = loadTable;
    choice = option;
    rowIndex = 0;
    
  }
  
  void dataWant()
  {
    for(TableRow row :  data.rows()){
      rowIndex++;
      date = readingData.getDate(rowIndex);
      day = date[1];
      //String colfind = row.getString(column);
      switch (choice){    //Each case is for a different button --> date/ lateness/ cancellations 
        
        case 1:
           break;
        case 2:
           break;
        case 3:
          column = "CANCELLED";
          int cancelled = row.getInt(column);
          if(cancelled == 1){
            if(day >0 && day < 8){
              generalCount[0] ++;
            }
            else if(day >= 8 && day < 16){
              generalCount[1] ++;
            }
            else if(day >= 16 && day < 24){
              generalCount[2] ++;
            }
            else if(day >=24 && day < 32){
              generalCount[3] ++;
            }
          }
          column = "DIVERTED";
          int diverted = row.getInt(column);
          if(diverted == 1){
            if(day >0 && day < 8){
              generalCount[0] ++;
            }
            else if(day >= 8 && day < 16){
              generalCount[1] ++;
            }
            else if(day >= 16 && day < 24){
              generalCount[2] ++;
            }
            else if(day >=24 && day < 32){
              generalCount[3] ++;
            }
          }
           break;
           
           
        
        //case "NK":
        //  flightsCount[0] ++;
        //  break;
        //case "AA":
        //  flightsCount[1] ++;
        //  break;
        //case "AS":
        //  flightsCount[2] ++;
        //  break;
        //case "B6":
        //  flightsCount[3] ++;
        //  break;
        //default:
        // flightsCount[4] ++;
        //  break;
      }
    }
  }
  
  
  void pieDraw()
  {
    float startAngle =0;
    float diameter = min(width, height) * 0.8;
    //float totalAngle =0;
    
     float totalCount = 0;
    for (int i = 0; i < flightsCount.length; i++) {
        totalCount += flightsCount[i];
    }
    
    for (int i=0; i< flightsCount.length; i++)
    {
      float angle = radians(map(flightsCount[i], 0, totalCount, 0, 360));
      fill(colors[i]);
      arc(width/2, height/2, 300, 300, startAngle, startAngle + angle, PIE);
      startAngle += angle;
      
      float labelAngle = startAngle - angle / 2;
      float labelX = width/2 + cos(labelAngle) * diameter / 2 * 0.7; // Adjust label position
      float labelY = height/2 + sin(labelAngle) * diameter / 2 * 0.7; // Adjust label position
      textAlign(CENTER, CENTER);
      fill(128,126,250);
      PFont newFont = loadFont("BellMTItalic-48.vlw");textFont(newFont);
      text(airlineNames[i], labelX, labelY);
      
      
      textAlign(CENTER, TOP);
      text("Flight count by airline",475, 100);
    }
  }
  
  
  void draw()
  {
  }


}
