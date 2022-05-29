public class Game {
  ArrayList<Ball> stripes;
  ArrayList<Ball> solids;
  ArrayList<Ball> allBalls;

  Ball eightBall;
  Ball cueBall;
  Cue cue;

  Game() {
    stripes = new ArrayList<>();
    solids = new ArrayList<>();
    allBalls = new ArrayList<>();

    for (int i = 0; i < COLORS.length; i++) {
      solids.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 1, SOLID, COLORS[i]));
      stripes.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 9, STRIPE, COLORS[i]));
    }

    eightBall = new Ball(random(width - 60) + 30, random(height - 60) + 30, 8, EIGHT, BLACK);
    cueBall = new Ball(random(width - 60) + 30, random(height - 60) + 30, 16, CUE, WHITE);
    
    cue = new Cue();

    // deep copy
    for (Ball ball : stripes) {
      allBalls.add(ball);
    }

    allBalls.addAll(solids);
    allBalls.add(eightBall);
  }

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
    eightBall.display(); 

    for (Ball ball : allBalls) {
      if(cue.lineIntersects(ball)) {
        break;
      }
    }
  }
  
  void handleClick() {
    return;
  }
}
