import java.util.Collections; //<>//

Track track;
int t_start, t_step = 1*60;

void setup() {
  size(800, 800);
  background(255);

  track = new Track("bikes_path.csv");
  track.init();
  t_start = floor(track.lastTime()/t_step)*t_step;
}


void draw() {
  background(255);
  display_date(t_start);
  while (track.lastTime() < t_start + t_step) {
    track.next();
  }
  track.update();
  t_start = t_start + t_step;
}


String readline(BufferedReader reader) {
  String line;
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  return line;
}
