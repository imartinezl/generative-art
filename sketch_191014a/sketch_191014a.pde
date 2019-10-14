
Line p;

void setup(){
  size(600, 600);
  p = new Line(250, 250, 100, 0);
}

void draw(){
  background(255);
  p.update();
  p.display();
}
