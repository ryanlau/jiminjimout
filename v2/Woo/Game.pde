public class Game {
  ArrayList<Button> buttons;

  Game() {
    buttons = new ArrayList<Button>();
    
    
    
    
  }

  void display() {
    state = GAME;
    background(24, 58, 59);

    for (Button button : buttons) {
      button.display();
    }

    for (Ball ball : balls) {
      ball.updateVectors();
      ball.display();
    }
  }
  
}
