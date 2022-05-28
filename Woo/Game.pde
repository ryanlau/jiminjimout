public class Game {
  void display() {
    background(24, 58, 59);

    state = GAME;

    for (Ball ball : stripes) {
      ball.updateVectors();
      ball.display();
    }
    
    for (Ball ball : solids) {
      ball.updateVectors();
      ball.display();
    }
    
    cue.display();

    cueBall.updateVectors();
    cueBall.display();
    
    eightBall.updateVectors();
    cueBall.display();
  }
  
}
