void setup() { //<>//
  size(1000, 1000);

  background(200);


  int n = 50;
  int nx = n;
  int ny = n;
  float sx = width/nx;
  float sy = height/ny;


  ArrayList<Tile> tiles = new ArrayList<Tile>();
  for (int i=0; i<nx; i++) {
    for (int j=0; j<ny; j++) {
      PVector pos = new PVector(i*sx+sx/2, j*sy+sy/2);
      PVector shp = new PVector(sx, sy);
      tiles.add(new Tile(pos, shp));
    }
  }


  for (int k=0; k<tiles.size(); k++) {
    Tile t = tiles.get(k);
    IntList neighbors = getNeighbors(k, nx, ny);
    IntList neighborsType = new IntList();
    for (int neighborIndex : neighbors) {
      Tile neighbor = tiles.get(neighborIndex);
      if (neighbor.hasType) {
        neighborsType.append(neighbor.type);
      }
    }
    int type = floor(random(4));
    while (rejectType(type, neighborsType)) {
      type = floor(random(4));
    }
    t.setType(type);
    t.init();
    t.display();
  }

}
