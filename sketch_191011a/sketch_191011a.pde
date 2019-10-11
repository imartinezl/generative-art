


float angle = 0.0;
float r = 25;
float h = 60;
int np = 50;
float theta_step = TWO_PI/np;


ArrayList<Cylinder> cs = new ArrayList<Cylinder>();
int nx = 12;
int ny = 10;

void setup() {
  size(600, 600, P3D);
  background(255);
  ortho();
  
  float sx = width/nx;
  float sy = height/ny;

  for (int i=0; i<nx; i++) {
    for (int j=0; j<ny; j++) {
      PVector p = new PVector(i*sx+sx/2, j*sy+sy/2, 0);
      cs.add(new Cylinder(p, r, h));
    }
  }
}


void draw() {
  background(255);
  for (Cylinder c : cs) {
    c.update(angle);
  }
  angle += 0.01;
}
