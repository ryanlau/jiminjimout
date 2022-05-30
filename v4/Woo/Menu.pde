public class Menu {
  ArrayList<Button> buttons;

  Menu() {
    buttons = new ArrayList<>();
    buttons.add(new V1Button(510, 250, 100, 30, 20, WHITE, "1v1"));
    buttons.add(new V2Button(510, 300, 100, 30, 20, WHITE, "2v2"));
    buttons.add(new CloseButton(450, 350, 220, 30, 20, WHITE, "exit"));
  }


  void display() {
    state = MENU;
    background(0, 0, 0); //maybe have all black background and have 8balls bouncing in the back
    fill(256, 256, 256);
    text("Welcome to 8 ballin'", 400, 200); //COME UP WITH BETTER TITLE
    

    int cursor = ARROW;
    for (Button button : buttons) {
      button.display();
      if (button.mouseOver()) {
        cursor = HAND;
      }
    }

    cursor(cursor);
  }
  
  void handleClick() {
    for (Button button : buttons) {
      if (button.mouseOver()) {
        button.handleClick();
      }
    }
  }
}
