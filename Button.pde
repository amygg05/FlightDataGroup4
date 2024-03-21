
class Button {
  float x, y, w, h;
  String label;
  PFont widgetFont;

  PImage image;
  int colour;
  boolean isMoving = false;
  float   movementSpeed = 1;

  Button(float xpos, float ypos, float wid, float hig, PImage img, String lab, PFont font) {

    x = xpos;
    y = ypos;
    w = wid;
    h = hig;
    image = img;

    widgetFont = font;
    label = lab;

  }

  void draw()
  {
    colour = 255;
    image(image,x, y, w, h);
    fill(colour);

    text(label, x+10, y+height-10);

    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      colour = 200;
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
