
ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
  size(600, 600);
  background(220);
  
  PVector pos_initial = new PVector(random(width), random(height));

  for (int i=0; i<100; i++) {
    particles.add(new Particle(pos_initial.add(PVector.random2D())));
  }
}

void keyPressed(){
  if(key == '1'){
    saveFrame("figures/image_#####.png"); 
  }
}

void draw() {

  PVector target = new PVector(mouseX, mouseY);
  target = new PVector(width/2, height/2);
  for (Particle p : particles) {
    p.attract(target);
    p.update();
    p.display();
  }
}
