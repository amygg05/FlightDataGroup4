class Button{
  float x, y, w, h;
  int colour;
  Button(float xpos, float ypos, float wid, float hig){
    x = xpos; y = ypos; w = wid; h = hig;
  }
   
   void draw()
   {
     colour = 255;
     rect(x,y,w,h);
     fill(colour);
     if(mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
     {
       colour = 200;
       println("The mouse is over the button");
       fill(colour);
       //rect(x,y,w,h);
       
       if(mousePressed)
       {
         for(int i = 0; i < lines.length; i++)
         {
            println(lines[i]);
         }
        }
       }
   }
}
