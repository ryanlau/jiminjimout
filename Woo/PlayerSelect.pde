// jimin: Ryan Lau, Melody Lew, Paul Serbanescu
// apcs pd6
// fp -- 8 ballin'
// 2022-06-10
// time spent: 50 hours

public class PlayerSelect {
   ArrayList<PlayButton> buttons;
   ArrayList<TextBox> textBoxes;
   
   PlayerSelect() {
       buttons = new ArrayList<>();
       buttons.add(new PlayButton(width/2, 430, 200, 35, 20, WHITE, "play!"));

       textBoxes = new ArrayList<>();
       textBoxes.add(new TextBox(width/2 - 200, height/2, 300, 35, "player 1:"));
       textBoxes.add(new TextBox(width/2 + 200, height/2, 300, 35, "player 2:"));
   }

    void display() {
        state = PLAYER_SELECT;

        stroke(BLACK);

    if (frameCount % 20 == 0) {
        background(44,40,40); 
        for (int i = 0; i < 10; i++) {
            image(jimin, random(width), random(height), 216, 184.8);
        }
    }

        int cursor = ARROW;
        for (Button button : buttons) {
            button.display();
            if (button.mouseOver()) {
                cursor = HAND;
            }
        }

        for (TextBox textBox : textBoxes) {
            textBox.display();
            if (textBox.mouseOver()) {
                cursor = TEXT;
            }
        }

        cursor(cursor);
    }

    void handleClick() {
        for (PlayButton button : buttons) {
            if (button.mouseOver()) {
                button.handleClick(textBoxes.get(0).s, textBoxes.get(1).s);
            }
        }

        for (TextBox textBox : textBoxes) {
            print(textBox.state);
            if (textBox.mouseOver()) {
                textBox.handleClick();
            } else {
                textBox.state = textBox.WAITING;
            }
        }
    }
}