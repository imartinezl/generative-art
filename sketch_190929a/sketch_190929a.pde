
size(1000, 1000);
background(255);
strokeWeight(0.5);
//smooth();

int cx = width/2;
int cy = height/2;


for (int i=0; i < 100; i++) {
  float x, y;
  float rnoise = random(10);
  float r = width/4;
  int startA = int(random(360));
  int engA = 1440 + int(random(1440));
  int stepA = 5 + int(random(3));
  stroke(random(20), random(50), random(70), 80);
  noFill();
  beginShape();
  for (float ang = startA; ang<= engA; ang += stepA) {
    float rad = radians(ang);
    r += 0.2;
    rnoise += 0.05;
    float tr = r + noise(rnoise)*200 - 100;
    x = cx + tr*cos(rad);
    y = cy + tr*sin(rad);
    vertex(x, y);
  }
  endShape();
}
saveFrame("figure.png");
