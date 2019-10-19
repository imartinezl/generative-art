class Sierpinski {

  String axiom = "F-G-G";
  float s, a;
  Sierpinski(float s_, float a_) {
    s = s_;
    a = a_;
  }

  String rule(char c) {
    if (c == 'F') {
      return "F-G+F+G-F";
    } else if (c == 'G') {
      return "GG";
    } else {
      return str(c);
    }
  }

  void display() {
    background(255);
    translate(30, height);
    for (char c : axiom.toCharArray()) {
      if (c == 'F' || c == 'G') {
        line(0, 0, 0, -s);
        translate(0, -s);
      } else if (c == '+') {
        rotate(radians(-a));
      } else if (c == '-') {
        rotate(radians(a));
      } 
    }
    s = s / 2;
  }
}
