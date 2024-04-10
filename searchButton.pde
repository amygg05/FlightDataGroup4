class searchButton {
  int x, y, w, h;
  PImage image;
  dialogBox box;
  String savedInput;
  String savedInput2;
  int queryNumber;
  SoundFile selected;


  searchButton(int x, int y, int w, int h, PImage image, dialogBox box, SoundFile selected) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.image = image;
    this.box = box;
    this.selected = selected;
  }

  void draw() {
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y+h) {
      image(image, x , y , w + 25, h + 25);
      if (mousePressed) {
        selected.play();
        if (mouseX > 0) {  // if it's the search button
          String airline;
          do {
            airline = box.popup();
            if (!isValidAirline(airline))
            {
              JOptionPane.showMessageDialog(null, "Invalid airline. Please try again.");
            }
          } while (!isValidAirline(airline));
          System.out.println(airline);
          savedInput = airline;
          if (airline != null && !airline.isEmpty()) {
            // Trigger dropdown only if airport input is provided
            triggerDropdown(airline);
          }
        } else {    // if its the dropdown
          Object[] queryList = {"Average Lateness By Week", "Departures By Week", "Cancellelations/Diversions By Weeks"};
          String query = box.dropdown(queryList);
          System.out.println(query);    // return selection
          if (query != "") {
            int index = query.indexOf("(");    //get index of airline code
            String substr = query.substring(index + 1, index + 3);
            System.out.println(substr);
            savedInput2 = substr;
            query = "";
            substr = "";
          } // return airline code}
        }
      }
    } else {
      image(image, x, y, w, h);
    }
  }

  void triggerDropdown(String airline)
  {
    if (airline != null) {
      Object[] queryList = {"Average Lateness By Week", "Departures By Week", "Cancellelations/Diversions By Weeks"};
      String query = box.dropdown(queryList);
      if(query != "")
      {
        savedInput2 = query;
      }
    }
  }

  boolean isValidAirline(String airline)
  {
    return airline != null && !airline.isEmpty() && (airline.equals("AS") || airline.equals("AA") || airline.equals("DL") || airline.equals("F9") || airline.equals("HA") || airline.equals("B6")
      || airline.equals("WN") || airline.equals("NK") || airline.equals("UA") || airline.equals("US") || airline.equals("G4"));
  }

  String getSavedInput()
  {
    String returnVal = savedInput;
    savedInput = "";
    return returnVal;
  }

  int getSavedQuery()
  {
    if(savedInput2 == "Late")
    {
      queryNumber = 1; // lateness is query 1
    } else if (savedInput2 == "Depart By Week")
    {
      queryNumber = 2;
    } else if(savedInput2 == "Cancelled/Diverted By Weeks")
    {
      queryNumber = 3;
    } else if(savedInput2 == "")
    {
      queryNumber = 0;
    }
    savedInput2 = "";
    return queryNumber;
  }
}
