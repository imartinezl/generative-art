int numChildren = 3;
int maxLevels = 4;

Branch trunk;

void setup() {
  size(750, 500);
  background(255);
  noFill();
  newTree();
}

void newTree() {
  trunk = new Branch(1,0,width/2, 50);
  trunk.drawMe();
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;

  Branch(float level_, float index_, float x_, float y_) {
    level = level_;
    index = index_;
    updateMe(x_, y_);
  }

  void updateMe(float x_, float y_) {
    x = x_;
    y = y_;
    endx = x + 150;
    endy = y + 15;
  }

  void drawMe() {
    line(x, y, endx, endy);
    ellipse(x, y, 5, 5);
  }
}
