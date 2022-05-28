public class CloseButton extends Button {
  CloseButton(float x, float y, float w, float h, color c, String s) {
    super(x, y, w, h, c, s);
  }

  CloseButton(float x, float y, float w, float h, float r, color c, String s) {
    super(x, y, w, h, c, s);
    super.r = r;
  }

  void click() {
    exit();
  }
}
