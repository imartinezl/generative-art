
Circle cx;
Circle cy;
PVector px = new PVector(200, 600);
PVector py = new PVector(600, 200);

Curve c;
float[] x, y;
float[][] X, Y;
int n;

void setup() {
  size(1000, 1000);
  loadSVG();

  println(n);
  X = dft(x);
  Y = dft(y);

  cx = new Circle(X, PI/2, n);
  cy = new Circle(Y, 0, n);
  c = new Curve();
}

void draw() {

  background(255);

  
  cx.next(px);
  cy.next(py);

  c.addPoint(cx.getPos(), cy.getPos());
  c.display();
  if (cx.t > 1) {
    noLoop();
  }
  saveFrame("figures/img_######.png");
}

void loadSVG(){
  PShape s = loadShape("Path.svg").getChild(1);
  n = 0;
  for(int c=0; c<s.getChildCount(); c++){
    n += s.getChild(c).getVertexCount();
  }
  
  int k = 0;
  x = new float[n];
  y = new float[n];
  for(int c=0; c < s.getChildCount(); c++){
    int nc = s.getChild(c).getVertexCount();
    for(int i=0; i<nc; i++){
      PVector v = s.getChild(c).getVertex(i);
      x[k] = v.y;
      y[k] = v.x;
      k++;
    }
  }
}
