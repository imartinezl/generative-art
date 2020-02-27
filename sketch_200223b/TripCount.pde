class TripCount {

  Table table;

  ArrayList<Count> counts = new ArrayList<Count>();
  PVector pos = new PVector(100, height-100);
  PVector scl = new PVector(0.5, -1);

  TripCount(String file) {
    table = loadTable(file, "header");
    int id = 0;
    for (TableRow row : table.rows()) {
      String ts_date = row.getString("ts_date");
      int ts_num = row.getInt("ts_num");
      int count = row.getInt("count");

      Count c = new Count(id, ts_num, ts_date, count);
      c.init(pos, scl);
      counts.add(c);
      id++;
    }
  }

  void display(int t) {


    // coordinates
    stroke(0);
    strokeWeight(0.1);
    float h = 150, w = 500;
    line(pos.x, pos.y, pos.x + w, pos.y);
    line(pos.x, pos.y, pos.x, pos.y - h);


    
    Count pre = counts.get(0);
    boolean top = false;
    for (Count p : counts) {
      stroke(0);
      strokeWeight(0.1);
      float s = 0.001;
      line(pos.x + (t-pre.ts_num)*s, pre.y, pos.x + (t-p.ts_num)*s, p.y);
      pre = p;
      
      //stroke(255, 0, 0);
      //strokeWeight(2);
      //if (p.ts_num > t && !top) {
      //  //point(p.x, p.y);
      //  line(p.x, pos.y, p.x, p.y);
      //  top = true;
      //}
    }
  }
}

class Count {
  int id, ts_num, count;
  String ts_date;
  float x, y;



  Count(int id_, int ts_num_, String ts_date_, int count_) {
    id = id_;
    ts_num = ts_num_;
    ts_date = ts_date_;
    count = count_;
  }

  void init(PVector pos, PVector scl) {
    x = pos.x + scl.x*id;
    y = pos.y + scl.y*count;
  }
}
