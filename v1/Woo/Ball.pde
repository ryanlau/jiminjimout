public class Ball {
  // static b/c all balls have equal mass and radius
  final static float mass = 170;
  final static float diameter = 30;

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
    if (type == STRIPE) {
      fill(WHITE);
      circle(position.x, position.y, diameter);
      imageMode(CENTER);
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
    textFont(BALL_FONT, diameter * .35);
    textAlign(CENTER, CENTER);
    text(nf(number), position.x, position.y);
  }
}
