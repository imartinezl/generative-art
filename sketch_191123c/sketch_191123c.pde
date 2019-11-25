
Circle cx;
Circle cy;
float x0 = 200, y0 = 600;
PVector px = new PVector(x0, y0);
PVector py = new PVector(y0, x0);

Curve c;
float[] x, y;
float[][] X, Y;
int n;

ArrayList<PVector> path = new ArrayList<PVector>();
boolean drawing = false, drawn = false;

void dataProcessing(){
  X = dft(x);
  Y = dft(y);

  cx = new Circle(X, PI/2, n);
  cy = new Circle(Y, 0, n);
  c = new Curve();
}

void setup() {
  size(1000, 1000);
  //loadSVG();
  //generatePath();
  //dataProcessing();
}

void draw() {

  background(255);
  line(x0,0,x0,height);
  line(0,x0,width,x0);
  if(drawing){
    drawPath();
  }
  if(n > 1 & !drawing){  
    cx.next(px);
    cy.next(py);
    
    c.addPoint(cx.getPos(), cy.getPos());
    c.display();
    if (cx.t > 1-1/float(n)) {
      noLoop();
    } 
  }
  //saveFrame("figures/img_######.png");
}
