public class Game {
  ArrayList<Ball> balls;
  ArrayList<Ball[]> ballPairs;
  Ball cueBall;
  Cue cue;
  Table table;

  Game() {
    balls = new ArrayList<>();
    ballPairs = new ArrayList<>();
    cue = new Cue();
    table = new Table();

    //for (int i = 0; i < COLORS.length; i++) {
    //  balls.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 1, SOLID, COLORS[i]));
    //  balls.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 9, STRIPE, COLORS[i]));
    //}

    cueBall = new Ball(table.topLeftPos.x + 0.25 * table.w, table.topLeftPos.y + 0.5 * table.h, 16, CUE, WHITE);
    // add cueBall
    balls.add(cueBall);

    PVector apexPos = new PVector (table.topLeftPos.x + 0.75 * table.w, table.topLeftPos.y + 0.5 * table.h);
    // col one
    balls.add(new Ball(apexPos.x, apexPos.y, 1, SOLID, YELLOW));
    
    // col two
    float dx = sqrt(pow(Ball.trueDiameter, 2) - pow(Ball.trueRadius, 2));
    float xOffset = dx;
    float yOffset = Ball.trueRadius;
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y + yOffset, 2, SOLID, BLUE));
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y - yOffset, 3, SOLID, RED));

    // col three
    xOffset = dx * 2;
    yOffset = Ball.trueDiameter;
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y, 8, SOLID, BLACK));
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y + yOffset, 4, SOLID, PURPLE));
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y - yOffset, 5, SOLID, ORANGE));

    // col four
    xOffset = dx * 3;
    yOffset = Ball.trueRadius;
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y + yOffset, 6, SOLID, GREEN)); 
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y - yOffset, 10, STRIPE, BLUE));
    yOffset = Ball.trueRadius + Ball.trueDiameter;
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y - yOffset, 11, STRIPE, RED)); 
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y + yOffset, 9, STRIPE, YELLOW));

    // col five
    xOffset = dx * 4;
    yOffset = Ball.trueDiameter;
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y, 12, STRIPE, PURPLE)); 
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y + yOffset, 14, STRIPE, GREEN)); 
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y - yOffset, 13, STRIPE, ORANGE)); 
    yOffset = Ball.trueDiameter * 2;
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y + yOffset, 15, STRIPE, MAROON)); 
    balls.add(new Ball(apexPos.x + xOffset, apexPos.y - yOffset, 7, SOLID, MAROON)); 
  
    generatePairs();
  }

  // we have to check each pair of balls for collisions with each other
  void generatePairs() {
    for (int i = 0; i < balls.size(); i++) {
      for (int k = i+1; k < balls.size(); k++) {
        Ball[] pair = {balls.get(i), balls.get(k)};
        ballPairs.add(pair);
      }
    }
  }

  // check pairs for collisions
  void checkPairCollision() {
    for (Ball[] pair : ballPairs) {
      pair[0].checkBallCollision(pair[1]);
    }
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

    // ball collision
    checkPairCollision();

    // only if the cue ball isn't moving
    if ( (cueBall.velocity.x == 0) && (cueBall.velocity.y == 0) ) {
      cue.display();

      for (Ball ball : balls) {
        if (cue.lineIntersects(ball)) {
          break;
        }
      }
    }

    cueBall.updateVectors();
    cueBall.display();
  }

  void handleClick() {
    // only if the cue ball isn't moving
    if ( (cueBall.velocity.x == 0) && (cueBall.velocity.y == 0) ) {
      cueBall.strike();
    }
  }
}
