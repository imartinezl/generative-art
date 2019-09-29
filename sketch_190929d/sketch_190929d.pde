float xstart, xnoise, ystart, ynoise;
float xstartnoise, ystartnoise;

void setup() {
  size(300, 300);
  background(0);
  frameRate(24);

  xstart = random(10);
  ystart = random(10);
  xstartnoise = random(20);
  ystartnoise = random(20);
}


void draw() {
  background(0);
  xnoise = xstart;
  ynoise = ystart;

  for (int y=0; y<= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x=0; x<= width; x+=5) {
      xnoise += 0.1;
      //int alph = int(noise(xnoise, ynoise)*255);
      //stroke(0, alph);
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  
  xstart += map(noise(xstartnoise), 0, 1, -0.25, 0.25);
  ystart += map(noise(ystartnoise), 0, 1, -0.25, 0.25);
  xstartnoise += 0.01;
  ystartnoise += 0.01;
}


void drawPoint(float x, float y, float n){
  pushMatrix();
  translate(x,y);
  rotate(n*TWO_PI);
  //stroke(0, 150);
  //line(0,0,20,0);
  float e = n*35;
  float a = 150 + n*120;
  noStroke();
  fill(a, a);
  ellipse(0,0,e,e/2);
  popMatrix();
 //float len = 10*n;
 //rect(x,y,len,len);
}
