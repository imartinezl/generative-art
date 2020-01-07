void setup() {
  size(600, 600);

  background(200);

  PVector pos = new PVector(300, 300);
  PVector shp = new PVector(200, 200);

  noFill();
  rectMode(CENTER);
  rect(pos.x, pos.y, shp.x, shp.y);

  fill(255, 0, 0);
  noFill();
  stroke(0);
  ellipseMode(CENTER);
  arc(pos.x-shp.x/2, pos.y+shp.y/2, shp.x, shp.y, -PI/2, 0, OPEN);
  arc(pos.x+shp.x/2, pos.y-shp.y/2, shp.x, shp.y, PI/2, PI, OPEN);
}
