Table table ;
ArrayList<Integer> dayList, monthList, yearList;
ArrayList<String> dateList;
int[] dayCount = new int[7];

class BarChart2{
  
  BarChart2(ArrayList<Integer> listDay, ArrayList<Integer> listMonth,ArrayList<Integer> listYear,ArrayList<String> listDate, Table passedTable)
  {
    dayList =listDay ;
    monthList= listMonth;
    yearList =listYear;
    dateList =listDate;
    table = passedTable;
  }

  void tableNew()
  {
    for(TableRow row :  table.rows()){
      String dateTimeString = row.getString("FL_DATE");
      String[] dateParts = dateTimeString.split(" ");
    
      dateList.add(dateParts[0]);
      String[] dateComponents = dateParts[0].split("/");
    
      int month = Integer.parseInt(dateComponents[2]);
      int day = Integer.parseInt(dateComponents[1]);
      int year = Integer.parseInt(dateComponents[0]);
    
      dayList.add(day);
      monthList.add(month);
      yearList.add(year);
    
      dayCount[day] ++;
    }
  }
 void printing(){
  for(int i = 1; i<=6; i++)
  {
    println("Day"+ i+ "count: "+ dayCount[i]);
  }
 }
  void draw(){
  line(60, 470, 60, 45);
  line(60, 470, 60, 370);
  
  float barWidth = width / (dayCount.length +1);
  float maxDataValue = (max(dayCount) -1);
  
  for(int i =1; i< dayCount.length; i++)
  {
    float x = i* barWidth;
    float y = map(dayCount[i], 0, maxDataValue, height, 50);
    float barHeight = height- y;
    
    
    textSize(10);
    fill(#D428E8);
    rect(x, y, barWidth - 10, barHeight -30);
    fill(#C7A4CB);
    textAlign(CENTER, BOTTOM);
    text(dayCount[i], x+ barWidth /2, height -28);
    textAlign(CENTER, TOP);
    text("01/0" + i + "/2022", x+ barWidth /2, height -28);
    
  }
  textSize(15);
  textAlign(CENTER, BOTTOM);
  text("Dates planes flew", 230, height -5);
  textAlign(RIGHT, BOTTOM);
  translate(30, height /2);
  rotate(-HALF_PI);
  text("Amount plane", 0, 0);
  }
  }
  
