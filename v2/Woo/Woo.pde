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

ArrayList<Ball> stripes;
ArrayList<Ball> solids;
Ball eightBall;
Ball cueBall;
/* ==== BALL ==== */


/* ==== ENUM PROGRAM STATES ==== */
final int MENU = 0;
final int GAME = 1;
/* ==== ENUM PROGRAM STATES ==== */


/* ==== PROGRAM VARIABLES ==== */
Menu menu;
Game game;
Cue cue;

int state;
/* ==== PROGRAM VARIABLES ==== */


void setup() {
  imageMode(CENTER);

  menu = new Menu();
  game = new Game();
  state = MENU;
  state = GAME;

  size(1000, 600);

  BALL_FONT = createFont("poppins.ttf", 144);

  stripes = new ArrayList<>();
  solids = new ArrayList<>();

  for (int i = 0; i < COLORS.length; i++) {
    solids.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 1, SOLID, COLORS[i]));
    stripes.add(new Ball(random(width - 60) + 30, random(height - 60) + 30, i + 9, STRIPE, COLORS[i]));
  }

  eightBall = new Ball(random(width - 60) + 30, random(height - 60) + 30, 8, EIGHT, BLACK);
  cueBall = new Ball(random(width - 60) + 30, random(height - 60) + 30, 16, CUE, WHITE);
  
  cue = new Cue();
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

    
  
  
  } else if (state == GAME) {
    return;
  }
}
