class Button {
  float x, y, w, h;                                                                                   //declare all variables in button class
  String label;
  PFont widgetFont;
  PImage image, image2;
  int colour;
  boolean isSelected, showChart;
  float   movementSpeed = 4;
  SoundFile selected;

  Button(float xpos, float ypos, float wid, float hig, PImage img, PImage img2, SoundFile selection) //constructior which assigns the position, size, images, and sound for each button
  {
    x = xpos;
    y = ypos;
    w = wid;
    h = hig;
    image = img;
    image2 = img2;
    selected = selection;
  }

  void draw()                                                                                        //draws the button and triggers sounds when clicked 
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
          print(colName + "\t");  // Use "\t" for tab separation
        }
        println();  // Move to next line after headers

        // Print data rows
        for (int i = 0; i < 10; i++) {
          for (int j = 0; j < NUM_COLS; j++) {
            String value = data.getString(i, j);  // Assuming String data type, adjust for others
            print(value + "\t");
          }
          println();  // Move to next line after each row
        }

        selected.play();
      }
    }
  }

  float getX()                                                                                       //returns x position of button for movement
  {
    return this.x;
  }

  void pieButtonPressed(int choice)                                                                  // method to trigger the pie chart when chosen by user. The choice is saved and used as the parameter
  {
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image2, x-2, y-2, w+5, h+5);
      fill(colour);
      
      if(mousePressed)
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
  
  void barButtonPressed(int choice)                                                                 //method to trigger the bar chart when chosen by user 
  {
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image2, x-2, y-2, w+5, h+5);
      fill(colour);
      if(mousePressed)
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
  
  void lineButtonPressed(int choice)                                                             //method to trigger the line graph                           
  {
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image2, x-2, y-2, w+5, h+5);
      fill(colour);
      if(mousePressed)
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

  void justDraw()                                                                                    //standard draw method to add button to screen
  {
    image(image, x, y, w, h);
  }
  
  void reset()                                                                                      //method to reset what was pressed (used for home button function)
  {
    mousePressed=false;
    showChart = false;
    piePressed = false;
    barPressed = false;
    linePressed = false;
  }
}
