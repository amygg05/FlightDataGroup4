//for some stupid reason our two button classes are useless for image buttons, imagebutton is only useful for planes and arrows , and button is only useful for clouds now 
//(even though i coded it to be useful for any button.) so HERE WE ARE, A THIRD BUTTON CLASS DEEP.
import javax.swing.JOptionPane;
import javax.swing.JFrame;
class searchButton{
  int x,y,w,h;
  PImage image;
  dialogBox box;
  String savedInput;
  String savedInput2;
  
  
  searchButton(int x,int y,int w,int h,PImage image, dialogBox box){
    this.x = x; this.y = y; this.w = w; this.h = h; this.image = image; this.box = box;
  }
  
  void draw(){
    if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y+h){
      image(image, x - 12, y - 12, w + 25, h + 25);
      if(mousePressed){
        if(mouseX > 400){  // if it's the search button
        String airport;
        do {
          airport = box.popup();
          if(!isValidAirport(airport))
          {
            JOptionPane.showMessageDialog(null, "Invalid airport. Please try again.");
          }
        }while (!isValidAirport(airport));
        System.out.println(airport);
        savedInput = airport;
        if (airport != null && !airport.isEmpty()) {
            // Trigger dropdown only if airport input is provided
            triggerDropdown(airport);
          }
        }
       else{    // if its the dropdown
         Object[] queryList = {"Late", "Depart By Week", "Cancelled/Diverted By Weeks"};
         String query = box.dropdown(queryList);
         System.out.println(query);    // return selection
         if(query != ""){
         int index = query.indexOf("(");    //get index of airline code
         String substr = query.substring(index + 1, index + 3);
         System.out.println(substr);  
         savedInput = substr;
         } // return airline code}
       }
       }
      }
    else{
      image(image, x, y, w, h);
    }
}

void triggerDropdown(String airport)
{
  Object[] queryList = {"Late", "Depart By Week", "Cancelled/Diverted By Weeks"};
  String query = box.dropdown(queryList);
  println(query);
  if(!query.isEmpty())
  {
    int index = query.indexOf("(");
    if(index != -1)
    {
      String substr = query.substring(index+1, index+ 3);
      println(substr);
      savedInput2 = substr;
    }
  }
}

boolean isValidAirport(String airport)
{
  return airport != null && !airport.isEmpty() && (airport.equals("JFK") || airport.equals("LAX") || airport.equals("FLL") || airport.equals("DCA"));
}

String getSavedInput()
{
  return savedInput;
}

String getSavedQuery()
{
  return savedInput2;
}
}
