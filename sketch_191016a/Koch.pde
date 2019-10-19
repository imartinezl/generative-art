class Koch {

  String axiom = "F";
  float x;
  Koch(float x_) {
    x = x_;
  }

  String rule(char c) {
    if (c == 'F') {
      return "F+F-F-F+F";
    } else {
      return str(c);
    }
  }

  
  void display() {
    background(255);
    strokeWeight(2);
    translate(x, height-x);
    for (char c : axiom.toCharArray()) {

      if (c == 'F') {
        line(0, 0, x, 0);
        translate(x, 0);
      } else if (c == '+') {
        rotate(-PI/2);
      } else if (c == '-') {
        rotate(PI/2);
      }
    }
    x = x / 2;
  }
}
