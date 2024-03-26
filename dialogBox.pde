import javax.swing.JOptionPane;
class dialogBox{
  public String inputString;
  public String output;
  dialogBox(String inputString){
    this.inputString = inputString;
  }
  public String popup(){
    output = JOptionPane.showInputDialog(inputString);
    return output;
  }
}
