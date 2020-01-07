class Tile {
  PVector pos, shp;
  int type;
  float angle;
  color cArc, cRect, ca = color(255), cb = color(0);

  Tile(PVector pos_, PVector shp_, int type_) {
    pos = pos_;
    shp = shp_;
    type = type_;
    init();
  }

  void init() {
    switch(type) {
    case 0: 
      cArc = ca;
      cRect = cb;
      angle = 0;
      break;
    case 1: 
      cArc = cb;
      cRect = ca;
      angle = 0;
      break;
    case 2:
      cArc = ca;
      cRect = cb;
      angle = PI/2;
      break;
    case 3:
      cArc = cb;
      cRect = ca;
      angle = PI/2;
      break;
    }
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    //noFill();
    displayRect();
    displayArc();
    popMatrix();
  }

  void displayArc() {
    fill(cArc);
    noStroke();
    ellipseMode(CENTER);
    arc(-shp.x/2, +shp.y/2, shp.x, shp.y, -PI/2, 0, PIE);
    arc(+shp.x/2, -shp.y/2, shp.x, shp.y, PI/2, PI, PIE);
  }

  void displayRect() {
    fill(cRect);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, shp.x, shp.y);
  }
}
