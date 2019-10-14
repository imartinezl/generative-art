class Line{
 
  float xc, yc, r, theta;
  float x,y;
  float n = 0;
  
  Line(float xc_, float yc_, float r_, float theta_){
    xc = xc_;
    yc = yc_;
    r = r_;
    theta = theta_;
  }
  void calcIncr(){
    float n_max = 100;
    float theta_max = 2*PI;
    float m = theta_max/n_max;
    theta = theta_max/2/pow(n_max,2)*pow(n,2); //pow(sin(2*PI*n/(n_max)),2);
    n++;
    if(n > n_max){
      n = 0;
    }
    println(theta);
  }
  
  void update(){
    calcIncr();
    x = xc + r*cos(theta);
    y = yc - r*sin(theta);
  }
  void display(){
    strokeWeight(1);
    line(xc, yc, x, y);
  }
}
