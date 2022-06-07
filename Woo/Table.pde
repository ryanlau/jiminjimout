public class Table {
  static final float w = 224 * CM;
  static final float h = 112 * CM;
  static final float borderW = 250 * CM;
  static final float borderH = 138 * CM;
  PVector topLeftPos; 

  ArrayList<Pocket> pockets;
  ArrayList<Diamond> diamonds;
  ArrayList<Cushion> cushions;

  Table() {
    pockets = new ArrayList<>();
    diamonds = new ArrayList<>();
    cushions = new ArrayList<>();

    topLeftPos = new PVector(width/2 - w/2, height/2 - h/2);

    pockets.add(new Pocket(topLeftPos.x, topLeftPos.y, _CORNER));
    pockets.add(new Pocket(topLeftPos.x + w/2, topLeftPos.y - 3 *CM, _CENTER));
    pockets.add(new Pocket(topLeftPos.x + w, topLeftPos.y, _CORNER));
    pockets.add(new Pocket(topLeftPos.x + w, topLeftPos.y + h, _CORNER));
    pockets.add(new Pocket(topLeftPos.x + w/2, topLeftPos.y + h + 3 * CM, _CENTER));
    pockets.add(new Pocket(topLeftPos.x, topLeftPos.y + h, _CORNER));


    float offset = (borderH / 2 - h / 2) / 2;
    for (int i = 1; i < 8; i++) {
      // no diamond at half mark
      if (i != 4) {
        diamonds.add(new VDiamond(topLeftPos.x + i * w / 8, topLeftPos.y - offset));
        diamonds.add(new VDiamond(topLeftPos.x + i * w / 8, topLeftPos.y + offset + h));
      }
    }

    for (int i = 1; i < 4; i++) {
      diamonds.add(new HDiamond(topLeftPos.x - offset, topLeftPos.y + i * h / 4));
      diamonds.add(new HDiamond(topLeftPos.x + offset + w, topLeftPos.y + i * h / 4));
    }
    
    float midX = topLeftPos.x + w/2; 
    float midY = topLeftPos.y + h/2;
    
    cushions.add(new Cushion(topLeftPos.x+(6)*CM, topLeftPos.y, TOPLEFT, midX, midY));
    cushions.add(new Cushion(topLeftPos.x+(6)*CM, topLeftPos.y, TOPRIGHT, midX, midY));
    cushions.add(new Cushion(topLeftPos.x+(6)*CM, topLeftPos.y, BOTLEFT, midX, midY));
    cushions.add(new Cushion(topLeftPos.x+(6)*CM, topLeftPos.y, BOTRIGHT, midX, midY));
    cushions.add(new Cushion(topLeftPos.x, topLeftPos.y + 6 * CM, _LEFT, midX, midY));
    cushions.add(new Cushion(topLeftPos.x, topLeftPos.y + 6 * CM, _RIGHT, midX, midY));
    
  }

  void display() {
    rectMode(CENTER);

    // BORDER
    fill(128, 64, 0);
    rect(width/2, height/2, borderW, borderH, 10 * CM);

    // ACTUAL TABLE
    fill(24, 58, 59);
    rect(width/2, height/2, w, h);
  
    for (Pocket pocket : pockets) {
      pocket.display();
    }
    stroke(WHITE);
    line(topLeftPos.x + w/4, topLeftPos.y, topLeftPos.x + w/4, topLeftPos.y + h);

    for (Diamond diamond : diamonds) {
      diamond.display();
    }
    
    for (Cushion cushion : cushions) {
      cushion.display();
    }
  }



}
