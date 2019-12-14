class Ball {
  PVector pos, prev_pos;
  int id;
  float r = 10;

  Ball(int id_, PVector p0) {
    id = id_;
    pos = p0;
    prev_pos = pos;
   
  }
  
  void init(ArrayList<Ball> balls){
    while(check_collision(balls)) { //<>//
      pos = PVector.add(prev_pos, PVector.random2D().mult(2*r));
      println(id, pos);
    } 
  }

  void move(PVector target, ArrayList<Ball> balls) {
    float k = 1.0;
    PVector d = PVector.sub(target, pos);
    prev_pos = pos;
    pos = prev_pos.add(d.mult(k));
    println(target, prev_pos, pos, d);
    //while(check_collision(balls)){
    //  k = k*0.99;
    //  pos = prev_pos.add(d.mult(k));
    //}
  }
  
  boolean check_collision(ArrayList<Ball> balls){
    boolean collide = false;
    for (Ball ball : balls) {
      println(ball.id, id);
      if (id != ball.id & ball.pos != null & pos != null) {
        println(id, ball.id, pos, ball.pos, PVector.dist(pos, ball.pos));
        if (PVector.dist(pos, ball.pos) < 2*r) {
          collide = true;
          break;
        }
      }
    }
    return collide;
  }

  void display() {
    stroke(0);
    circle(pos.x, pos.y, 2*r);
  }
}
