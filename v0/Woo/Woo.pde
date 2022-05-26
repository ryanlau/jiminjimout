// ENUMERATED PROGRAM STATES
final static int MENU = 0;
final static int GAME = 1;

// PROGRAM VARIABLES
Menu menu;
Game game;
static int state;

void setup() {
  menu = new Menu();
  game = new Game();
  state = 0;
  size(500, 300);
}


void draw() {
  if (state == MENU) {
    menu.show();
  } else if (state == GAME) {
    game.show();
  }
}

void mouseClicked() {
  if (state == MENU) {
    game.show();
  } else if (state == GAME) {
    return;
  }
}
