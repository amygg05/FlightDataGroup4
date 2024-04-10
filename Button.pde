/*
Authors: Eva and Ethan
 Class created buttons and applies their various functions
 */

class Button {
  float x, y, w, h;                                             //declare all variables in button class
  String label;
  PFont widgetFont;
  PImage image, image2;
  int colour;
  boolean isSelected, showChart;
  float   movementSpeed = 4;
  SoundFile selected;

  // Author: Ethan
  // Function: Constructor assigns position, size, images, and sound for each button
  Button(float xpos, float ypos, float wid, float hig, PImage img, PImage img2, SoundFile selection)
  {
    x = xpos;
    y = ypos;
    w = wid;
    h = hig;
    image = img;
    image2 = img2;
    selected = selection;
  }


  // Author: Ethan
  // Function: draw button and triggers sounds when clicked
  void draw()
  {
    fill(colour);
    colour = 255;
    image(image, x, y, w, h);
    fill(0);

    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image2, x, y, w, h);
      fill(colour);

      if (mousePressed)
      {
        mousePressed=false;
        isSelected = true;
        num_row = data.getRowCount();
        for (int i = 0; i < NUM_COLS; i++) {
          String colName = data.getColumnTitle(i);
          print(colName + "\t");                                // Use "\t" for tab separation
        }
        println();                                              // Move to next line after headers

        // Print data rows
        for (int i = 0; i < 10; i++) {
          for (int j = 0; j < NUM_COLS; j++) {
            String value = data.getString(i, j);                // Assuming String data type, adjust for others
            print(value + "\t");
          }
          println();                                            // Move to next line after each row
        }

        selected.play();
      }
    }
  }

  // Author: Ethan
  // Function: returns x position of button for movement
  float getX()
  {
    return this.x;
  }

  // Author: Eva
  // Function: triggers the pie chart to be created and drawn using the user input
  void pieButtonPressed(int choice)
  {
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image2, x-2, y-2, w+5, h+5);
      fill(colour);

      if (mousePressed)
      {
        selected.play();
        showChart = true;
      }
    }
    if (showChart)
    {
      background(255);
      homeBtn.draw();
      homeBtn.homeButton();
      firstChart = new GeneralChart(data, chosenAirline, choice, readingData);
      firstChart.dataWant();
      firstChart.pieDraw();
      piePressed = true;
    }
  }

  // Author: Eva
  // Function: triggers bar chart to be created and drawn using the user input
  void barButtonPressed(int choice)
  {
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image2, x-2, y-2, w+5, h+5);
      fill(colour);
      if (mousePressed)
      {
        selected.play();
        showChart = true;
      }
    }
    if (showChart)
    {
      background(255);
      homeBtn.draw();
      homeBtn.homeButton();
      firstChart = new GeneralChart(data, chosenAirline, choice, readingData);
      firstChart.dataWant();
      firstChart.draw();
      barPressed = true;
    }
  }

  // Author: Eva
  // Function:  triggers line graph to be created and drawn using the user input
  void lineButtonPressed(int choice)
  {
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image2, x-2, y-2, w+5, h+5);
      fill(colour);
      if (mousePressed)
      {
        selected.play();
        showChart = true;
      }
    }
    if (showChart)
    {
      background(255);
      homeBtn.draw();
      homeBtn.homeButton();
      firstChart = new GeneralChart(data, chosenAirline, choice, readingData);
      firstChart.dataWant();
      firstChart.drawLineGraph();
      linePressed = true;
    }
  }

  // Author: Eva
  // Function: standard draw method to add button to screen
  void justDraw()
  {
    image(image, x, y, w, h);
  }

  // Author: Eva
  // Function: resets the buttons (used for home button function)
  void reset()
  {
    mousePressed=false;
    showChart = false;
    piePressed = false;
    barPressed = false;
    linePressed = false;
  }
}
