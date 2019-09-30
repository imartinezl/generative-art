
int r = 100;
void setup(){
 size(500, 300, P3D); 
}

void draw(){
 background(255);
 noFill();
 translate(width/2, height/2, 0);
 rotateY(frameCount*0.03);
 rotateX(frameCount*0.05);
 
 float theta = 0;
 float phi = 0;
 beginShape();
 while(theta < PI){
   
   float x = r*sin(theta)*cos(phi);
   float y = r*sin(theta)*sin(phi);
   float z = r*cos(theta);
   vertex(x,y,z);
   
   theta += PI/180;
   phi += PI/10;
 }
 endShape();
}
