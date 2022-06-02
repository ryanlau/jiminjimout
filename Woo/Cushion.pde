public class Cushion {
    PShape s;

    void display() {
        shape(s);
    }
  
  
    Cushion(float x, float y) {
        s = createShape();
        s.beginShape();
        s.fill(WHITE);
        s.stroke(255);
        s.strokeWeight(2);

        s.vertex(x, y);
        s.vertex(x + Table.w/2 - 12.7 * CM, y);
        s.vertex(x + Table.w/2 - 12.7 * CM, y+3 * CM);
        s.vertex(x+3*CM, y+3*CM);
        s.endShape();
    }
}  
