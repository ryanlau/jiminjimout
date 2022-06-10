// jimin: Ryan Lau, Melody Lew, Paul Serbanescu
// apcs pd6
// fp -- 8 ballin'
// 2022-06-10
// time spent: 50 hours

public class PlayButton extends Button {
  PlayButton(float x, float y, float w, float h, color c, String s) {
    super(x, y, w, h, c, s);
  }

  PlayButton(float x, float y, float w, float h, float r, color c, String s) {
    super(x, y, w, h, c, s);
    super.r = r;
  }

  void handleClick() {

  }

  void handleClick(String player1Name, String player2Name) {
    // save player names
    player1.name = player1Name;
    player2.name = player2Name;

    state = GAME;
  }
}
