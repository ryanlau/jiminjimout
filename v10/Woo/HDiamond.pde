// jimin: Ryan Lau, Melody Lew, Paul Serbanescu
// apcs pd6
// fp -- 8 ballin'
// 2022-06-10
// time spent: 50 hours

public class HDiamond extends Diamond {
    HDiamond(float x, float y) {
        super.s = createShape();
        super.s.beginShape();
        super.s.fill(WHITE);
        super.s.stroke(255);
        super.s.strokeWeight(2);

        super.s.vertex(x, y - 1 * CM);
        super.s.vertex(x + 1.5 * CM, y);
        super.s.vertex(x, y + 1 * CM);
        super.s.vertex(x - 1.5 * CM, y);
        super.s.endShape();
    }
}