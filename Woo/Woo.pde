import processing.sound.*;
SoundFile ballHit;
SoundFile cueHit;
SoundFile railHit;

/* ==== ENUM PROGRAM STATES ==== */
final int MENU = 0;
final int PLAYER_SELECT = 1;
final int GAME = 2;
/* ==== ENUM PROGRAM STATES ==== */

/* ==== PROGRAM STATE ==== */
Menu menu;
Game game;
PlayerSelect playerSelect;
int state;
/* ==== PROGRAM STATE ==== */

/* === PLAYER NAMES === */
Player player1;
Player player2;
/* === PLAYER NAMES === */

/* ==== MISC ==== */
PImage jimin;
PFont poppins;
int fps;
/* ==== MISC ==== */

/* === UNITS ==== */
final static int CM = 4;
/* === UNITS ==== */

void setup() {
  jimin = loadImage("jimin.png");
  surface.setTitle("8 Ball");
  surface.setIcon(jimin);
  poppins = createFont("poppins.ttf", 144);
  frameRate(120);
  fps = (int) frameRate;

  imageMode(CENTER);

  menu = new Menu();
  playerSelect = new PlayerSelect();
  game = new Game();
  state = MENU;

  player1 = new Player("");
  player1.turn = true;
  player2 = new Player("");

  size(1200, 700);
  
  pixelDensity(displayDensity());

  ballHit = new SoundFile(this, "ball-hit.mp3"); 
  cueHit = new SoundFile(this, "cue-hit.mp3");
  railHit = new SoundFile(this, "rail-hit.mp3");
}

void draw() {
  if (state == MENU) {
    menu.display();
  } else if (state == PLAYER_SELECT) {
    playerSelect.display();
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
  // file.play();
  if (state == MENU) {
    menu.handleClick();
  } else if (state == PLAYER_SELECT) {
    playerSelect.handleClick();
  } else if (state == GAME) {
    game.handleMousePress();
  }
}

void mouseDragged() {
  if (state == GAME) {
    game.handleMouseDrag();
  }
}

void mouseReleased() {
  if (state == GAME) {
    game.handleMouseRelease();
  }
}

void keyReleased() {
  for (TextBox textBox : playerSelect.textBoxes) {
    if (textBox.state == textBox.LISTENING) {
      if (keyCode == BACKSPACE) {
        textBox.delete();
      } else if (key != CODED) {
        textBox.s += key;
      }
    }
  }  
}