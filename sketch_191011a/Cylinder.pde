class Cylinder {
  float r, h, offset;
  PVector p;

  Cylinder(PVector p_, float r_, float h_, float offset_) {
    r = r_;
    h = h_;
    p = p_;
    offset = offset_;

  }
  
  void update(float angle){
    pushMatrix();
    translate(p.x, p.y, p.z);
    rotateX(angle + offset);
    this.display();
    popMatrix();
  }

  void display() {
    float x, y, z;
    noStroke();

    fill(#ebcfb2);
    beginShape();
    for (float theta=0; theta < TWO_PI; theta += theta_step) {
      x = r*cos(theta);
      y = r*sin(theta);
      z = -h/2;
      vertex(x, y, z);
    }
    endShape(CLOSE);

    fill(#424b54);
    beginShape();
    for (float theta=0; theta < TWO_PI; theta += theta_step) {
      x = r*cos(theta);
      y = r*sin(theta);
      z = h/2;
      vertex(x, y, z);
    }
    endShape(CLOSE);

    fill(#b38d97);
    beginShape(TRIANGLE_STRIP);
    for (float theta=0; theta < TWO_PI+theta_step; theta += theta_step) {
      x = r*cos(theta);
      y = r*sin(theta);
      vertex(x, y, h/2);
      vertex(x, y, -h/2);
    }
    endShape(CLOSE);
  }
}
