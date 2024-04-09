class MovingPlane {
  PImage image;
  int x, y,  prevX, prevY, speed, imgWidth, imgHeight;                   //declare variables to be used for constructor                                                                         
  

  MovingPlane(PImage img, int xpos, int ypos, int sp, int wid, int heig) //constructor which assigns an image, position, speed, current location, and size of the plane
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
  
  void update()                                                          //method to update current position of plane, makes the plane move
  {
    prevX = x;
    prevY = y;
    
    x += speed;
    if (x > width) {
      x = -image.width;
    }
  }
  

  
  void updateNegative()                                                  //same as update(), but applies to plane going in other direction
  {
    prevX = x;
    prevY = y;
    x -= speed;
    if (x  < -300) {
      x = width+200;
    }
  }

  void display() {                                                        //essentially the draw function for the plane           
   
    image(image, x, y, imgWidth, imgHeight);
    
    }
}
  
