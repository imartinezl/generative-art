

ArrayList<PVector> path = new ArrayList<PVector>();
int n;
boolean drawing = false, drawed = false;

void setup(){
  size(600,600);
  
}

void draw(){
  background(255);
  
  if(drawing){
    drawPath();
  }
  
  if(drawed){
    stroke(255,0,0);
    fill(0);
    circle(width/2,height/2,50);
  }
 
  //println("LOOP");
}

void mousePressed() {
  //println("Mouse Pressed");
  drawing = true;
  drawed = false;
  int n = path.size();
  for (int i=0; i< n; i++) {
    path.remove(0);
  }
}

void mouseDragged() {
  //println("Mouse Dragged");
  path.add(new PVector(mouseX, mouseY));
  drawed = true;
}

void mouseReleased() {
  //println("Mouse Released");
  drawing = false;
  println(path.size());
  // Preprocess data
}

void drawPath(){
  noFill();
  stroke(0);
  beginShape();
  for(PVector p: path){
    vertex(p.x, p.y);
  }
  endShape();
}
