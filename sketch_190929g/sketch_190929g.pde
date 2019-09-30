int num = 10;
ArrayList<Circle> circles = new ArrayList<Circle>();

void setup(){
 size(1000, 800);
 background(255);
}

void draw(){
   //background(255);
   //println(circles.size());
   for(Circle c: circles){
     c.updateMe();
   }
}

void mousePressed(){
   createCircles();
}

void createCircles(){
  for(int i=0; i<num;i++){
    Circle c = new Circle();
    circles.add(c);
  }
}
class Circle{
  float x,y,r;
  float xvel, yvel;
  color linecol, fillcol;
  float alpha;
  
  Circle(){
    x = random(width);
    y = random(height);
    r = random(100) + 10;
    xvel = random(10) -5;
    yvel = random(10) -5;
    
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alpha = random(255);
  }
  
  void drawMe(){
    noStroke();
    fill(fillcol, alpha);
    ellipse(x,y,r*2,r*2);
    stroke(linecol, 150);
    noFill();
    ellipse(x,y,10,10);
  }
  void checkLimits(){
   if(x > width+r) x=-r;
   if(x < -r) x=width+r;
   if(y > height+r) y=-r;
   if(y < -r) y=height+r;
  }
  
  void checkcollision(){
    for(Circle c: circles){
      if( c!= this ){
       float d = dist(x,y,c.x,c.y);
       float overlap = d - r - c.r;
       if(overlap < 0){
         float mx = (x+c.x)/2;
         float my = (y+c.y)/2;
         stroke(0, 5);
         noFill();
         overlap *= -1;
         ellipse(mx,my,overlap, overlap);
         
       }
      }
    }
  }
  void updateMe(){
   x += xvel;
   y += yvel;
   
   checkLimits();
   checkcollision();
   //drawMe();
  }
}
