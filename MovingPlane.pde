import processing.sound.*;

class MovingPlane {
  PImage image;
  int x, y;
  int prevX, prevY;
  int speed, imgWidth, imgHeight;
  

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
  
  void update() 
  {
    prevX = x;
    prevY = y;
    
    x += speed;
    if (x > width) {
      x = -image.width;
    }
  }
  

  
  void updateNegative()
  {
    prevX = x;
    prevY = y;
    x -= speed;
    if (x  < -300) {
      x = width+200;
    }
  }

  void display() {
   
    image(image, x, y, imgWidth, imgHeight);
    
    /*float tailLength = 100; 
    float step = tailLength / 5; 
    float tailX = x+y;
    float tailY = y;
    
    for (int i = 0; i < 5; i++) {
        float opacity = 255 * (1 - i * step / tailLength); 
        stroke(0, 0, 255, opacity); 
        float endX = tailX - i * step; 
        line(tailX, tailY, endX, tailY); 
        tailX = endX; 
    */
    
    }
}
  
