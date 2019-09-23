class Blob{
  
  PVector pos, vel;
  float x, y, r;
  Blob(float x_, float y_, float r_){
   pos = new PVector(x_, y_);
   vel = PVector.random2D();
   vel.mult(random(2,5));
   r = r_;
  }
  
  void update(){ 
    pos.add(vel);
    
    if(pos.x > width || pos.x < 0){
      vel.x *= -1;
    }
    if(pos.y > height || pos.y < 0){
      vel.y *= -1;
    }
  }
  
  void show(){
   ellipse(pos.x, pos.y, r*2, r*2); 
  }
}
