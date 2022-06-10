public class TextBox {
    //states
    private int state;
    private int WAITING = 0;
    private int LISTENING = 1;

    PVector position;
    float x, y, w, h;

    String label;
    String s;

    // cursor line info
    color cC;
    float cX, cY;

    TextBox(int x, int y, int w, int h, String label) {
        position = new PVector(x, y);
        this.x = x; 
        this.y = y;
        this.w = w;
        this.h = h;
        this.label = label;

        state = WAITING;

        s = "";

        cC = color(255,0,0);
        cX = x;
        cY = y;
    }

    void display() {
        stroke(BLACK);
        fill(WHITE);
        rect(x,y,w,h);

        // DRAW LABEL ABOVE
        stroke(BLACK);
        fill(WHITE);
        textFont(poppins);
        textAlign(CENTER);
        textSize(h * .8);
        text(label, position.x, position.y + .5 * textAscent() - 3 - 50);

        // DRAW TEXT
        stroke(BLACK);
        fill(GREEN);
        textFont(poppins);
        textAlign(CENTER);
        textSize(h * .9);
        text(s, position.x, position.y + .5 * textAscent() - 3);

        // print(textWidth(s));
        if (state == LISTENING) {
            stroke(cC);
            strokeWeight(2);
            // if (frameCount % 60 == 0) {
            //     noStroke();
            // }
            // if (frameCount % 120 == 0) {
            //     stroke(cC);
            // }
            line(cX + textWidth(s)/2, cY - h/2 + 3, cX + textWidth(s)/2, cY + h/2 - 3);
        }
        stroke(BLACK);
    }

    void handleClick() {
        state = LISTENING;
    }

    void delete() {
        if ( (s != null) && (s.length() != 0) ) {
            s = s.substring(0, s.length() - 1);
        }
    }

    boolean mouseOver() {
        return (position.x - w/2 < mouseX && mouseX < position.x + w/2) && (position.y - h/2 < mouseY && mouseY < position.y + h/2);
    }
}