ArrayList<SemiCircle> scs = new ArrayList<SemiCircle>();

void setup() {
  size(600, 600);
  float jump = 30;
  float w = 10;
  float n = width/jump;
  for (float i=jump; i< width; i+=jump) {
    scs.add(new SemiCircle(i, w));
  }
}

void draw() {
  background(230);
  translate(width/2, height/2);
  for (SemiCircle sc : scs) {
    sc.display();
    sc.update();
  }
  saveFrame("figures/figure_######.png");
}
