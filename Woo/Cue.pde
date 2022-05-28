public class Cue {
  // TODO: CUE SHOULD BE ON THE OPPOSITE SIDE OF MOUSE
  void display() {
    noCursor();
    fill(255,255,255);
    strokeWeight(4);
    line(mouseX, mouseY, game.cueBall.position.x, game.cueBall.position.y);
  }
}
