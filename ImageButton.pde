class ImageButton{
  float x,y,w,h;
  PImage plane;
  int colour;
  boolean isMoving=false;
  float speed = 5;
  
  ImageButton(float x,float y,PImage plane,float w, float h){
    this.x = x; this.y=y; this.w = w; this.h = h;this.plane = plane;
  }
  void draw(){
    image(plane,x,y,w,h);       
}  

  void move(){
       if (mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
    {
     // w+=2;
    //  h+=3;
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
        if(x>= 400)
        {
          isMoving = false;
          page1 = false;
          page2 = true;
        //  x=40;
          //y=200;
        }
      }
   } 
   void movePage2(){
    for (int i=0; i<=300;i++){
      println("page2");
       x-=300;
       y+=40;
    }
   }
  }
