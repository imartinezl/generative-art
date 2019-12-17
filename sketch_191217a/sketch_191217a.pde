
ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
  size(1000, 1000);
  background(220);

  for (int j=0; j<2; j++) {
    PVector pos_initial = new PVector(random(width), random(height));
    for (int i=0; i<30; i++) {
      particles.add(new Particle(pos_initial.add(PVector.random2D())));
    }
  }
}



void draw() {

  PVector target = new PVector(mouseX, mouseY);
  PVector targetA = new PVector(0, 0);
  PVector targetB = new PVector(width/2, height/2);
  PVector targetC = new PVector(width/2, height);
  for (Particle p : particles) {
    //p.attract(target);
    p.attract(targetA);
    p.attract(targetB);
    p.attract(targetC);
    p.update();
    p.display();
  }
}


void keyPressed() {
  if (key == '1') {
    saveFrame("figures/image_#####.png");
  }
}
