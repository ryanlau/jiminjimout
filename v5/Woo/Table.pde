public class Table {
  final float w = 224 * CM;
  final float h = 112 * CM;
  final float borderW = 262 * CM;
  final float borderH = 150 * CM;
  PVector topLeftPos; 

  ArrayList<Pocket> pockets;

  Table() {
    pockets = new ArrayList<>();

    topLeftPos = new PVector(width/2 - w/2, height/2 - h/2);

    pockets.add(new Pocket(topLeftPos.x, topLeftPos.y, _CORNER));
    pockets.add(new Pocket(topLeftPos.x + w/2, topLeftPos.y, _CENTER));
    pockets.add(new Pocket(topLeftPos.x + w, topLeftPos.y, _CORNER));
    pockets.add(new Pocket(topLeftPos.x + w, topLeftPos.y + h, _CORNER));
    pockets.add(new Pocket(topLeftPos.x + w/2, topLeftPos.y + h, _CENTER));
    pockets.add(new Pocket(topLeftPos.x, topLeftPos.y + h, _CORNER));
  }

  void display() {
    rectMode(CENTER);

    // BORDER
    fill(128, 64, 0);
    rect(width/2, height/2, borderW, borderH, 20 * CM);

    // ACTUAL TABLE
    fill(24, 58, 59);
    rect(width/2, height/2, w, h);
  
    for (Pocket pocket : pockets) {
      pocket.display();
    }
    stroke(WHITE);
    line(topLeftPos.x + w/4, topLeftPos.y, topLeftPos.x + w/4, topLeftPos.y + h);
  }



}
