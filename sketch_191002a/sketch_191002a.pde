int numChildren = 3;
int maxLevels = 10;

Branch trunk;

void setup() {
  size(750, 500, P2D);
  //frameRate(2);
  background(255);
  noFill();
  newTree();
}

void draw() {
  println(frameRate);
  background(255);
  trunk.updateMe(width/2, height/2);
  trunk.drawMe();
}

void newTree() {
  trunk = new Branch(1, 0, width/2, height/2);
  trunk.drawMe();
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  Branch[] children = new Branch[0];

  float strokeW, alpha;
  float len, lenChange;
  float rot, rotChange;

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

    strokeW = 1/level * 10;
    alpha = 255 / level;
    len = 1/level * random(200);
    rot = random(360);
    lenChange = random(10)-5;
    rotChange = random(10)-5;
  }

  void updateMe(float x_, float y_) {
    x = x_;
    y = y_;

    rot += rotChange;
    if (rot > 360) rot =0;
    else if (rot<0) rot = 360;

    len += lenChange;
    if (len <0) lenChange *= -1;
    else if (len>200) lenChange *= -1;

    endx = x + len*cos(radians(rot));
    endy = y + len*sin(radians(rot));

    for (int i=0; i<children.length; i++) {
      children[i].updateMe(endx, endy);
    }
  }

  void drawMe() {
    strokeWeight(strokeW);
    stroke(0, alpha);
    fill(255, alpha);
    line(x, y, endx, endy);
    ellipse(x, y, len/12, len/12);
    for (int i=0; i<children.length; i++) {
      children[i].drawMe();
    }
  }
}
