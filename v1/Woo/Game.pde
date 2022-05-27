public class Game {
  void display() {
    state = GAME;
    background(24, 58, 59);
    for (Ball ball : balls) {
      ball.updateVectors();
      ball.display();
    }
  }
}
