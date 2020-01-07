 //<>//
ArrayList<SmithTile> tiles = new ArrayList<SmithTile>();
int n = 30, nx, ny;

void setup() {
  size(600, 600);
  background(255);

  nx = n;
  ny = n;
  float sx = width/nx;
  float sy = height/ny;

  for (int i=0; i<nx; i++) {
    for (int j=0; j<ny; j++) {
      PVector pos = new PVector(i*sx+sx/2, j*sy+sy/2);
      PVector shp = new PVector(sx, sy);
      tiles.add(new SmithTile(pos, shp));
    }
  }
  for (int k=0; k<tiles.size(); k++) {
    assignType(k);
  }
}

void draw() {
  background(255);
  //frameRate(10);
  for(int i=0; i<random(100); i++){
    assignType(floor(random(n*n)));
  }
  for (SmithTile t : tiles) {
    t.init();
    t.display();
  }
  //saveFrame("figures/figure_######.png");
}

void assignType(int k) {
  SmithTile t = tiles.get(k);
  IntList neighbors = getNeighbors(k, nx, ny);
  IntList neighborsType = new IntList();
  for (int neighborIndex : neighbors) {
    SmithTile neighbor = tiles.get(neighborIndex);
    if (neighbor.hasType) {
      neighborsType.append(neighbor.type);
    }
  }
  int type = floor(random(4));
  while (rejectType(type, neighborsType)) {
    type = floor(random(4));
  }
  t.setType(type);
}
