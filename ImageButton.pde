class ImageButton{
  float x,y,w,h;
  PImage image;
  PImage imageHighlighted;
  PImage arrow;
  boolean isMoving=false;
  boolean backBtnMoves=false;
  float speed = 5;
  float backX,backY;
  ImageButton(float x,float y,PImage image,PImage imageHighlighted,PImage arrow,float w, float h){
    this.x = x; this.y=y; this.w = w; this.h = h;this.image = image;this.imageHighlighted=imageHighlighted;this.arrow=arrow;
    backX=600;backY=20;
  }
  void draw(){
    if(page1){
      image(image,x,y,w,h); 
    }
    if(page2){
      image(image,x,y,w,h);
      if(x>=SCREENX-200){   
        //image(plane,backX,backY,70,70);  
        image(arrow,backX,backY,80,80);
        moveBackButton();
      } 
    }
  }
  void move(){
       if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
        image(plane,x,y,w+10,h+10);
      if (mousePressed)
      {
        for (int i = 0; i < 10; i++) {
          isMoving = true;
        }       
      }
    }
    if(isMoving)
      {
        x += speed;
        y-=speed;
        if(x== SCREENX)
        {
          page1 = false;
          page2 = true;
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
     if (mouseX>=backX && mouseX <=backX+70 && mouseY>=backY && mouseY <=backY+70)
    {
      image(planeHighlighted,backX,backY,70,70);
      if (mousePressed)
      {
        for (int i = 0; i < 10; i++) {
          backBtnMoves = true;
        }       
      }
    }
    if(backBtnMoves)
      {
        backX-=speed;
        if(backX+w<=0)
        {
          backBtnMoves=false;
          page1 = true;
          page2 = false;
        }    
   }
   }
  }
