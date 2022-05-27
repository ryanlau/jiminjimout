public class Game {
  void display() {
    state = GAME;
    background(255, 0, 0);
    for (Ball ball : balls) {
      ball.updateVectors();
      ball.display();
    }
  }
}
