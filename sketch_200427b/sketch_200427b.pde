
ArrayList<PVector> cirPath, triPath;

PVector p2c(float radius, float angle) {
  return new PVector(radius*cos(angle), radius*sin(angle));
  //return PVector.fromAngle(angle).mult(radius);
}

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  //blendMode(ADD);
  //smooth();

  cirPath = new ArrayList<PVector>();
  triPath = new ArrayList<PVector>();

  float r = 30, phi_step = 10*PI/180, n = 3;
  float phi_start = 0, phi_amp = 2*PI/n;
  for (float phi=0; phi < 2*PI; phi += phi_step) {
    cirPath.add(p2c(r, phi));

    float amt = (phi - phi_start) / phi_amp;
    triPath.add(PVector.lerp(p2c(r, phi_start), p2c(r, phi_start+phi_amp), amt));
    if ( (phi+phi_step) % phi_amp < phi_step) phi_start += phi_amp;
  }

  gx = 15;
  gy = 15;
  amt = new float[gx][gy];
  amt_step = new float[gx][gy];
  rotation = new float[gx][gy];
  scl = new float[gx][gy];
  colors = new color[gx][gy];
  pos = new PVector[gx][gy];
  vel = new PVector[gx][gy];
  for (int i=0; i < gx; i++) {
    for (int j=0; j < gy; j++) {
      amt[i][j] = random(1);
      amt_step[i][j] = random(0.0005, 0.05)*int(random(-2,2));
      rotation[i][j] = random(TWO_PI);
      scl[i][j] = random(1, 2);
      colors[i][j] = color(random(140,210), random(50, 90), random(80, 90), random(10,100));
      
      pos[i][j] = new PVector(random(width), random(height));
      vel[i][j] = new PVector(random(-1,1), random(-1,1));
      
    }
  }
}

float easeOutQuint(float x) {
  return 1 - pow(1 - x, 5);
}

float[][] amt, amt_step, rotation, scl;
PVector[][] pos, vel;
color[][] colors;
int gx, gy;
void draw() {
  background(65, 30, 0);
  fill(0, 0, 100);
  text(round(frameRate), 10, 10);
  //translate(width/gx/2, height/gy/2);

  stroke(0);
  strokeWeight(0.1);
  noFill();
  noStroke();


  for (int i=0; i < gx; i++) {
    for (int j=0; j < gy; j++) {
      pushMatrix();
      //translate(i*60, j*60);
      
      translate(pos[i][j].x, pos[i][j].y);
      pos[i][j].add(vel[i][j]);
      if(pos[i][j].x > width || pos[i][j].x < 0) vel[i][j].x *= -1;
      if(pos[i][j].y > height || pos[i][j].y < 0) vel[i][j].y *= -1;
      rotate(rotation[i][j]);
      scale(scl[i][j]);
      fill(colors[i][j]);
      display_path(amt[i][j]);
      popMatrix();
      amt[i][j] += amt_step[i][j];
      if (amt[i][j] > 3 || amt[i][j] < 0) amt_step[i][j] *= -1;
    }
  }
}

void display_path(float amt) {
  beginShape();
  for (int i=0; i < cirPath.size(); i++) {
    PVector p = PVector.lerp(cirPath.get(i), triPath.get(i), amt);
    vertex(p.x, p.y);
  }
  endShape(CLOSE);
}

void display_cirPath() {
  beginShape();
  for (PVector c : cirPath) {
    vertex(c.x, c.y);
  }
  endShape(CLOSE);
}


void display_triPath() {
  beginShape();
  for (PVector t : triPath) {
    vertex(t.x, t.y);
  }
  endShape(CLOSE);
}
