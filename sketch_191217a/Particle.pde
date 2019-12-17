class Particle{
  PVector pos, vel, acc, prev_pos;
  
  Particle(PVector pos_initial){
   pos = pos_initial;
   prev_pos = pos.copy();
   vel = PVector.random2D().mult(2);
   acc = new PVector(0,0);
  }
  
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  void attract(PVector target){
    PVector force = PVector.sub(target, pos);
    float d = force.mag();
    d = constrain(d, 1, 25);
    float G = 1;
    float strength = G/(d*d);
    force.setMag(strength);
    if (d < 20) {
      force.mult(-10);
    }
    acc.add(force);
  }
  
  void display(){
   
    stroke(0, 0, 0, 10);
    noFill();
    //point(pos.x, pos.y);
    strokeWeight(0.5);
    line(prev_pos.x, prev_pos.y, pos.x, pos.y);
        
    prev_pos = pos.copy();
  }
  
  
  
}
