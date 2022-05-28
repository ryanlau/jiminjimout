public class Cue {
  
  void display() {
    noCursor();
    fill(255,255,255);
    strokeWeight(4);
    line(mouseX, mouseY, cueBall.position.x, cueBall.position.y);
  }
}
