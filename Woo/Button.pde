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
    rect(position.x, position.y, w, h, r);
    
    // DRAW TEXT
    fill(BLACK);
    textFont(poppins);
    textAlign(LEFT, TOP);
    textSize(h * .9);
    text(s, (w - textWidth(s)) / 2 + position.x, position.y);
  }
  
  boolean mouseOver() {
    return (position.x < mouseX && mouseX < position.x + w) && (position.y < mouseY && mouseY < position.y + h);
  }
  
  abstract void handleClick();
}
