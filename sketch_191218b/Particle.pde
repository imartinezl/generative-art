class Particle {
  PVector pos, vel;
  color c = color(255,0,0);
  ArrayList<Particle> neighbors;

  Particle(PVector pos_ini) {
    pos = pos_ini;
    vel = PVector.random2D();
    vel.setMag(random(5));
  }

  void update() {
    pos.add(vel);
    edges();
  }

  void edges() {
    if (pos.x > width) pos.x = pos.x - width; 
    if (pos.x < 0) pos.x = pos.x + width; 
    if (pos.y > height) pos.y = pos.y - height; 
    if (pos.y < 0) pos.y = pos.y + height;
  }

  void neighbors(ArrayList<Particle> particles) {
    c = color(255,0,0);
    neighbors = new ArrayList<Particle>();
    for (Particle p : particles) {
      if ( p != this ) {
        float d = PVector.dist(pos,p.pos);
        if(d < 100){
          neighbors.add(p);
          c = color(0, 255, 0);
        }
      }
    }
  }

  void display() {

    noStroke();
    fill(c);
    //circle(pos.x, pos.y, 10);
    for(Particle p: neighbors){
      stroke(0, 50);
      strokeWeight(random(3));
      line(pos.x, pos.y, p.pos.x, p.pos.y);
    }
  }
}
