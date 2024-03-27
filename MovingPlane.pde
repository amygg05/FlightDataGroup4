class MovingPlane {
  PImage image;
  int x, y;
  int speed, imgWidth, imgHeight, direction;

  MovingPlane(PImage img, int xpos, int ypos, int sp, int wid, int heig) 
  {
    image = img;
    x = xpos;
    y = ypos;
    speed = sp;
    imgWidth = wid;
    imgHeight= heig;
    
    
  }
  
  void update() {
    x += speed;
    if (x > width) {
      x = -image.width;
    }
  }
  
  void updateNegative(){
    x -= speed;
    if (x  < -300) {
      x = width+200;
    }
  }

  void display() {
    image(image, x, y, imgWidth, imgHeight);
  }
}
  
