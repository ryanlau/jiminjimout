public class V2Button extends Button {
  V2Button(float x, float y, float w, float h, color c, String s) {
    super(x, y, w, h, c, s);
  }

  V2Button(float x, float y, float w, float h, float r, color c, String s) {
    super(x, y, w, h, c, s);
    super.r = r;
  }

  void handleClick() {
    state = GAME;
  }
}
