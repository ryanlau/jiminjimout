public class Player {
  // == Target ball == //
` static final int SOLID   = 0;
` static final int STRIPES = 1;
  int targetBall;
  // == Target ball == //

  String name;
  Boolean turn;
  int ballsSunk;

  Player(String name) {
    this.name = name;
    this.turn = false;
    ballsSunk = 0;
  }

  void sinkBall(Ball ball) {
    ballsSunk += 1;
  }

  void cycleTurn() {
    if (turn) {
      this.turn = false;
    } else {
      this.turn = true;
    }
  }

}
