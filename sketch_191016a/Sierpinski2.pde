class Sierpinski2 {

  String axiom = "A";
  float s, a;
  Sierpinski2(float s_, float a_) {
    s = s_;
    a = a_;
  }

  String rule(char c) {
    if (c == 'A') {
      return "B-A-B";
    } else if (c == 'B') {
      return "A+B+A";
    } else {
      return str(c);
    }
  }

  void display() {
    background(255);
    translate(0, height-10);
    for (char c : axiom.toCharArray()) {
      if (c == 'A' || c == 'B') {
        line(0, 0, s, 0);
        translate(s, 0);
      } else if (c == '+') {
        rotate(radians(-a));
      } else if (c == '-') {
        rotate(radians(a));
      } 
    }
    s = s / 2;
  }
}
