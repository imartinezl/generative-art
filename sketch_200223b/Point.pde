class Point implements Comparable<Point> {

  int id, t, chunk;
  float x, y;
  String date;

  Point(int id_, float x_, float y_, String date_, int t_, int chunk_) {
    id = id_;
    x = x_;
    y = y_;
    date = date_;
    t = t_;
    chunk = chunk_;
  }

  void display_point() {
    strokeWeight(1);
    stroke(0, 0, 0, 50);
    point(x, y);
  }
  
  void display_line(Point p){
    strokeWeight(1);
    stroke(255, 0, 0, 50);
    if (this.id == p.id) {
      line(p.x, p.y, this.x, this.y);
    }
  }
  
  

  @Override
    int compareTo(Point other) {
    return this.id - other.id;
  }
}
