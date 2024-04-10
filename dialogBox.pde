/*
Authors: Leo
 Function: Creates dialog box used to take in user input.
 */
class dialogBox {
  public String inputString;                             //declaring all variables to be used in class
  public String output;
  public Object[] list;
  public String choiceString;
  dialogBox(String inputString) {
    this.inputString = inputString;
  }
  public String popup() {                                 //method to create popup
    output = JOptionPane.showInputDialog(inputString);
    return output;
  }
  dialogBox(Object[] list) {
    this.list = list;
  }
  public String dropdown(Object[] list) {
    Object choice = JOptionPane.showInputDialog(null, "Choose", "Menu", JOptionPane.PLAIN_MESSAGE, null, list, list[0]);
    if (choice!= null) {
      choiceString = choice.toString();
    } else {
      choiceString = "";
    }
    return choiceString;
  }

  public String getChoice()
  {
    return choiceString;
  }
}
