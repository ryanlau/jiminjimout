/* TYPES */
final int _CORNER = 0;
final int _CENTER = 1;

import java.util.Stack;

public class Pocket {
    Stack<Ball> balls;
    float diameter;
    PVector position;

    Pocket(float x, float y, int type) {
        balls = new Stack<>();
        position = new PVector(x, y);
        diameter = (type == _CORNER) ? 11.43 * CM : 12.7 * CM;
    }

    void display() {
        fill(BLACK);
        ellipseMode(CENTER);
        circle(position.x, position.y, diameter);
    }
}