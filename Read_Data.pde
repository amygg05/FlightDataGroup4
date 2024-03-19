final int NUM_COLS = 18;
final int ARR_TIME_COL = 14;
final int SCH_ARR_TIME_COL = 13;
final int MILITARY_CLOCK_MIN = 1440;
final int MAX_TIME_DIFF = -1080;
final int MIN_IN_HR = 60;
int num_row;
String colName;
Table data;


class Read_Data {

  Read_Data(Table passedTable) {
    data = passedTable;
  }


  void readData() {

    num_row = data.getRowCount();


    for (int colIndex = 11; colIndex < NUM_COLS; colIndex++)
    {
      for (int i = 0; i < data.getRowCount(); i++) {
        String strVal = data.getString(i, colIndex);
        int intVal = int(strVal);  // Convert string to integer
        data.setInt(i, colIndex, intVal);  // Set the converted value back into the table
      }
    }

  }


  int arrivalLateness(int rowIndex)
  {
    int arrLateness = 0;
    int arrTime = 0;
    int schArrTime = data.getInt(rowIndex, SCH_ARR_TIME_COL);
    arrTime += data.getInt(rowIndex, ARR_TIME_COL);
    if (arrTime != 0)
    {
      int arrMins = arrTime % 100;
      int arrHours = arrTime - arrMins;
      arrMins += (arrHours / 100) * MIN_IN_HR;


      int schMins = schArrTime % 100;
      int schHours = schArrTime - schMins;
      schMins += (schHours / 100) * MIN_IN_HR;


      int arrivalDiff = arrMins - schMins;


      if (arrivalDiff < 0 && arrivalDiff > MAX_TIME_DIFF)
      {
        arrLateness = arrivalDiff;
      } else if (arrivalDiff < 0 && arrivalDiff < MAX_TIME_DIFF)
      {
        arrLateness += (MILITARY_CLOCK_MIN - schMins) + arrMins;
      } else
      {
        arrLateness += arrivalDiff;
      }
    }
    return arrLateness;
  }
  
  LocalDate getDate(int rowIndex)
  {
    String dateString = data.getString(rowIndex, "FL_DATE");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/DD/YYYY HH:mm");
    LocalDate dateTime = LocalDate.parse(dateString, formatter);
    return dateTime;
  }
}
