
ArrayList<Ball> balls = new ArrayList<Ball>();
PVector target;

void setup() {

  size(600, 600);

  PVector p0 = new PVector(width/2, height/2);
  for (int i=0; i<2; i++) {
    balls.add(new Ball(i, p0));
  }
  for (Ball b : balls) {
    b.init(balls);
  }
}


void draw() {
  background(255);
  target = new PVector(mouseX, mouseY);

  PVector p0 = new PVector(width/2, height/2);
  for (Ball b : balls) {

    //b.move(p0, balls);
    b.display();
  }
}
