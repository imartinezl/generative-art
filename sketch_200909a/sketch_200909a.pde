//FloatList x1 = new FloatList();
//FloatList x2 = new FloatList();
int t, t_max;
float x1, x2, x1p, x2p;
float eps, eps_step, eps_min, eps_max;

float f(float x){
  return 4 * x * (1-x);
}

float next_x1(float x1p, float x2p, float eps){
  return (1-eps)*f(x1p) + eps*x2p;
}

float next_x2(float x1p, float x2p, float eps){
  return (1-eps)*f(x2p) + eps*x1p;
}

void setup() {
  
  size(500, 500);
  background(230);
  
  stroke(0, 50);
  strokeWeight(0.5);
  
  x1p = 0.88;
  x2p = 0.33;
  t = 0;
  t_max = 1;
  eps = 0.2615;
  eps_step = 0.0001;
  eps_min = 0;
  eps_max = 1;
}

void draw() {
  stroke(0, 50);
  strokeWeight(1);
  for(int i=0; i<=5000*10; i++){
    x1 = next_x1(x1p, x2p, eps);
    x2 = next_x2(x1p, x2p, eps);
    point(x1*width, height*(1-x2));
    x1p = x1;
    x2p = x2;
  }
  
  t++;
  if(t>t_max){
    //stop();
    background(230);
    println(t, eps);
    t = 0;
    eps += eps_step;
    if(eps > eps_max || eps < eps_min){
      eps_step *= -1;
    }    
  }
  //println(frameRate);
  //text(frameRate, 10, 10);
  
  
}
