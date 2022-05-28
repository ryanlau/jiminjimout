public class Menu {
  ArrayList<Button> buttons;

  Menu() {
    buttons = new ArrayList<>();
    buttons.add(new V1Button(400, 270, 100, 30, 20, MAROON, "1v1"));
    buttons.add(new V2Button(520, 270, 100, 30, 20, YELLOW, "2v2"));
    buttons.add(new CloseButton(400, 310, 220, 30, 20, RED, "exit"));
  }


  void display() {
    state = MENU;
    background(0, 255, 0);
    for (Button button : buttons) {
      button.display();
    }
  }

  void handleClick() {
     for (Button button: buttons) {
       if (button.mouseOver()) {
         button.handleClick();
       }
     }
  }
}
