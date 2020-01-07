void setup() {
  size(600, 600);

  background(200);


  float nx = 10;
  float ny = 10;
  float sx = width/nx;
  float sy = height/ny;

  int type = 0;
  
  println(floor(random(4)));

  ArrayList<Tile> tiles = new ArrayList<Tile>();
  for (int i=0; i<nx; i++) {
    for (int j=0; j<ny; j++) {
      PVector pos = new PVector(i*sx+sx/2, j*sy+sy/2);
      PVector shp = new PVector(sx, sy);
      tiles.add(new Tile(pos, shp, type));
      type = (type + 1) % 4;
      println(type);
    }
  }

  for (Tile t : tiles) {
    t.display();
  }
}
