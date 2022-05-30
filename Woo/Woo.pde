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
PFont poppins;
int fps;
/* ==== MISC ==== */

/* === UNITS ==== */
final int CM = 4;
/* === UNITS ==== */

void setup() {
  jimin = loadImage("jimin.png");
  surface.setTitle("8 Ball");
  surface.setIcon(jimin);
  poppins = createFont("poppins.ttf", 144);
  fps = (int) frameRate;

  imageMode(CENTER);

  menu = new Menu();
  game = new Game();
  state = MENU;
  //state = GAME;

  size(1200, 700);
  
  pixelDensity(displayDensity());
}

void draw() {
  if (state == MENU) {
    menu.display();
  } else if (state == GAME) {
    game.display();
  }

  if (frameCount % 10 == 0) {
    fps = (int) frameRate;
  }

  fill(WHITE);
  textFont(poppins, 30);
  textAlign(LEFT, TOP);
  text("FPS: " + nf(fps), 0, 0);
}

void mousePressed() {
  if (state == MENU) {
    menu.handleClick();
  } else if (state == GAME) {
    game.handleClick();
  }
}
