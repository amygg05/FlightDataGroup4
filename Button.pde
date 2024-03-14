class Button{
  float x, y, w, h;
  
  Button(float xpos, float ypos, float wid, float hig){
    x = xpos; y = ypos; w = wid; h = hig;
  }
   
   void draw()
   {
     rect(x,y,w,h);
     fill(255);
     if(mouseX>=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h)
     {
       println("The mouse is over the button");
       rect(x,y,w,h);
       fill(200);
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
