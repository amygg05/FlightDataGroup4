//for some stupid reason our two button classes are useless for image buttons, imagebutton is only useful for planes and arrows , and button is only useful for clouds now
//(even though i coded it to be useful for any button.) so HERE WE ARE, A THIRD BUTTON CLASS DEEP.
import javax.swing.JOptionPane;
import javax.swing.JFrame;
class searchButton {
  int x, y, w, h;
  PImage image;
  dialogBox box;
  String savedInput;
  String savedInput2;
  int queryNumber;


  searchButton(int x, int y, int w, int h, PImage image, dialogBox box) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.image = image;
    this.box = box;
  }

  void draw() {
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y+h) {
      image(image, x - 12, y - 12, w + 25, h + 25);
      if (mousePressed) {
        if (mouseX > 0) {  // if it's the search button
          String airline;
          do {
            airline = box.popup();
            if (!isValidAirline(airline))
            {
              JOptionPane.showMessageDialog(null, "Invalid airport. Please try again.");
            }
          } while (!isValidAirline(airline));
          System.out.println(airline);
          savedInput = airline;
          if (airline != null && !airline.isEmpty()) {
            // Trigger dropdown only if airport input is provided
            triggerDropdown(airline);
          }
        } else {    // if its the dropdown
          Object[] queryList = {"Late", "Depart By Week", "Cancelled/Diverted By Weeks"};
          String query = box.dropdown(queryList);
          System.out.println(query);    // return selection
          if (query != "") {
            int index = query.indexOf("(");    //get index of airline code
            String substr = query.substring(index + 1, index + 3);
            System.out.println(substr);
            savedInput2 = substr;
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
      Object[] queryList = {"Late", "Depart By Week", "Cancelled/Diverted By Weeks"};
      String query = box.dropdown(queryList);
      println(query);
      if (!query.isEmpty())
      {
        int index = query.indexOf("(");
        if (index != -1)
        {
          String substr = query.substring(index+1, index+ 3);
          println(substr);
          savedInput2 = substr;
        }
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
    return savedInput;
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
    }
    return queryNumber;
  }
}
