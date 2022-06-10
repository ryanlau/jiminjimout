// jimin: Ryan Lau, Melody Lew, Paul Serbanescu
// apcs pd6
// fp -- 8 ballin'
// 2022-06-10
// time spent: 50 hours

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
    ballsSunk = 7;
  }

  void sinkBall(Ball ball) {
    ballsSunk -= 1;
  }
}
