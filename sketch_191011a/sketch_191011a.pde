
float angle = 0.0;
float r = 25;
float h = 60;
int np = 50;
float theta_step = TWO_PI/np;

color[] colors = {#ebcfb2, #424b54, #b38d97};
color c = colors[0];


ArrayList<Cylinder> cs = new ArrayList<Cylinder>();
int nx = 12;
int ny = 10;

void setup() {
  size(600, 600, P3D);
  background(c);
  ortho();

  float sx = width/nx;
  float sy = height/ny;

  for (int i=0; i<nx; i++) {
    for (int j=0; j<ny; j++) {
      float offset = 0;
      if ((i+j) % 2 == 0) {
        offset = PI/2;
        PVector p = new PVector(i*sx+sx/2, j*sy+sy/2, 0);
        cs.add(new Cylinder(p, r, h, offset, colors));
      }
    }
  }
}



void draw() {
  background(c);
  for (Cylinder c : cs) {
    c.update(angle);
  }
  angle += PI/100;
  if(angle > PI){
   //c = colors[1];
  }
  if(angle > TWO_PI){
   c = colors[0];
   angle = 0;
  }
  saveFrame("figures/figure_#####.png");
}
