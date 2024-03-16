final int NUM_COLS = 18;
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
}
