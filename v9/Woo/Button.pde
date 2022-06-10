// jimin: Ryan Lau, Melody Lew, Paul Serbanescu
// apcs pd6
// fp -- 8 ballin'
// 2022-06-10
// time spent: 50 hours

public abstract class Button {
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
    // DRAW RECTANGLE
    fill(c);
    rectMode(CENTER);
    rect(position.x, position.y, w, h, r);
    
    // DRAW TEXT
    fill(GREEN);
    textFont(poppins);
    textAlign(CENTER);
    textSize(h * .9);
    text(s, position.x, position.y + .5 * textAscent() - 3);
  }
  
  boolean mouseOver() {
    return (position.x - w/2 < mouseX && mouseX < position.x + w/2) && (position.y - h/2 < mouseY && mouseY < position.y + h/2);
  }
  
  abstract void handleClick();
}
