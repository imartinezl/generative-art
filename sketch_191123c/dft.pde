
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
  
  // sort
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
