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

void process(String line) {
  String[] pieces = split(line, ",");
  id = int(pieces[0]);
  x = float(pieces[1]);
  y = float(pieces[2]);
  date = pieces[3];
  t = int(pieces[4]);
  x = x*width;
  y = (1-y)*height;
  points.add(new Point(id, x, y, date, t, chunk));
  if(points.size() > n_max){
    points.remove(0);
  }
}


void display_path() {
  strokeWeight(1);
  stroke(0, 0, 0, 50);
  point(x, y);
}

void display_date() {
  PVector p = new PVector(50, 50);
  // rectangle
  fill(255, 0, 0);
  noStroke();
  rect(p.x, p.y, 120, 11);

  // date
  fill(0);
  textSize(10);
  textAlign(LEFT, TOP);
  String t_date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(t_start*1000L); 
  text(t_date, p.x, p.y);
}
