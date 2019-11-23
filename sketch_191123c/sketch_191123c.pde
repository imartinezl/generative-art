
Circle cx;
Circle cy;
PVector px = new PVector(200, 600);
PVector py = new PVector(600, 200);

Curve c;
float[] x;
float[] y;
int n;

void load() {
  int skip = 10;
  JSONArray train = loadJSONObject("codingtrain.json").getJSONArray("drawing");
  n = train.size()/skip;
  x = new float[n];
  y = new float[n];

  for (int i = 0; i < n; i+= 1) {
    x[i] = train.getJSONObject(i*skip).getFloat("x");
    y[i] = train.getJSONObject(i*skip).getFloat("y");
  }
}

float[][] dft(float[] x) {
  int N = x.length;
  float[][] X = new float[3][N];
  for (int k=0; k < N; k++) {
    float real = 0;
    float imag = 0;
    for (int n=0; n < N; n++) {
      float phi = TWO_PI*k*n/N;
      real += x[n]*cos(phi);
      imag -= x[n]*sin(phi);
    }
    real = real/N;
    imag = imag/N;

    float freq = k;
    float amp = sqrt(real*real + imag*imag);
    float phase = atan2(imag, real);
    //X[k] = new float[]{real, imag, freq, amp, phase }; 
    X[0][k] = amp;
    X[1][k] = freq;
    X[2][k] = phase;
  }
  
  for(int i=0; i < N-1; i++) {
    for(int j=i+1; j < N; j++) {
      if(X[0][j] > X[0][i]){
        for (int k=0; k<3; k++){
          float temp = X[k][i];
          X[k][i] = X[k][j];
          X[k][j] = temp;
        }
      }
    }
  }
  
  return X;
}


void setup() {
  size(1000, 1000);
  load();
  //smooth(8);

  //x = new float[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  //y = new float[]{1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
  float[][] X = dft(x);
  float[][] Y = dft(y);
  println(n);

  cx = new Circle(X, 0);
  cy = new Circle(Y, PI/2);
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
}
