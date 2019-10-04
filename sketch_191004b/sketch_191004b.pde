FractalRoot pentagon;
float sf = 0.15;
int maxLevels = 3;

void setup() {
  size(1000, 1000);
  pentagon = new FractalRoot();
  pentagon.drawShape();
}

class PointObj {
  float x, y;
  PointObj(float x_, float y_) {
    x = x_;
    y = y_;
  }
}

class FractalRoot {
  PointObj[] pointArr = new PointObj[5];
  Branch rootBranch;

  FractalRoot() {
    float cx = width/2;
    float cy = height/2;
    int count = 0;
    for (int i=0; i<360; i+=72) {
      float x = cx + 400*cos(radians(i));
      float y = cy + 400*sin(radians(i));
      pointArr[count] = new PointObj(x, y);
      count++;
    }
    rootBranch = new Branch(0, 0, pointArr);
  }

  void drawShape() {
    rootBranch.drawMe();
  }
}

class Branch {
  int level, num;
  PointObj[] points = {};
  PointObj[] midPoints = {};
  PointObj[] projPoints = {};
  ArrayList<Branch> children = new ArrayList<Branch>();

  Branch(int lev, int n, PointObj[] p) {
    level = lev;
    num = n;
    points = p;
    midPoints = calcMidPoints();
    projPoints = calcProjPoints();

    if (level + 1 < maxLevels) {
      children.add(new Branch(level+1, 0, projPoints));
      for (int i = 0; i< points.length; i++) {
        int nexti = i-1;
        if (nexti<0) nexti+= points.length;
        PointObj[] newPoints = { projPoints[i], midPoints[i], points[i], midPoints[nexti], projPoints[nexti] };
        children.add(new Branch(level+1, i+1, newPoints));
      }
    }
  }

  void drawMe() {
    strokeWeight(5-level);
    for (int i = 0; i< points.length; i++) {
      int nexti = i+1;
      if (nexti == points.length) nexti = 0;
      line(points[i].x, points[i].y, points[nexti].x, points[nexti].y);
    }
    strokeWeight(0.5);
    fill(255, 150);
    for (int i = 0; i< midPoints.length; i++) {
      ellipse(midPoints[i].x, midPoints[i].y, 15, 15);
      line(midPoints[i].x, midPoints[i].y, projPoints[i].x, projPoints[i].y);
      ellipse(projPoints[i].x, projPoints[i].y, 15, 15);
    }

    for (Branch b : children) {
      b.drawMe();
    }
  }


  PointObj[] calcMidPoints() {
    PointObj[] mpArray = new PointObj[points.length];
    for (int i = 0; i< points.length; i++) {
      int nexti = i+1;
      if (nexti == points.length) nexti = 0;
      mpArray[i] = calcMidPoint(points[i], points[nexti]);
    }
    return mpArray;
  }

  PointObj calcMidPoint(PointObj a, PointObj b) {
    float mx, my;
    mx = (a.x + b.x)/2;
    my = (a.y + b.y)/2;
    return new PointObj(mx, my);
  }

  PointObj[] calcProjPoints() {
    PointObj[] spArray = new PointObj[midPoints.length];
    for (int i = 0; i< midPoints.length; i++) {
      int nexti = i+3;
      if (nexti >= midPoints.length) nexti -= midPoints.length;
      spArray[i] = calcProjPoint(midPoints[i], points[nexti]);
    }
    return spArray;
  }

  PointObj calcProjPoint(PointObj mp, PointObj op) {
    float px, py;
    float opp, adj;
    opp = op.x - mp.x;
    adj = op.y - mp.y;
    px = mp.x +  opp * sf;
    py = mp.y +  adj * sf;
    return new PointObj(px, py);
  }
}
