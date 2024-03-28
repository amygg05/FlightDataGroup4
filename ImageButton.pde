class ImageButton{
  float x,y,w,h;
  PImage image;
  PImage imageHighlighted;
  boolean isMoving=false;
  boolean backBtnMoves=false;
  float speed = 6;
  SoundFile takeoff;
    
  ImageButton(float x,float y,PImage image,PImage imageHighlighted,float w, float h, SoundFile takeoff){
    this.x = x; this.y=y; this.w = w; this.h = h;this.image = image;this.imageHighlighted=imageHighlighted;
    this.takeoff=takeoff;
  }
  void draw(){
      image(image,x,y,w,h); 
  }
  void movePage1(){
       if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
        image(imageHighlighted,x,y,w,h);
      if (mousePressed)
      {
        takeoff.play();
        for (int i = 0; i < 10; i++) {
          isMoving = true;
        }       
      }
    }
    if(isMoving)
      {
        x += speed;
        y-=speed;
        if(x==760)
        {
          page1 = false;
          page2 = true;
          x=400;y=400;
          isMoving=false;
        }
      }
   } 
   void movePage2Plane(){     
   isMoving = true;
    if(isMoving)
      {
       x+=speed;y-=7;
      }
   }
   void moveBackButton(){
     if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(backButtonHighlighted,x,y,w,h);
      if (mousePressed)
      {
        for (int i = 0; i < 10; i++) {
          backBtnMoves = true;
        }       
      }
    }
    if(backBtnMoves)
      {
        x-=speed;
        if(x+w<=0)
        {
          if(page2){
            page1 = true;
            page2 = false;
          }
          if(page3){
            page3=false;
            page2=true;
          }
          backBtnMoves=false;
          x=600;y=30;
        }    
   }
   }
  }
