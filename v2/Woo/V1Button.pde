public class V1Button extends Button {
  V1Button(float x, float y, float w, float h, color c, String s) {
    super(x, y, w, h, c, s);
  }

  V1Button(float x, float y, float w, float h, float r, color c, String s) {
    super(x, y, w, h, c, s);
    super.r = r;
  }

  void handleClick() {
    state = GAME;
  }
}
