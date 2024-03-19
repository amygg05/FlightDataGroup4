
class Button {
  float x, y, w, h;
  String label;
  PFont widgetFont;
  PImage image, image2;
  int colour;
  boolean isMoving = false;
  float   movementSpeed = 2;
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
    text(label, x+10, y+height-10);

    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image2, x, y, w, h);
      println("The mouse is over the button");
      fill(colour);

      if (mousePressed)
      {
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
        if(x>= 400)
        {
          isMoving = false;
        }
      }
    
  }
}
