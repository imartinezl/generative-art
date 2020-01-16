class SemiCircle {

  float r, w, angle=0.0, angle_incr = 0.10;
  SemiCircle(float r_, float w_) {
    r = r_;
    w = w_;
  }

  void update() {
    angle += angle_incr*r/width;
  }

  void display() {
    pushMatrix();
    stroke(51);
    strokeWeight(w);
    strokeCap(ROUND);
    noFill();
    rotate(angle);
    ellipseMode(CENTER);
    arc(0, 0, r, r, 0+angle, PI+angle);   
    popMatrix();
  }
}
