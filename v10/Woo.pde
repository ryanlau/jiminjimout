// jimin: Ryan Lau, Melody Lew, Paul Serbanescu
// apcs pd6
// fp -- 8 ballin'
// 2022-06-10
// time spent: 50 hours

import processing.sound.*;
SoundFile ballHit;
SoundFile cueHit;
SoundFile railHit;

import java.util.Queue;
import java.util.LinkedList;

/* ==== ENUM PROGRAM STATES ==== */
final int MENU = 0;
final int PLAYER_SELECT = 1;
final int GAME = 2;
/* ==== ENUM PROGRAM STATES ==== */

/* ==== PROGRAM STATE ==== */
static Menu menu;
static Game game;
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

// PLAYERS //
Queue<Player> players;
// PLAYERS //

void setup() {
  jimin = loadImage("jimin.png");
  surface.setTitle("8 Ball");
  surface.setIcon(jimin);
  poppins = createFont("poppins.ttf", 144);
  // frameRate(120);
  fps = (int) frameRate;

  imageMode(CENTER);

  menu = new Menu();
  playerSelect = new PlayerSelect();
  game = new Game();
  state = MENU;

  players = new LinkedList<>();

  player1 = new Player("");
  players.add(player1);

  player2 = new Player("");
  players.add(player2);

  player1.targetBall = 0;
  player2.targetBall = 0;


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
  // text("FPS: " + nf(fps), 0, 0);
}

void mousePressed() {
  // file.play();
  if (state == MENU) {
    menu.handleClick();
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

void mouseClicked() {
  if (state == PLAYER_SELECT) {
    playerSelect.handleClick();
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