int[] countLove = new int[4]; // keep 4 as 4 weeks in a month :D

class GeneralChart {
  String column;
  String query;
  GeneralChart(Table loadTable, String airline, int option) 
  {
    data = loadTable;
    int choice = option;
    
  }
  
  void dataWant()
  {
    for(TableRow row :  data.rows()){
      
      //String colfind = row.getString(column);
      switch (choice){
        
        case 1:
           break;
        case 2:
           break;
        case 3:
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
