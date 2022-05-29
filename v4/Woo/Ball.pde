/* COLORS */
final color YELLOW = color(249, 217, 73);
final color BLUE   = color(0, 0, 245);
final color RED    = color(234, 51, 35);
final color PURPLE = color(117, 20, 124);
final color ORANGE = color(235, 85, 40);
final color GREEN  = color(69, 137, 52);
final color MAROON = color(117, 20, 12);
final color BLACK  = color(0, 0, 0);
final color WHITE  = color(255, 255, 255);
final color[] COLORS = {YELLOW, BLUE, RED, PURPLE, ORANGE, GREEN, MAROON};

/* TYPES */
final int STRIPE = 0;
final int SOLID  = 1;
final int CUE    = 2;
final int EIGHT  = 3;

public class Ball {
  final float mass = 170;
  final float diameter = 5.715 * CM;
  
  int type;
  color c;
  int number;

  PVector position;
  PVector velocity;
  PVector acceleration;

  Ball(float x, float y, int number, int type, color c) {
    println(CM);

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
    stroke(BLACK);
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
    textFont(poppins, (int) (diameter * .35));
    textAlign(CENTER, CENTER);
    text(nf(number), position.x, position.y - (int) (diameter * 0.05));
  }
}
