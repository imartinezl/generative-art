float xstart, ystart, zstart;
float xnoise, ynoise, znoise;

float s = 200;
float e = 5;
void setup() {
  size(500, 300, P3D);

  xstart = random(10);
  ystart = random(10);
  zstart = random(10);
}


void draw() {
  background(0);
  noStroke();

  translate(150, 20, -150);
  rotateZ(frameCount*0.1);
  rotateY(frameCount*0.1);

  znoise = zstart;
  for (int z=0; z<s; z+=e) {
    znoise += 0.1;
    ynoise = ystart;
    for (int y=0; y<s; y+=e) {
      ynoise += 0.1;
      xnoise = xstart;
      for (int x=0; x<s; x+=e) {
        xnoise += 0.1;
        drawPoint(x, y, z, noise(xnoise, ynoise, znoise));
      }
    }
  }
  xstart += 0.01;
  ystart += 0.01;
  zstart += 0.01;
}

void drawPoint(float x, float y, float z, float n) {
  pushMatrix();
  translate(x, y, z);
  fill(n*255, 10);
  box(e,e,e); 
  popMatrix();
}
