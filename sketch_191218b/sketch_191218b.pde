
Particle p;
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(600, 600);

  for (int i=0; i<100; i++) {
    PVector position = new PVector(random(width), random(height));
    Particle p = new Particle(position);
    particles.add(p);
  }
}


void draw() {

  background(255);
  for (Particle p : particles) {
    p.update();
    p.neighbors(particles);
    p.display();
  }
  saveFrame("figures/figure_#####.png");
}
