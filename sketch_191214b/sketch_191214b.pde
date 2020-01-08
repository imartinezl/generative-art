
ArrayList<Pendulum> pendulums = new ArrayList<Pendulum>();

void setup() {
  size(600, 600);

  PVector p0 = new PVector(width/2, height/2);
  float r = 100;
  float theta = PI/2;
  float m = 1;

  for (int i=0; i<10; i++) {
    pendulums.add(new Pendulum(p0, r, theta, m));
    theta = theta + PI/100;
  }
}

void draw() {
  background(255); 

  for (Pendulum p : pendulums) {
    p.update();
    p.display();
  }
  saveFrame("figures/figure_#####.png");
}
