class ImageButton{
  float x,y,w,h;
  PImage plane;
  PImage planeHighlighted;
  PImage arrow;
  boolean isMoving=false;
  float speed = 5;
  
  ImageButton(float x,float y,PImage plane,PImage arrow,PImage planeHighlighted,float w, float h){
    this.x = x; this.y=y; this.w = w; this.h = h;this.plane = plane;this.planeHighlighted=planeHighlighted;this.arrow=arrow;
  }
  void draw(){
    if(page1){
      image(plane,x,y,w,h); 
    }
    if(page2){
      image(plane,x,y,w,h);
      if(x>=SCREENX-70){   
        image(plane,500,20,70,70);  
        image(arrow,400,20,70,70);
      } 
    }
  }
  void move(){
       if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
      image(planeHighlighted,x,y,w,h);
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
        if(x>= SCREENX)
        {
          page1 = false;
          page2 = true;
        }
      }
   } 
   void movePage2(){     
   isMoving = true;
    if(isMoving)
      {
       x+=speed;y-=7;
      }
   }
   void moveBackButton(){
       
   }
  }
