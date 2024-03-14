class Read_Data{
  
  Read_Data(){
  }
  
  
  void readData(){
  lines = loadStrings("flights2k.csv");
  for(int i = 0; i < lines.length; i++){
    
    flights.add(lines[i]);
  }
  }
  

}
