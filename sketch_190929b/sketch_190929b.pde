

void setup(){
  size(500, 500);
  background(255);
  
  float r = 100;
  int cx = width/2;
  int cy = height/2;
  
  stroke(0, 30);
  noFill();
  ellipse(cx, cy, r*2, r*2);
  
  stroke(20, 50, 70);
  float x, y;
  float n = random(10);
  fill(20, 50, 70, 50);
  beginShape();
  for(float ang = 0; ang<=360; ang+=1){
    n += 0.1;
    float rvar = 30*customNoise(n);
    float tr = r + rvar;
    x = cx + tr*cos(radians(ang));
    y = cy + tr*sin(radians(ang));
    curveVertex(x,y);
  }
  endShape(CLOSE);
}

float customNoise(float value){
  int count = int(value % 12);
  float r = pow(sin(value), count);
  return r;
}
