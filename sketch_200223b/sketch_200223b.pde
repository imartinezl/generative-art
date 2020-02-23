import java.util.Collections; //<>//

BufferedReader reader;
int id, n_max = 20000, chuck_max = 30;
float x, y;
String date, line;
int t, t_start, t_step = 1*60;
ArrayList<Point> points = new ArrayList<Point>();

void setup() {
  size(600, 600);
  background(255);

  reader = createReader("temp.csv");
  String header = readline(reader);
  println(header);

  line = readline(reader);
  process(line);
  //display_path();

  println(t);
  t_start = floor(t/t_step)*t_step;
}

int chunk = 0;
void draw() {
  background(255);
  //frameRate(5);
  
  display_date();
  while (t < t_start + t_step) {
    line = readline(reader);
    if (line == null) {
      println("finish");
      noLoop();
      break;
    } else {
      process(line);
      //display_path();
    }
  }

  Collections.sort(points);
  if (points.size() > 0) {
    Point prev = points.get(0);
    for (Point p : points) {
      p.display_line(prev);
      prev = p;
    }
    println(points.size());
    removePoints();
  }
  chunk++;
  t_start = t_start + t_step;
}

void removePoints() {
  for (int i=points.size()-1; i >= 0; i--) {
    if (chunk - points.get(i).chunk > chuck_max) {
      points.remove(i);
    }
  }
}

void removePoints_tmp() {

  IntDict dir = new IntDict();
  for (int i=points.size()-1; i >= 0; i--) {
    String id = str(points.get(i).id);
    if (dir.hasKey(id)) {
      dir.set(id, dir.get(id) + 1);
      points.remove(i);
    } else {
      dir.set(id, 1);
    }
  }
}
