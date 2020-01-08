
Line p;
ArrayList<Line> lines = new ArrayList<Line>();
int nx = 10;
int ny = 10;
float sx, sy, r;

void setup() {
  size(600, 600);
  sx = width/nx;
  sy = height/ny;
  r = sqrt(pow(sx, 2) + pow(sy, 2))/2;
  //r = sx/2;
  println(r);
  for (int i=0; i < nx; i++) {
    for (int j=0; j < ny; j++) {
      //if ( (i+j) % 2 == 0) {
      float px = i*sx + sx/2;
      float py = j*sy + sy/2;
      lines.add(new Line(px, py, r));
      //}
    }
  }


  //p = new Line(250, 250, 100);
}

void draw() {
  background(#f8f4e3);
  for (Line p : lines) {
    p.update();
    p.display();
  }
  saveFrame("figures/figure_#####.png");
}
