
class Line {

  float xc, yc, r, dir;
  float x, y, theta;
  float n = 0;
  int type = floor(random(4));

  float n_max = 30;
  float theta_min, theta_max;

  Line(float xc_, float yc_, float r_) {
    xc = xc_;
    yc = yc_;
    r = r_;
    dir = 2*floor(random(2)) - 1;
    theta_min = PI/4*(1+ 2*floor(random(4)));
    theta_max = theta_min + PI/2;
  }
  void calcIncr() {
    theta = map2(n, 0, n_max, theta_min, theta_max, 6, 2);
    //theta = map(n, 0, n_max, theta_min, theta_max);
    n++;
    if (n > n_max) {
      n = 0;
      theta_min += PI/2;
      theta_max += PI/2;
      type = floor(random(4));
    }
  }

  void update() {
    calcIncr();
    x = xc + r*cos(theta);
    y = yc + dir*r*sin(theta);
  }
  void display() {
    strokeWeight(1);
    stroke(#011627);
    line(xc, yc, x, y);
    
    strokeWeight(5);
    stroke(#ff3366);
    point(x, y);
  }
}
