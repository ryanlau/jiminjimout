public class Cue {
  int len;
  int startOffset;
  int guideLineColor;
  
  Cue() {
    startOffset = 24;
    len = startOffset + 300;
    guideLineColor = WHITE;
  }
  
  void display() {
    noCursor();
    float ballX = game.cueBall.position.x;
    float ballY = game.cueBall.position.y;

    // CUE
    stroke(BLACK);
    strokeWeight(4);
    float dx = ballX - mouseX;
    float dy = ballY - mouseY;
    float theta = atan(dx / dy);
    
    float startOffsetX = startOffset * sin(theta);
    float startOffsetY = startOffset * cos(theta);
    float endOffsetX = len * sin(theta);
    float endOffsetY = len * cos(theta);
    
    if (mouseY > game.cueBall.position.y) {
      line(ballX - startOffsetX, ballY - startOffsetY, ballX - endOffsetX, ballY - endOffsetY);
    } else {
      line(ballX + startOffsetX, ballY + startOffsetY, ballX + endOffsetX, ballY + endOffsetY);
    }

    // GUIDE LINE
    stroke(guideLineColor);
    strokeWeight(2);
    // TODO: GUIDE LINE SHOULD EXTEND UNTIL IT HITS BALL OR WALL
    line(mouseX, mouseY, ballX, ballY);
  }


   boolean lineIntersects(Ball ball) {
    // we need the guideline vector
    float ballX = game.cueBall.position.x;
    float ballY = game.cueBall.position.y;

    PVector lineStart = new PVector(ballX, ballY);
    PVector lineEnd = new PVector(mouseX, mouseY);

    // need vector for center of circle
    PVector circleCenter = ball.position;
    float circleToEndMag = PVector.dist(lineEnd, circleCenter);

    float lineMag = PVector.dist(lineStart, lineEnd) - circleToEndMag;

    float dx = ballX - mouseX;
    float dy = ballY - mouseY;
    float theta = atan(dx / dy);
    float abstheta = abs(theta);

    float projEndX = lineMag * sin(theta);
    float projEndY = lineMag * cos(theta);

    println(theta * 180 / Math.PI);

    // TESTING //
    // stroke(RED);
    // strokeWeight(2);
    // line(ballX, ballY, ballX - projEndX, ballY - projEndY);

    // stroke(BLUE);
    // strokeWeight(2);
    // line(ballX, ballY, ballX + projEndX, ballY + projEndY);
    // TESTING //

    PVector redPoint = new PVector(ballX - projEndX, ballY - projEndY);
    PVector bluePoint = new PVector(ballX + projEndX, ballY + projEndY);

    // 4 quadrants

    // quadrant 3
    if ((ball.position.x < ballX) && (ball.position.y > ballY)) {
      float dist = PVector.dist(bluePoint, circleCenter);

      if (dist <= ball.diameter / 2) {
        guideLineColor = GREEN;
        println("BLUE INTERSECT");
        return true;
      } else {
        guideLineColor = WHITE;
        return false;
      }
    }

    // quadrant 4
    if ((ball.position.x > ballX) && (ball.position.y > ballY)) {
      float dist = PVector.dist(bluePoint, circleCenter);

      if (dist <= ball.diameter / 2) {
        guideLineColor = GREEN;
        println("BLUE INTERSECT");
        return true;
      } else {
        guideLineColor = WHITE;
        return false;
      }
    }

    // quadrant 1
    if ((ball.position.x > ballX) && (ball.position.y < ballY)) {
      float dist = PVector.dist(redPoint, circleCenter);

      if (dist <= ball.diameter / 2) {
        guideLineColor = GREEN;
        println("RED INTERSECT");
        return true;
      } else {
        guideLineColor = WHITE;
        return false;
      }
    }

    // quadrant 2
    if ((ball.position.x < ballX) && (ball.position.y < ballY)) {
      float dist = PVector.dist(redPoint, circleCenter);

      if (dist <= ball.diameter / 2) {
        guideLineColor = GREEN;
        println("RED INTERSECT");
        return true;
      } else {
        guideLineColor = WHITE;
        return false;
      }
    }

    return false;
  }

  PVector project(PVector a, PVector b) {
    float dotProduct = a.dot(b) / b.dot(b);
    return new PVector(dotProduct * b.x, dotProduct * b.y);
  }


}
