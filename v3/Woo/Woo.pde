/* ==== BALL ==== */
/* COLORS */
final color YELLOW = color(249, 217, 73);
final color BLUE   = color(0, 0, 245);
final color RED    = color(234, 51, 35);
final color PURPLE = color(117, 20, 124);
final color ORANGE = color(235, 85, 40);
final color GREEN  = color(69, 137, 52);
final color MAROON = color(117, 20, 12);
final color BLACK  = color(0, 0, 0);
final color WHITE  = color(255, 255, 255);
final color[] COLORS = {YELLOW, BLUE, RED, PURPLE, ORANGE, GREEN, MAROON};

/* TYPES */
final int STRIPE = 0;
final int SOLID  = 1;
final int CUE    = 2;
final int EIGHT  = 3;

/* FONT */
PFont BALL_FONT;
/* ==== BALL ==== */


/* ==== ENUM PROGRAM STATES ==== */
final int MENU = 0;
final int GAME = 1;
/* ==== ENUM PROGRAM STATES ==== */


/* ==== PROGRAM STATE ==== */
Menu menu;
Game game;
int state;
/* ==== PROGRAM STATE ==== */


/* ==== MISC ==== */
PImage jimin;
/* ==== MISC ==== */


void setup() {
  jimin = loadImage("jimin.png");
  surface.setTitle("8 Ball");
  surface.setIcon(jimin);

  imageMode(CENTER);

  menu = new Menu();
  game = new Game();
  state = MENU;
  //state = GAME;

  size(1000, 600);
  pixelDensity(displayDensity());
  
  BALL_FONT = createFont("poppins.ttf", 144);
}


void draw() {
  if (state == MENU) {
    menu.display();
  } else if (state == GAME) {
    game.display();
  }
}

void mousePressed() {
  if (state == MENU) {
    menu.handleClick();
  } else if (state == GAME) {
    return;
  }
}
