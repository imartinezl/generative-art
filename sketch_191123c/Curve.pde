class Curve {

  ArrayList<PVector> path = new ArrayList<PVector>();
  PVector px, py;
  Curve() {
  }
  
  void addPoint(PVector px_, PVector py_){
    px = px_;
    py = py_;
    PVector p = new PVector(py.x, px.y);
    path.add(p);
  }

  void display() {

    // Draw horizontal line
    stroke(0,0,0,100);
    line(px.x, px.y, py.x, px.y);
    
    //// Draw vertical line
    stroke(0,0,0,100);
    line(py.x, px.y, py.x, py.y);

    // Draw curve
    stroke(0,0,0);
    beginShape();
    for (PVector p : path) {
      vertex(p.x, p.y);
    }
    endShape();

    if (path.size() > 1000) {
      path.remove(0);
    }
  }
}
