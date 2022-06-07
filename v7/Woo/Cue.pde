public class Cue {
  int len;
  int startOffset;

  int guideLineColor = WHITE;

  color bgColor = color(24, 58, 59);

  float guideLineEndPointX = mouseX;
  float guideLineEndPointY = mouseY;
  
  Cue() {
    startOffset = 24;
    len = startOffset + 300;
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
    line(guideLineEndPointX, guideLineEndPointY, ballX, ballY);
    
    guideLineEndPointX = mouseX;
    guideLineEndPointY = mouseY;

    // stroke(WHITE);
    // strokeWeight(2);
    // line(mouseX, mouseY, ballX, ballY);
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

    float projEndX = lineMag * sin(theta);
    float projEndY = lineMag * cos(theta);

    // println(theta * 180 / Math.PI);

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

    // quadrant 3 and 4
    if (((ball.position.x < ballX) && (ball.position.y > ballY)) || (((ball.position.x > ballX) && (ball.position.y > ballY)))) {
      float dist = PVector.dist(bluePoint, circleCenter);

      if (dist <= ball.diameter / 2) {
        float diameter = ball.diameter;

        float intersectMag = (ball.diameter / 2) - (float) Math.sqrt(dist) + diameter/2;

        float dxi = ballX - mouseX;
        float dyi = ballY - mouseY;
        float thetai = atan(dxi / dyi);

        float projEndXi = intersectMag * sin(thetai);
        float projEndYi = intersectMag * cos(thetai);
        stroke(WHITE);
        strokeWeight(1);

        fill(bgColor);
        circle(bluePoint.x - projEndXi, bluePoint.y - projEndYi, diameter);

        guideLineEndPointX = bluePoint.x - projEndXi;
        guideLineEndPointY = bluePoint.y - projEndYi;

        // println("BLUE INTERSECT");
        return true;
      } else {
        guideLineColor = WHITE;

        guideLineEndPointX = mouseX;
        guideLineEndPointY = mouseY;
        return false;
      }
    }
    // quadrant 1 and 2
    if (((ball.position.x > ballX) && (ball.position.y < ballY)) || (((ball.position.x < ballX) && (ball.position.y < ballY)))) {
      float dist = PVector.dist(redPoint, circleCenter);

      if (dist <= ball.diameter / 2) {
        float diameter = ball.diameter;

        float intersectMag = (ball.diameter / 2) - (float) Math.sqrt(dist) + diameter/2;

        float dxi = ballX - mouseX;
        float dyi = ballY - mouseY;
        float thetai = atan(dxi / dyi);

        float projEndXi = intersectMag * sin(thetai);
        float projEndYi = intersectMag * cos(thetai);
        stroke(WHITE);
        strokeWeight(1);

        fill(bgColor);
        circle(redPoint.x + projEndXi, redPoint.y + projEndYi, diameter);

        guideLineEndPointX = redPoint.x + projEndXi;
        guideLineEndPointY = redPoint.y + projEndYi;

        // println("RED INTERSECT");
        return true;
      } else {
        guideLineColor = WHITE;

        guideLineEndPointX = mouseX;
        guideLineEndPointY = mouseY;
        return false;
      }
    }

    return false;
  }
}
