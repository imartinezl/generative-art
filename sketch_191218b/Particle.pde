class Particle {
  PVector pos, vel;

  Particle(PVector pos_ini) {
    pos = pos_ini;
    vel = PVector.random2D();
    vel.setMag(random(10));
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

  void display() {

    noStroke();
    fill(51);
    circle(pos.x, pos.y, 2);
  }
}
