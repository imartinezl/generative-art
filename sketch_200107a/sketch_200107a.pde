void setup() {
  size(600, 600);

  background(200);


  float nx = 3;
  float ny = 3;
  float sx = width/nx;
  float sy = height/ny;

  ArrayList<Tile> tiles = new ArrayList<Tile>();
  for (int i=0; i<nx; i++) {
    for (int j=0; j<ny; j++) {
      PVector pos = new PVector(i*sx+sx/2, j*sy+sy/2);
      PVector shp = new PVector(200, 200);
      tiles.add(new Tile(pos, shp));
    }
  }
  
  for(Tile t: tiles){
    t.display();
  }
}
