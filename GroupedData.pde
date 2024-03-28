// this class will take user input and return a data table containing only useful data points for the given query
import processing.data.Table;

class GroupedData {
  String[] input;
  int type;
  Table data;
  Read_Data readDataObj;

  GroupedData(String[] input, int type, Table data)
  {
    this.input = input;
    // types: 1 - airlineCode; 2 - airportCode; 3 - date range
    this.type = type;
    this.data = data;
    readDataObj = new Read_Data(data);
  }

  Table groupData()
  {
    Table filteredTable = new Table();
    TableRow header = data.getRow(0);
    filteredTable.addRow(header);

    switch(type)
    {
    case 1:
      // Case 1: filter by airline code and return a table containing only "arrival lateness" for each flight
      filteredTable.addColumn("LATENESS"); // create column header
      filteredTable.addColumn("FL_DATE");
      for (TableRow row : data.rows()) {
        for (int rowIndex = 0; rowIndex < data.getRowCount(); rowIndex++)
        {
          String carrier = row.getString("MKT_CARRIER");
          if (carrier != null && carrier.trim().equalsIgnoreCase(input[0]))
          {
            //calculate lateness for that flight
            int currLateness = readDataObj.arrivalLateness(rowIndex);
            // add that into the table with the date
            TableRow newRow = filteredTable.addRow();
            String date = data.getString(rowIndex, 0);
            newRow.setString("FL_DATE", date);
            newRow.setInt("LATENESS", currLateness);
            print(filteredTable.getInt(rowIndex, 0));   // this prints as expected but in main it still returns a table that apparently has only one row that's empty.
          }
        }
      }
      return filteredTable;

    case 2:
      // Case 2: filter by airport code
      filteredTable.addColumn("Date"); // create column header
      int rowIndex = 0;
      for (TableRow row : data.rows()) {
        String depAirportCode = row.getString("ORIGIN");
        if (depAirportCode != null && depAirportCode.trim().equalsIgnoreCase(input[0])) {
          String date = data.getString(rowIndex, 0);
          TableRow newRow = filteredTable.addRow();
          newRow.setString("Date", date);
        }
        rowIndex++;
      }
      return filteredTable;

    case 3:
      // Case 3: fitler for flights within a given date range (returns a table with date and whether the flight was cancelled)
      // assuming that the input passed in is in the form of String[] input =  {"startDay cutoffDay"}
      // * left bound being the start day; right bound being the cutoff day
      filteredTable.addColumn("Date");
      filteredTable.addColumn("Cancelled");
      int startDay = int(input[0]);
      int cutoffDay = int(input[1]);
      for (int rowIndex1 = 0; rowIndex1 < data.getRowCount(); rowIndex1++) {
        int[] date = readDataObj.getDate(rowIndex1);
        int flightDay = date[1];
        if (flightDay >= startDay && flightDay <= cutoffDay) {
          TableRow newRow = filteredTable.addRow();
          // add new row containing the date and whether or not the flight was cancelled
          newRow.setString("Date", data.getString(0, rowIndex1));
          newRow.setInt("Cancelled", data.getInt(16, rowIndex1));
        }
      }
      return filteredTable;
    }
    return filteredTable;
  }
}
