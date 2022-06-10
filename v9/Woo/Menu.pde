// jimin: Ryan Lau, Melody Lew, Paul Serbanescu
// apcs pd6
// fp -- 8 ballin'
// 2022-06-10
// time spent: 50 hours

public class Menu {
  ArrayList<Button> buttons;

  Menu() {
    buttons = new ArrayList<>();
    buttons.add(new V1Button(width/2, 250, 220, 30, 20, WHITE, "1v1"));
    buttons.add(new CloseButton(width/2, 300, 220, 30, 20, WHITE, "exit"));
  }

  void display() {
    state = MENU;
    background(44,40,40); 
    fill(256, 256, 256);
    textAlign(CENTER);
    text("welcome to jimin's 8 ballin'", width/2, 200); //COME UP WITH BETTER TITLE

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
