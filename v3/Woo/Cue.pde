public class Cue {
  int len;
  int startOffset;
  
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
    stroke(WHITE);
    strokeWeight(2);
    // TODO: GUIDE LINE SHOULD EXTEND UNTIL IT HITS BALL
    line(mouseX, mouseY, ballX, ballY);
  }
}
