public class VDiamond extends Diamond {
    VDiamond(float x, float y) {
        super.s = createShape();
        super.s.beginShape();
        super.s.fill(WHITE);
        super.s.stroke(255);
        super.s.strokeWeight(2);

        super.s.vertex(x, y - 1.5 * CM);
        super.s.vertex(x + 1 * CM, y);
        super.s.vertex(x, y + 1.5 * CM);
        super.s.vertex(x - 1 * CM, y);
        super.s.endShape();
    }
}