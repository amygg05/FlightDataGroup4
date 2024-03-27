//for some stupid reason our two button classes are useless for image buttons, imagebutton is only useful for planes and arrows , and button is only useful for clouds now 
//(even though i coded it to be useful for any button.) so HERE WE ARE, A THIRD BUTTON CLASS DEEP.
class searchButton{
  int x,y,w,h;
  PImage image;
  dialogBox box;
  searchButton(int x,int y,int w,int h,PImage image, dialogBox box){
    this.x = x; this.y = y; this.w = w; this.h = h; this.image = image; this.box = box;
  }
  
  void draw(){
    if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y+h){
      image(image, x - 12, y - 12, w + 25, h + 25);
      if(mousePressed){
        if(mouseX > 400){  // if it's the search button
        String query = box.popup();
        System.out.println(query);}
       else{    // if its the dropdown
         String query = box.dropdown();
         System.out.println(query);    // return selection
         int index = query.indexOf("(");    //get index of airline code
         String substr = query.substring(index + 1, index + 3);
         System.out.println(substr);   // return airline code
       }
       }
      }
    else{
      image(image, x, y, w, h);
    }
}
}
