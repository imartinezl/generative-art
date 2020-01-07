 //<>//
ArrayList<Tile> tiles = new ArrayList<Tile>();
int n = 10, nx, ny;
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
      tiles.add(new Tile(pos, shp));
    }
  }
  
  assignType();
}

void draw(){
  background(255);
  frameRate(1);
  assignType();
  for(Tile t: tiles){
    t.init();
    t.display();
  }
}

void assignType(){
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
  }
}
