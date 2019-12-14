class Pendulum {
  PVector p0, p1, p2;
  PVector q, qp, qpp;
  float r1, r2, m1, m2, g=1;
  ArrayList<PVector> history = new ArrayList<PVector>();
  boolean display_trace = true, display_pendulum = false;

  Pendulum(PVector p0, float r1, float r2, float theta, float phi, float m1, float m2) {
    this.p0 = p0;
    this.r1 = r1;
    this.r2 = r2;
    this.m1 = m1;
    this.m2 = m1;
    this.q = new PVector(theta, phi);
    this.qp = new PVector(0, 0);
    this.qpp = new PVector(0, 0);
  }

  Pendulum(PVector p0, float r, float theta, float m) {
    this.p0 = p0;
    this.r1 = r;
    this.r2 = r;
    this.m1 = m;
    this.m2 = m;
    this.q = new PVector(theta, theta);
    this.qp = new PVector(0, 0);   
    this.qpp = new PVector(0, 0);
  }

  void lagrangeEq() {
    float num1 = -g * (2 * m1 + m2) * sin(q.x);
    float num2 = -m2 * g * sin(q.x-2*q.y);
    float num3 = -2*sin(q.x-q.y)*m2;
    float num4 = qp.y*qp.y*r2+qp.x*qp.x*r1*cos(q.x-q.y);
    float den = r1 * (2*m1+m2-m2*cos(2*q.x-2*q.y));
    qpp.x = (num1 + num2 + num3*num4) / den;

    num1 = 2 * sin(q.x-q.y);
    num2 = (qp.x*qp.x*r1*(m1+m2));
    num3 = g * (m1 + m2) * cos(q.x);
    num4 = qp.y*qp.y*r2*m2*cos(q.x-q.y);
    den = r2 * (2*m1+m2-m2*cos(2*q.x-2*q.y));
    qpp.y= (num1*(num2+num3+num4)) / den;
  }


  void update() {
    lagrangeEq();
    qp = qp.add(qpp);
    q = q.add(qp);

    qp = qp.mult(0.999); // damping

    p1 = PVector.add(p0, new PVector(r1*sin(q.x), r1*cos(q.x)));
    p2 = PVector.add(p1, new PVector(r2*sin(q.y), r2*cos(q.y)));

    history.add(p2);
    if (history.size() > 200) {
      history.remove(0);
    }
  }

  void display() {

    if (display_pendulum) {
      fill(0);
      noStroke();
      circle(p0.x, p0.y, 10);
      circle(p1.x, p1.y, 10);
      circle(p2.x, p2.y, 10);
      stroke(0, 0, 0, 100);
      strokeWeight(1);
      line(p0.x, p0.y, p1.x, p1.y);
      line(p1.x, p1.y, p2.x, p2.y);
    }
    if (display_trace) {
      noFill();
      strokeWeight(0.8);
      stroke(0, 0, 0, 100);
      beginShape();
      for (PVector p : history) {
        vertex(p.x, p.y);
      }
      endShape();
    }
  }
}
