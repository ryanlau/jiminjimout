import java.util.ArrayList;

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

static final int BREAK = 0;
static final int VARIABLE = 1;

public class Ball {
  final static float mass = 170;
  final static float diameter = (int) (5.715 * CM);
  final static float radius = diameter/2;
  final static float trueDiameter = (diameter + 3);
  final static float trueRadius = trueDiameter / 2;
  
  int type;
  color c;
  int number;

  PVector position;

  float xVel;
  float yVel;
  PVector velocity;
  float strikeForce; //in mph

  // physics constants
  final float FRICTION           = 0.99;
  final float RAIL_FRICTION      = 0.9;
  final float MASS               = 6; //oz
  final float VELOCITY_TOLERANCE = 0.1;



  Ball(float x, float y, int number, int type, color c) {
    this.type = type;
    this.c = c;
    this.number = number;
    position = new PVector(x, y);

    xVel = 0;
    yVel = 0;
    velocity = new PVector(xVel, yVel);
    // constant now, variable later
    /* shot speeds are as follows:
    slow = 1-2 mph
    medium = 2-4 mph
    fast = 4-7 mph
    power shot = 7-10 mph
    powerful break = 25-30 mph
    */
    strikeForce = 30;

    // acceleration = new PVector(0, 0);
  }

  void updateVectors() {
    position.add(velocity);
    velocity.mult(FRICTION);

    // if ball is slow enough, just stop it
    if ( (abs(velocity.x) < VELOCITY_TOLERANCE) && (abs(velocity.y) < VELOCITY_TOLERANCE) ) {
      velocity.x = 0;
      velocity.y = 0;
    }

    // wall collisions
    checkCushionCollision();
  }

  // https://www.jeffreythompson.org/collision-detection/poly-circle.php
  void checkCushionCollision() {
    for (Cushion cushion : Woo.game.table.cushions) {
      PVector[] vertices = cushion.getVertices();

      // check all the edges

      for (int i = 0; i < vertices.length; i++) {
        int next = (i == 3) ? 0 : i + 1;

        PVector v1 = vertices[i];
        PVector v2 = vertices[next];
      
        if (Collision.lineCircle(v1.x, v1.y, v2.x, v2.y, position.x, position.y, radius)) {
          velocity.x = 0;
          velocity.y = 0;
        }
      }

    }
  }

  // ball collision given another ball
  void checkBallCollision(Ball other) {
      // Get distances between the balls components
    PVector distanceVect = PVector.sub(other.position, position);

    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = radius + other.radius;

    if (distanceVectMag < minDistance) {
      float distanceCorrection = (minDistance-distanceVectMag)/2.0;
      PVector d = distanceVect.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      other.position.add(correctionVector);
      position.sub(correctionVector);

      // get angle of distanceVect
      float theta  = distanceVect.heading();
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);

      /* bTemp will hold rotated ball positions. You 
       just need to worry about bTemp[1] position*/
      PVector[] bTemp = {
        new PVector(), new PVector()
      };

      /* this ball's position is relative to the other
       so you can use the vector between them (bVect) as the 
       reference point in the rotation expressions.
       bTemp[0].position.x and bTemp[0].position.y will initialize
       automatically to 0.0, which is what you want
       since b[1] will rotate around b[0] */
      bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
      bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

      // rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
      };

      vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * other.velocity.x + sine * other.velocity.y;
      vTemp[1].y  = cosine * other.velocity.y - sine * other.velocity.x;

      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final velocity along the x-axis. */
      PVector[] vFinal = {  
        new PVector(), new PVector()
      };

      // final rotated velocity for b[0]
      vFinal[0].x = ((MASS - other.MASS) * vTemp[0].x + 2 * other.MASS * vTemp[1].x) / (MASS + other.MASS);
      vFinal[0].y = vTemp[0].y;

      // final rotated velocity for b[0]
      vFinal[1].x = ((other.MASS - MASS) * vTemp[1].x + 2 * MASS * vTemp[0].x) / (MASS + other.MASS);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      /* Rotate ball positions and velocities back
       Reverse signs in trig expressions to rotate 
       in the opposite direction */
      // rotate balls
      PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update balls to screen position
      // other.position.x = position.x + bFinal[1].x;
      // other.position.y = position.y + bFinal[1].y;

      // position.add(bFinal[0]);

      // update velocities
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;

      PVector sound = velocity.copy();
      sound.normalize();
      ballHit.amp(0.3);
      ballHit.play();
    }
  }

  // cue strikes cue ball
  void strike(Cue cue, float xPos, float yPos, float power) {
    cueHit.play();
    
    PVector newVel = new PVector(xPos - position.x, yPos - position.y).setMag(power);
    velocity.x = newVel.x;
    velocity.y = newVel.y;

    cue.powerState = VARIABLE;
  }

  boolean isPocketed() {
    for (Pocket pocket : Woo.game.table.pockets) {
      float distance = sqrt(pow(position.x - pocket.position.x, 2) + pow(position.y - pocket.position.y, 2));
      if (distance <= (pocket.diameter) / 2) {
        return true;
      }
    }
    return false;
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
