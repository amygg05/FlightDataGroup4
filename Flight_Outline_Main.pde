String[] lines;
void setup()
{
  size(500, 500); 
  
  // Read in file 
  // reseult  = default query
  // current query = user query

  lines = loadStrings("flights2k.csv");
  for(int i = 0; i < lines.length; i++){
    println(lines[i]);
  }
}

void draw()
{
  background(100);
  
  // switch (current query)
  // case query1
  //   render query 
  //   breaker
  // case query2
  //    ertc.
  
  // render controls
  
}
