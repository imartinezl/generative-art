class Line {

  float theta, r, v;
  int i = 0, n = 10;
  
  FloatList x = new FloatList();
  FloatList y = new FloatList();
  
  Line(float x_, float y_) {
    x.append(x_);
    y.append(y_);
    theta = random(2*PI);
    r = 0;
    v = 1; //random(2);
  }

  void update() {
    r += v;
    x.append(x.get(i) + r * cos(theta)); //<>//
    y.append(y.get(i) + r * sin(theta));
    if(i+1 > 10-1){
      x.remove(0); //<>//
    }else{
      i++;
    }
    println(x.size());
    
    checkLimits();
  }
 
  
  void checkLimits(){
    //if(x[i+1] > width){
    //  theta = PI - theta;
    //}
  }
  
  void display(){
    beginShape();
    for(int j=0; j<=i; j++){
      vertex(x.get(j), y.get(j));
    }
    endShape();
  }
}
