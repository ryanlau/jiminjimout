public class PlayerSelect {
   ArrayList<PlayButton> buttons;
   ArrayList<TextBox> textBoxes;
   
   PlayerSelect() {
       buttons = new ArrayList<>();
       buttons.add(new PlayButton(width/2, 250, 100, 35, 20, WHITE, "Play"));

       textBoxes = new ArrayList<>();
       textBoxes.add(new TextBox(width/2 - 250, height/2, 300, 35, "Player 1:"));
       textBoxes.add(new TextBox(width/2 + 250, height/2, 300, 35, "Player 2:"));
   }

    void display() {
        stroke(BLACK);
        state = PLAYER_SELECT;
        background(44,40,40); 

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