final static int TOPLEFT = 0;
final static int TOPRIGHT = 1;
final static int BOTLEFT = 2;
final static int BOTRIGHT = 3;

public class Cushion {
  PShape s;
  int type;
  PVector pos;
  
  void display() {
    shape(s);
  }


  Cushion(float x, float y, int type, float midX, float midY) {
    pos = new PVector(x, y);
    s = createShape();
    s.beginShape();
    s.fill(GREEN);
    s.stroke(GREEN);
    //s.strokeWeight(2);


    if (type == TOPLEFT) {
      s.vertex(x, y);
      s.vertex(x + Table.w/2 - 12.2 * CM, y);
      s.vertex(x + Table.w/2 - 12.6 * CM, y+3 * CM);
      s.vertex(x+3*CM, y+3*CM);
    } else if (type == TOPRIGHT) {
      // s.vertex(mid - x + mid);
      s.vertex((2*midX - x), y);
      s.vertex(2*midX - (x + Table.w/2 - 12.2 * CM), y);
      s.vertex(2*midX - (x + Table.w/2 - 12.6 * CM), y+3 * CM);
      s.vertex(2*midX - (x+3*CM), y+3*CM);
    } else if (type == BOTLEFT) {
      s.vertex(x, (2 * midY) - y);
      s.vertex(x + Table.w/2 - 12.2 * CM, (2 * midY) - y);
      s.vertex(x + Table.w/2 - 12.6 * CM, (2 * midY) - (y+3 * CM));
      s.vertex(x+3*CM, (2 * midY)-(y+3*CM));
    } else if (type == BOTRIGHT) {
      s.vertex((2*midX - x), (2 * midY) - y);
      s.vertex(2*midX - (x + Table.w/2 - 12.2 * CM),(2 * midY) - y);
      s.vertex(2*midX - (x + Table.w/2 - 12.6 * CM), (2 * midY) - (y+3 * CM));
      s.vertex(2*midX - (x+3*CM), (2 * midY)-(y+3*CM));
    }
    s.endShape();
  }
}
