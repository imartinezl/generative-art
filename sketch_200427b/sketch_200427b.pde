
ArrayList<PVector> cirPath, triPath;

PVector p2c(float radius, float angle) {
  return new PVector(radius*cos(angle), radius*sin(angle));
  //return PVector.fromAngle(angle).mult(radius);
}

void setup() {
  size(600, 600);
  smooth();

  cirPath = new ArrayList<PVector>();
  triPath = new ArrayList<PVector>();

  float r = 200, phi_step = 1*PI/180, n = 3;
  float phi_start = 0, phi_amp = 2*PI/n;
  for (float phi=0; phi < 2*PI; phi += phi_step) {
    cirPath.add(p2c(r, phi));

    float amt = (phi - phi_start) / phi_amp;
    triPath.add(PVector.lerp(p2c(r, phi_start), p2c(r, phi_start+phi_amp), amt));
    if ( (phi+phi_step) % phi_amp < phi_step) phi_start += phi_amp;
  }
}

float easeOutQuint(float x) {
  return 1 - pow(1 - x, 5);
}

float amt = 0, amt_step = 0.01;
void draw() {
  background(220);
  translate(width/2, height/2);
  rotate(PI/4);

  stroke(0);
  strokeWeight(2);
  noFill();

  beginShape();
  amt += amt_step;
  if(amt > 1 || amt < 0) amt_step *= -1;
  for(int i=0; i < cirPath.size(); i++){
    PVector p = PVector.lerp(cirPath.get(i), triPath.get(i), amt);
    vertex(p.x, p.y);
  }
  endShape(CLOSE);

  //beginShape();
  //for (PVector c : cirPath) {
  //  vertex(c.x, c.y);
  //}
  //endShape(CLOSE);

  //beginShape();
  //for (PVector t : triPath) {
  //  vertex(t.x, t.y);
  //}
  //endShape(CLOSE);
}
