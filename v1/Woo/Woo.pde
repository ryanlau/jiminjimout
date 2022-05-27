// ==== BALL  ====
// COLORS
final color YELLOW = color(249, 217, 73);
final color BLUE   = color(0, 0, 245);
final color RED    = color(234, 51, 35);
final color PURPLE = color(117, 20, 124);
final color ORANGE = color(235, 85, 40);
final color GREEN  = color(69, 137, 52);
final color MAROON = color(117, 20, 12);
final color BLACK  = color(0, 0, 0);
final color WHITE  = color(255, 255, 255);
// TYPES
final int STRIPE = 0;
final int SOLID  = 1;
final int CUE    = 2;
final int EIGHT  = 3;
// FONT
PFont BALL_FONT;
// ==== BALL ====


// ==== PROGRAM STATES ====
final int MENU = 0;
final int GAME = 1;
// ==== PROGRAM STATES ====


// ==== PROGRAM VARIABLES ====
Menu menu;
Game game;
static int state; // static so state can be changed in other files
ArrayList<Ball> balls;
// ==== PROGRAM VARIABLES ====


void setup() {
  menu = new Menu();
  game = new Game();
  //state = 0;
  state = 1;
  
  size(1000, 600);
  
  BALL_FONT = createFont("poppins.ttf", 144);

  balls = new ArrayList<>();
  
  
  
  
  balls.add(new Ball(150, 100, YELLOW, 1, SOLID));
  balls.add(new Ball(100, 40, BLUE, 2, SOLID));
}


void draw() {
  if (state == MENU) {
    menu.display();
  } else if (state == GAME) {
    game.display();
  }
}

void mouseClicked() {
  if (state == MENU) {
    game.display();
  } else if (state == GAME) {
    return;
  }
}
