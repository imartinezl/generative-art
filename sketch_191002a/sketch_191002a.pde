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
  trunk = new Branch(1, 0, width/2, 50);
  trunk.drawMe();
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  Branch[] children = new Branch[0];

  Branch(float level_, float index_, float x_, float y_) {
    level = level_;
    index = index_;
    updateMe(x_, y_);

    if (level < maxLevels) {
      children = new Branch[numChildren];
      for (int i=0; i<numChildren; i++) {
        children[i] = new Branch(level+1, i, endx, endy);
      }
    }
  }

  void updateMe(float x_, float y_) {
    x = x_;
    y = y_;
    endx = x + level*(random(100) - 50);
    endy = y + 50 + level*random(50);
  }

  void drawMe() {
    strokeWeight(maxLevels - level + 1);
    line(x, y, endx, endy);
    ellipse(x, y, 5, 5);
    println(children);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}
