/*
Authors: Leo, Ethan, and Eva
 Function: Applies function to the airline search box on page 2. First, typed input box pops up, then a drop down menu.
 The input values are then stored and made available for use in the program.
 */
class searchButton {
  int x, y, w, h;
  PImage image;
  dialogBox box;
  String savedInput;
  String savedInput2;
  int queryNumber;
  SoundFile selected;

  // Author: Leo and Ethan
  // Function: Constructor assigns values to x. y, width, height, image, dialog box, and drop down menu.
  searchButton(int x, int y, int w, int h, PImage image, dialogBox box, SoundFile selected) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.image = image;
    this.box = box;
    this.selected = selected;
  }


  // Author: Leo
  // Function: prompts the user for typed input (airline code) and then their chosen query in a drop down menu
  void draw() {
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y+h) {
      image(image, x, y, w + 25, h + 25);
      if (mousePressed) {
        mousePressed=false;
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
        }
      }
    } else {
      image(image, x, y, w, h);
    }
  }

  // Author: Ethan
  // Function: triggers drop down menu when called
  void triggerDropdown(String airline)
  {
    if (airline != null) {
      Object[] queryList = {"Delays By Week", "Departures By Week", "Cancellations/Diversions By Weeks"};
      String query = box.dropdown(queryList);
      if (query != "")
      {
        savedInput2 = query;
      }
    }
  }

  // Author: Ethan
  // Function: Determines whether user input airline code is valid
  boolean isValidAirline(String airline)
  {
    return airline != null && !airline.isEmpty() && (airline.equals("AS") || airline.equals("AA") || airline.equals("DL") || airline.equals("F9") || airline.equals("HA") || airline.equals("B6")
      || airline.equals("WN") || airline.equals("NK") || airline.equals("UA") || airline.equals("G4"));
  }

  // Author: Ethan
  // Function: returns the typed input (airline code) for use in main
  String getSavedInput()
  {
    String returnVal = savedInput;
    savedInput = "";
    return returnVal;
  }

  // Author: Eva
  // Function: returns an integer value that corresponds to user chosen query for use in main
  int getSavedQuery()
  {
    if (savedInput2 == "Delays By Week")
    {
      queryNumber = 1; // lateness is query 1
    } else if (savedInput2 == "Departures By Week")
    {
      queryNumber = 2;
    } else if (savedInput2 == "Cancellations/Diversions By Weeks")
    {
      queryNumber = 3;
    } else if (savedInput2 == "")
    {
      queryNumber = 0;
    }
    savedInput2 = "";
    return queryNumber;
  }
}
