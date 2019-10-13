class Cylinder {
  float r, h, offset;
  PVector p;
  color[] colors;

  Cylinder(PVector p_, float r_, float h_, float offset_, color[] colors_) {
    r = r_;
    h = h_;
    p = p_;
    offset = offset_;
    colors = colors_;
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
    
    fill(colors[0]);
    beginShape();
    for (float theta=0; theta < TWO_PI; theta += theta_step) {
      x = r*cos(theta);
      y = r*sin(theta);
      z = -h/2;
      vertex(x, y, z);
    }
    endShape(CLOSE);

    fill(colors[1]);
    beginShape();
    for (float theta=0; theta < TWO_PI; theta += theta_step) {
      x = r*cos(theta);
      y = r*sin(theta);
      z = h/2;
      vertex(x, y, z);
    }
    endShape(CLOSE);

    fill(colors[2]);
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
