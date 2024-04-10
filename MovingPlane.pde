/*
Author: Ethan
 Function: displays moving planes (used on second page)
 */
class MovingPlane {
  PImage image;
  int x, y, prevX, prevY, speed, imgWidth, imgHeight;                   //declare variables to be used for constructor

  // Function: Constructor assigns an image, position, speed, current location, and size of plane
  MovingPlane(PImage img, int xpos, int ypos, int sp, int wid, int heig)
  {
    image = img;
    x = xpos;
    y = ypos;
    prevX = xpos;
    prevY = ypos;
    speed = sp;
    imgWidth = wid;
    imgHeight= heig;
  }

  // Function: updates current position of plane and makes plane move
  void update()
  {
    prevX = x;
    prevY = y;

    x += speed;
    if (x > width) {
      x = -image.width;
    }
  }

  // Function: same as update(), but applies to plane going in other direction
  void updateNegative()
  {
    prevX = x;
    prevY = y;
    x -= speed;
    if (x  < -300) {
      x = width+200;
    }
  }

  // Function: draws the plane
  void display() {
    image(image, x, y, imgWidth, imgHeight);
  }
}
