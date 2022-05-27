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


  Ball(float x, float y, color c, int number, int type) {
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
    fill(c);
    circle(position.x, position.y, diameter);


    fill(WHITE);
    circle(position.x, position.y, diameter/2);

    fill(BLACK);
    textFont(BALL_FONT, diameter * .35);
    textAlign(CENTER, CENTER);
    text(nf(number), position.x, position.y);
  }
}
