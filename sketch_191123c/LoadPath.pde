void loadSVG() {
  PShape s = loadShape("Path.svg").getChild(1);
  n = 0;
  for (int c=0; c<s.getChildCount(); c++) {
    n += s.getChild(c).getVertexCount();
  }

  int k = 0;
  x = new float[n];
  y = new float[n];
  for (int c=0; c < s.getChildCount(); c++) {
    int nc = s.getChild(c).getVertexCount();
    for (int i=0; i<nc; i++) {
      PVector v = s.getChild(c).getVertex(i);
      x[k] = v.y;
      y[k] = v.x;
      k++;
    }
  }
}

void generatePath(){
  n = 100;
  x = new float[n];
  y = new float[n];
  float off = 0;
  for (int i=0; i < n; i++) {
    float theta = TWO_PI*i/float(n);
    float r = 200;
    x[i] = r*cos(theta) + r*noise(off);
    off = off + 0.01;
    y[i] = r*sin(theta) + r*noise(off);
  }
}
