public class Game {
  ArrayList<Ball> balls;
  Ball cueBall;
  Cue cue;
  Table table;

  Game() {
    balls = new ArrayList<>();

    for (int i = 0; i < COLORS.length; i++) {
      balls.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 1, SOLID, COLORS[i]));
      balls.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 9, STRIPE, COLORS[i]));
    }
  
    balls.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, 8, EIGHT, BLACK));
    cueBall = new Ball(random(width - 60) + 30, random(height - 60) + 30, 16, CUE, WHITE);
    
    cue = new Cue();
    table = new Table();
  }

  void display() {
    stroke(BLACK);
    background(51);

    state = GAME;

    table.display();

    for (Ball ball : balls) {
     ball.updateVectors();
     ball.display();
    }
    
    cue.display();

    cueBall.updateVectors();
    cueBall.display();

    for (Ball ball : balls) {
      if(cue.lineIntersects(ball)) {
        break;
      }
    }
    
  }
  
  void handleClick() {
    return;
  }
}
