class Circle {

  float t=0, dt;
  PVector p0, p;
  float rc, fc, ac, rot;
  ArrayList<PVector> path = new ArrayList<PVector>();

  boolean hasChild;
  Circle child;

  Circle(float[][] X, float rot) {
    rc = X[0][0];
    fc = X[1][0];
    ac = X[2][0];

    p0 = new PVector();
    p = new PVector();
    int n = X[0].length;
    
    X[0] = subset(X[0],1);
    X[1] = subset(X[1],1);
    X[2] = subset(X[2],1);

    hasChild = n > 1;
    if (hasChild) {
      child = new Circle(X, rot);
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
    float phi = fc*t + ac + rot;
    p.x = p0.x + rc*cos(phi);
    p.y = p0.y + rc*sin(phi);
    t = t + 0.002;
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
      circle(p0.x, p0.y, rc*2);
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
