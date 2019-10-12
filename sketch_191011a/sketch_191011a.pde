


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
      float offset = 0;
      if ((i+j) % 2 == 0) {
        offset = PI/2;
        PVector p = new PVector(i*sx+sx/2, j*sy+sy/2, 0);
        cs.add(new Cylinder(p, r, h, offset));
      }
    }
  }
}

color c = color(#b38d97);

void draw() {
  background(c);
  for (Cylinder c : cs) {
    c.update(angle);
  }
  angle += PI/100;
  if(angle > PI){
   c = color(#ebcfb2);
  }
  if(angle > TWO_PI){
   c = color(#b38d97);
   angle = 0;
  }
}
