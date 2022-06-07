public class Player {
  String name;
  Boolean turn;

  Player(String name) {
    this.name = name;
    this.turn = false;
  }

  void cycleTurn() {
    if (turn) {
      this.turn = false;
    } else {
      this.turn = true;
    }
  }
}
