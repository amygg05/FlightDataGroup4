class backButton {
  float x,y,w,h;
  PImage plane;
  PImage planeHighlighted;
  boolean isMoving=false;
  float speed = 5; 
  
  backButton(float x,float y,PImage plane,PImage planeHighlighted,float w, float h){
    this.x = x; this.y=y; this.w = w; this.h = h;this.plane = plane;this.planeHighlighted=planeHighlighted;
  }
    void draw(){
      image(plane,x,y,w,h);
      
    }
}
  
