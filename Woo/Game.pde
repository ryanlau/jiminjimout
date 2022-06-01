public class Game {
  ArrayList<Ball> balls;
  Ball cueBall;
  Cue cue;
  Table table;

  Game() {
    balls = new ArrayList<>();
    cue = new Cue();
    table = new Table();
    //for (int i = 0; i < COLORS.length; i++) {
    //  balls.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 1, SOLID, COLORS[i]));
    //  balls.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 9, STRIPE, COLORS[i]));
    //}

    balls.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, 8, EIGHT, BLACK));
    
    PVector apexPos = new PVector (table.topLeftPos.x + 0.75 * table.w, table.topLeftPos.y + 0.5 * table.h);
    balls.add(new Ball(apexPos.x, apexPos.y, 1, SOLID, YELLOW));
    balls.add(new Ball(apexPos.x + 15, apexPos.y + 15, 2, SOLID, BLUE));
    balls.add(new Ball(apexPos.x + 30, apexPos.y + 30, 4, SOLID, BLUE));
    balls.add(new Ball(apexPos.x + 45, apexPos.y + 45, 7, SOLID, BLUE));
    balls.add(new Ball(apexPos.x + 45, apexPos.y + 45, 7, SOLID, BLUE));
    cueBall = new Ball(table.topLeftPos.x + 0.25 * table.w, table.topLeftPos.y + 0.5 * table.h, 16, CUE, WHITE);
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
      if (cue.lineIntersects(ball)) {
        break;
      }
    }
  }

  void handleClick() {
    return;
  }
}
