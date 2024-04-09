/*
This class was collectively worked on by Amy and Eva
It reads in the data and sorts it into a table. From there it parses strings to ints for the columns that need to be used as ints.
In this class there is also a method calculating lateness from the extimated arrival time to actual arrival time.
There is also a method parsing the date column to sort the day, month, and year into an array for easy access
*/
final int NUM_COLS = 18;
final int ARR_TIME_COL = 14;
final int SCH_ARR_TIME_COL = 13;
final int MILITARY_CLOCK_MIN = 1440;
final int MAX_TIME_DIFF = -1080;
final int MIN_IN_HR = 60;
final int DATE_COLUMN = 0;
int num_row;
String colName;
Table data;

class Read_Data {

  Read_Data(Table passedTable) {
    data = passedTable;
  }

/*
This function reads in the data from the csv file and fills in the data table with each
column and row filled accordingly.
*/
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

/*
arrivalLateness(rowIndex):
    Takes a row index and returns the lateness (in minutes) of that flight.
    Note: If the flight was early, the value will be negative.
*/
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
  
  
/*
getDate(rowIndex):
    Takes a row index and returns an integer array with the parsed date values.
    date[0] - month
    date[1] - day
    date[2] - year
*/
  int[] getDate(int rowIndex) {
    String dateTimeString = data.getString(rowIndex, DATE_COLUMN);
    String[] dateParts = dateTimeString.split(" ");
    String[] parts = dateParts[0].split("/");

    // Assuming "MM/DD/YYYY" format
    int month = int(parts[0]);
    int day = int(parts[1]);
    int year = int(parts[2]);

    int[] date = new int[3];
    date[0] = month;
    date[1] = day;
    date[2] = year;
    return date;
  }
}
