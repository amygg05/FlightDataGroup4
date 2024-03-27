class Button {
  float x, y, w, h;
  String label;
  PFont widgetFont;
  PImage image, image2;
  int colour;
  boolean isMoving = false;
  boolean isSelected = false;
  float   movementSpeed = 4;
  Button(float xpos, float ypos, float wid, float hig, PImage img, PImage img2, String lab) 
  {
    x = xpos;
    y = ypos;
    w = wid;
    h = hig;
    image = img;
    image2 = img2;
    label = lab;
  }
  
  void draw()
  {
    fill(colour);
    colour = 255;
    image(image, x, y, w, h);
    fill(0);
    textSize(30);
    text(label, x+80, y+125);

    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image2, x, y, w, h);
      text(label, x+80, y+125);
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

      }
    }

    if(isMoving)
      {
        x += movementSpeed;
        if(x>= 800)
        {
          isMoving = false;
        }
      } 
  }
  
   int xPage3 = -90;
   int yPage3 = 0;
   boolean isMovingPage3 = false;
  
  void drawCloud()
  {
    image(cartoonCloudImage, xPage3, yPage3, 250, 250);
    textSize(30);
    fill(0);
    text(label, xPage3+185, yPage3+125);
    if(xPage3<=3)
    {
      isMovingPage3 = true;
    }
    if(isMovingPage3 == true)
    {
      xPage3+=movementSpeed;
    }
    if(xPage3>= 3)
    {
      isMovingPage3 = false;
    }
  }
  
  float getX()
  {
    return this.x;
  }
}
