final static int TOPLEFT = 0;
final static int TOPRIGHT = 1;
final static int BOTLEFT = 2;
final static int BOTRIGHT = 3;
final static int _LEFT = 4;
final static int _RIGHT = 5;


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
    s.fill(30, 51, 52);
    s.fill(WHITE);
    s.stroke(30, 51, 52);
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
    } else if (type == _LEFT) {
      s.vertex(x,y);
      s.vertex(x+3*CM, y+3*CM);
      s.vertex(x+3*CM, y + Table.h - 15.6 * CM);
      s.vertex(x, y + Table.h - 12.6 * CM);
    } else if (type == _RIGHT) {
       s.vertex(2 * midX - x,y);
      s.vertex(2 * midX - (x+3*CM), y+3*CM);
      s.vertex(2 * midX - (x+3*CM), y + Table.h - 15.6 * CM);
      s.vertex(2 * midX - x, y + Table.h - 12.6 * CM);
    }
    s.endShape();
  }
}
