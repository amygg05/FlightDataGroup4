class Cloud{
   float x;float y; PImage cloud;float x2;
   Cloud(PImage cloud){
     this.cloud=cloud;x=400;y=100;x2=100;
   }
   void draw(){
       image(cloud,x,y,300,200);
       image(cloud,x2,y,300,200);
   }
   void move(){
     x++; 
     x2--;
   }
}
