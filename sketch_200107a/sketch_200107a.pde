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
  float nAssign = random(n);
  for(int i=0; i<nAssign; i++){
    int k = floor(random(n*n));
    assignType(k);
  }
  for (SmithTile t : tiles) {
    t.init();
    t.display();
  }
  saveFrame("figures/figure_######.png");
  typeCounts();
  
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



void typeCounts(){
  HashMap<Integer,Integer> hm = new HashMap<Integer,Integer>();
  for (SmithTile t : tiles) {
    int type = t.getType();
    if(hm.get(type) == null){
      hm.put(type, 1);
    }else{
      hm.put(type, hm.get(type) + 1);
    }
  }
  println(hm);
}
