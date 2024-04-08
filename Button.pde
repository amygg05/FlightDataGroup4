
class Button {
  float x, y, w, h;
  String label;
  PFont widgetFont;
  PImage image, image2;
  int colour;
  boolean isMoving = false;
  boolean isSelected = false;
  boolean showChart = false;
  float   movementSpeed = 4;
  SoundFile selected;

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
        isSelected = true;
        num_row = data.getRowCount();
        for (int i = 0; i < NUM_COLS; i++) {
          String colName = data.getColumnTitle(i);
          print(colName + "\t");  // Use "\t" for tab separation
          isMoving = true;
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

    if (isMoving)
    {
      x += movementSpeed;
      if (x>= 800)
      {
        isMoving = false;
        page2=false;
        page3=true;
        x=50;
      }
    }
  }

  int xPage3 = -90;
  int yPage3 = 0;
  boolean isMovingPage3 = false;

  void drawCloud()
  {
    image(cartoonCloudImage, xPage3, yPage3, 250, 250);
    if (xPage3<=3)
    {
      isMovingPage3 = true;
    }
    if (isMovingPage3 == true)
    {
      xPage3+=movementSpeed;
    }
    if (xPage3>= 3)
    {
      isMovingPage3 = false;
    }
  }

  float getX()
  {
    return this.x;
  }

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

  void justDraw()
  {
    image(image, x, y, w, h);
  }
  
  void reset()
  {
    showChart = false;
    piePressed = false;
    barPressed = false;
    linePressed = false;
  }
}
