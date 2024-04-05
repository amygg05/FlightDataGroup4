class ImageButton {
  float x, y, w, h;
  PImage image;
  PImage imageHighlighted;
  boolean isMoving=false;
  boolean backBtnMoves=false;
  boolean homeBtnPressed=false;
  float speed = 10;
  SoundFile takeoff;

  ImageButton(float x, float y, PImage image, PImage imageHighlighted, float w, float h, SoundFile takeoff) {
    this.x = x;
    this.y=y;
    this.w = w;
    this.h = h;
    this.image = image;
    this.imageHighlighted=imageHighlighted;
    this.takeoff=takeoff;
  }
  void draw() {
    image(image, x, y, w, h);
  }
  void movePage1() {
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(imageHighlighted, x, y, w, h);
      if (mousePressed)
      {
        takeoff.play();
        for (int i = 0; i < 10; i++) {
          isMoving = true;
        }
      }
    }
    if (isMoving)
    {
      x += 6;
      y-=6;
      if (x==760)
      {
        page1 = false;
        page2 = true;
        page3=false;
        x=400;
        y=400;
        isMoving=false;
      }
    }
  }

  void homeButton() {
    if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(image, x-2, y-2, w+5, h+5);

      if (mousePressed)
      {
        for (int i = 0; i < 100; i++) {
          homeBtnPressed = true;
        }
      }
    }
    if (homeBtnPressed) {
      //x-=speed;
      //if(x<=0){
      //  homeBtnPressed=false;
      //  x=570;
      //  if(page2){
      //    page2=false;page1=true;
      //  }
      //  else {
      //    page3=false;page1=true;
      //  }
      //}
      page2 = page3 = false;
      homeBtnPressed = false;
      page1 = true;
      pieButton.reset();
      barButton.reset();
      chosenQuery = 0;
      chosenAirline = "";
      println("chosen query after home button: " + chosenQuery);
    }
  }
}
