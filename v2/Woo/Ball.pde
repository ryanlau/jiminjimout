public class Ball {
  final float mass = 170;
  final float diameter = 24;

  int type;
  color c;
  int number;

  PVector position;
  PVector velocity;
  PVector acceleration;

  Ball(float x, float y, int number, int type, color c) {
    this.type = type;
    this.c = c;
    this.number = number;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void updateVectors() {
  }

  void display() {
    strokeWeight(1);

    if (type == STRIPE) {
      fill(WHITE);
      circle(position.x, position.y, diameter);
      clip(position.x, position.y, diameter, diameter * .7);
    }

    fill(c);
    circle(position.x, position.y, diameter);
    noClip();

    if (type == CUE) {
      return;
    }

    fill(WHITE);
    circle(position.x, position.y, diameter/2);

    fill(BLACK);
    textFont(BALL_FONT, (int) (diameter * .35));
    textAlign(CENTER, CENTER);
    text(nf(number), position.x, position.y - (int) (diameter * 0.05));
  }
}
