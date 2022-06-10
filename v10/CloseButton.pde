// jimin: Ryan Lau, Melody Lew, Paul Serbanescu
// apcs pd6
// fp -- 8 ballin'
// 2022-06-10
// time spent: 50 hours

public class CloseButton extends Button {
  CloseButton(float x, float y, float w, float h, color c, String s) {
    super(x, y, w, h, c, s);
  }

  CloseButton(float x, float y, float w, float h, float r, color c, String s) {
    super(x, y, w, h, c, s);
    super.r = r;
  }

  void handleClick() {
    exit();
  }
}
