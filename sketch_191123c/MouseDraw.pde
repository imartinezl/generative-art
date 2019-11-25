
void mousePressed() {
  //println("Mouse Pressed");
  drawing = true;
  drawn = false;
  n = path.size();
  for (int i=0; i< n; i++) {
    path.remove(0);
  }
}

void mouseDragged() {
  //println("Mouse Dragged");
  path.add(new PVector(mouseX, mouseY));
  drawn = true;
  loop();
}

void mouseReleased() {
  //println("Mouse Released");
  drawing = false;
  println(path.size());
  // Preprocess data
  if(drawn){
    path2xy();
    dataProcessing();
  }
}

void path2xy() {
  n = path.size();
  x = new float[n];
  y = new float[n];
  for (int i=0; i < n; i++) {
    x[i] = path.get(i).y - 600;
    y[i] = path.get(i).x - 600;
  }
}

void drawPath() {
  noFill();
  stroke(0);
  beginShape();
  for (PVector p : path) {
    vertex(p.x, p.y);
  }
  endShape();
}
