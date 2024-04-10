/*
Class written by Orla
This function creates buttons used on the first page and the home button. 
*/
class ImageButton {
  float x, y, w, h;                                                                                            // load coordinates
  float speed = 10;    
  PImage image; PImage imageHighlighted;                                                                      // load button images
  boolean isMoving=false; boolean backBtnMoves=false; boolean homeBtnPressed=false;                           // load boolean variables
  SoundFile selected;                                                                                         // load sound files
  ImageButton(float x, float y, PImage image, PImage imageHighlighted, float w, float h, SoundFile selected) {   //constructor takes in images,coordinates and sound
    this.x = x;
    this.y=y;
    this.w = w;
    this.h = h;
    this.image = image;
    this.imageHighlighted=imageHighlighted;
    this.selected=selected;
  }
  void draw() {
    image(image, x, y, w, h);                                              // draw button image 
  }
  void movePage1() {                                                       // method for page 1 plane button
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(imageHighlighted, x, y, w, h);                                 // if mouse hovers over button , highlight button
      if (mousePressed)
      {
        selected.play();                                                   // if mouse clicks button, play sound 
        for (int i = 0; i < 10; i++) {                                     
          isMoving = true;                                                 // set moving boolean to true
        }
      }
    }
    if (isMoving)
    {
      x += 6;                                                                // fly plane off page 1
      y-=6;
      if (x==760)
      {
        page1 = false;                                                       // once plane is off page 1, reset all variables
        page2 = true;
        page3=false;
        x=400;
        y=400;
        isMoving=false;
      }
    }
  }

  void homeButton() {                                                         // method for home button 
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image, x-2, y-2, w+5, h+5);                                       // if mouse hovers, enlargen button slightly 

      if(mousePressed)
      {
        mousePressed=false;
        selected.play();                                                     // if home button pressed, play sound
        for (int i = 0; i < 100; i++) {
          homeBtnPressed = true;
        }
      }
    }
    if(homeBtnPressed){
      completedCount=false;
      page2 = page3 = false;                                                 // move back to page 1 
      homeBtnPressed = false;
      page1 = true;
      pieButton.reset();                                                     // reset chart drawings and queries
      mousePressed=false;
      barButton.reset();
      lineButton.reset();
      chosenQuery = 0;                                                      
      chosenAirline = "";
      generalCount[0] = 0;
      generalCount[1] = 0;
      generalCount[2] = 0;
      generalCount[3] = 0;
    }
  }
}
