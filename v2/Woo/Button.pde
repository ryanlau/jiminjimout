public class Button {
  PVector position;
  float w, h, r;

  String s;
  color c;

  Button(float x, float y, float w, float h, color c, String s) {
    position = new PVector(x, y);
    this.w = w;
    this.h = h;
    this.c = c;
    this.s = s;
    this.r = 0;
  }

  Button(float x, float y, float w, float h, float r, color c, String s) {
    this(x, y, w, h, c, s);
    this.r = r;
  }

  void display() {
    fill(c);
    rect(position.x, position.y, w, h, r);
    fill(BLACK);
    textFont(BALL_FONT);
    //clip();
    textAlign(CENTER, CENTER);
    //text(nf(number), position.x, position.y - (int) (diameter * 0.05));
  }
  
  void click() {
    return;
  }
}
