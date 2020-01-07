class Tile {
  PVector pos, shp;
  Tile(PVector pos_, PVector shp_) {
    pos = pos_;
    shp = shp_;
  }

  void display() {

    fill(255, 0, 0);
    noFill();
    stroke(0);
    ellipseMode(CENTER);
    arc(pos.x-shp.x/2, pos.y+shp.y/2, shp.x, shp.y, -PI/2, 0, OPEN);
    arc(pos.x+shp.x/2, pos.y-shp.y/2, shp.x, shp.y, PI/2, PI, OPEN);
  }

  void displayBound() {
    noFill();
    rectMode(CENTER);
    rect(pos.x, pos.y, shp.x, shp.y);
  }
}
