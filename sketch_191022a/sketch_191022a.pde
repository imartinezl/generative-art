
ArrayList<Line> lines = new ArrayList<Line>();

void setup() {

  size(600, 600);
}

void mousePressed() {
  Line s = new Line(mouseX, mouseY);
  lines.add(s);
}




void draw() {
  background(255);
  for (Line s : lines) {
    s.update();
    s.display();
  }
}
