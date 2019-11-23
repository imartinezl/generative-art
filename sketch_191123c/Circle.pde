class Circle {

  PVector p0, p;
  float t=0, dt, radius, freq, phase, rot;
  ArrayList<PVector> path = new ArrayList<PVector>();

  boolean hasChild;
  Circle child;

  Circle(float[][] data, float rot_, float n) {
        
    radius = data[0][0];
    freq = data[1][0];
    phase = data[2][0];
    rot = rot_;
    dt = 1/n;

    p0 = new PVector();
    p = new PVector();
    int m = data[0].length;
    
    data[0] = subset(data[0],1);
    data[1] = subset(data[1],1);
    data[2] = subset(data[2],1);

    hasChild = m > 1;
    if (hasChild) {
      child = new Circle(data, rot, n);
    }
  }

  void next(PVector p0_) {
    p0 = p0_.copy();
    this.update();
    this.display();
    if (hasChild) {
      child.next(p);
    }
  }

  void update() {
    p = new PVector();
    float phi = TWO_PI*freq*t + phase + rot;
    p.x = p0.x + radius*cos(phi);
    p.y = p0.y + radius*sin(phi);
    t = t + dt;
  }

  PVector getPos() {
    if (hasChild) {
      return child.getPos();
    } else {
      return p;
    }
  }
  float getTime(){
    return t;
  }

  void display() {
    boolean drawCircles = true;
    boolean drawPath = false;
    if (drawCircles) {
      noFill();
      stroke(0, 0, 0, 80);
      circle(p0.x, p0.y, radius*2);
      circle(p.x, p.y, 10);
      line(p0.x, p0.y, p.x, p.y);
    }
    if (!hasChild & drawPath) {
      noFill(); 
      // Draw final path
      stroke(255, 0, 0, 100);
      beginShape();
      for (PVector q : path) {
        vertex(q.x, q.y);
      }
      endShape();
      path.add(new PVector(p.x, p.y));
      if (path.size() > 400) {
        path.remove(0);
      }
    }
  }
}
