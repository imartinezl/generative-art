float anoise = random(10);
float rnoise = random(10);
float xnoise = random(10);
float ynoise = random(10);
float scol = 254;
int schange = 1;

void setup() {
  size(600, 600);
  background(255);
  noFill();
}

void draw() {
  //stroke(20, 50, 70, 50);

  float r = map(noise(rnoise), 0, 1, 1, 301);
  rnoise += 0.005;
  
  float ang = map(noise(anoise), 0, 1, 0, TWO_PI);
  anoise += 0.005;


  float cx = width/2 + map(noise(xnoise), 0, 1, -50, 50);
  float cy = height/2 + map(noise(ynoise), 0, 1, -50, 50);
  xnoise += 0.01;
  ynoise += 0.01;

  float x1 = cx + r * cos(ang);
  float y1 = cy + r * sin(ang);

  float x2 = cx + r * cos(ang + PI);
  float y2 = cy + r * sin(ang + PI);

  scol += schange;
  if(scol > 254) schange = -1;
  if(scol < 0) schange = 1;
  stroke(scol, 60);
  line(x1, y1, x2, y2);
  


  //saveFrame("output/figure_#####.png");
}
