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
  final static float mass = 170;
  final static float diameter = (int) (5.715 * CM);
  final static float trueDiameter = (diameter);
  final static float trueRadius = trueDiameter / 2;
  
  int type;
  color c;
  int number;

  PVector position;

  float xVel;
  float yVel;
  PVector velocity;
  float strikeForce;

  //prob use friction not accel
  final float FRICTION = 0.99;
  final float TOLERANCE = 0.25;
  final float COLLISION_TOLERANCE = 0.2;
  PVector acceleration;

  Ball(float x, float y, int number, int type, color c) {
    this.type = type;
    this.c = c;
    this.number = number;
    position = new PVector(x, y);

    xVel = 0;
    yVel = 0;
    velocity = new PVector(xVel, yVel);
    // constant now, variable later
    strikeForce = 20;

    acceleration = new PVector(0, 0);
  }

  void updateVectors() {
    position.add(velocity);
    velocity.mult(FRICTION);

    // if ball is slow enough, just stop it
    // if ( (abs(velocity.x) < TOLERANCE) && (abs(velocity.y) < TOLERANCE) ) {
    //   velocity.x = 0;
    //   velocity.y = 0;
    // }

    // wall collisions
    checkWallCollision();
  }

  void checkWallCollision() {
    if (position.y + diameter/2 > height/2+(Table.h/2)) {
      velocity.y *= -1;
      position.y = height/2+(Table.h/2) - diameter/2;
    }
    if (position.x + diameter/2 > width/2+(Table.w/2)) {
      velocity.x *= -1;
      position.x = width/2+(Table.w/2) - diameter/2;
    }
    if (position.y - diameter/2 < height/2-(Table.h/2)) {
      velocity.y *= -1;
      position.y = height/2-(Table.h/2) + diameter/2;
    }
    if (position.x - diameter/2 < width/2-(Table.w/2)) {
      velocity.x *= -1;
      position.x = width/2-(Table.w/2) + diameter/2;
    }
  }

  // ball collision given another ball
  void checkBallCollision(Ball other) {
    float centerDist = dist(this.position.x, this.position.y, other.position.x, other.position.y);

    if (centerDist <= this.trueRadius + other.trueRadius - COLLISION_TOLERANCE) {
      this.c = color(255,255,255);
      other.c = color(255,255,255);

      float overlapAmount = (this.trueRadius + other.trueRadius) - centerDist;
      // other.position.x += overlapAmount;
      // other.position.y += overlapAmount;

      // TODO: shift over the balls so they dont clip
      other.velocity = this.velocity;
      this.velocity = new PVector(0,0);

    }
  }

  // cue strikes cue ball
  void strike() {
    PVector newVel = new PVector(mouseX - position.x, mouseY - position.y).setMag(strikeForce);
    velocity.x = newVel.x;
    velocity.y = newVel.y;
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
