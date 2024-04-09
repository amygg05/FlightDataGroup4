class ImageButton {
  float x, y, w, h;
  PImage image;
  PImage imageHighlighted;
  boolean isMoving=false;
  boolean backBtnMoves=false;
  boolean homeBtnPressed=false;
  float speed = 10;
  SoundFile selected;

  ImageButton(float x, float y, PImage image, PImage imageHighlighted, float w, float h, SoundFile selected) {
    this.x = x;
    this.y=y;
    this.w = w;
    this.h = h;
    this.image = image;
    this.imageHighlighted=imageHighlighted;
    this.selected=selected;
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
        selected.play();
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
        selected.play();
        for (int i = 0; i < 100; i++) {
          homeBtnPressed = true;
        }
      }
    }
    if (homeBtnPressed) {
      page2 = page3 = false;
      homeBtnPressed = false;
      page1 = true;
      pieButton.reset();
      barButton.reset();
      lineButton.reset();
      chosenQuery = 0;
      chosenAirline = "";
    }
  }
}
