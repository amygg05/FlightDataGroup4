float x = 125;
float y = 50;
float w = 140;
float h = 80;

String[] lines;
void setup()
{
  size(400, 400); 
  background(100);
  stroke(10);
  noFill();
  // Read in file 
  // reseult  = default query
  // current query = user query

  lines = loadStrings("flights2k.csv");
  
}

void draw()
{
  background(100);
  rect(x,y,w,h);
  fill(255);
  
  // switch (current query)
  // case query1
  //   render query 
  //   breaker
  // case query2
  //    ertc.
  
  if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
   println("The mouse is over the button");
   rect(x,y,w,h);
   fill(200);
   if(mousePressed){
     for(int i = 0; i < lines.length; i++){
      println(lines[i]);
  }
   }
   
   //do stuff 
  }
  
  
  // render controls
  
}
