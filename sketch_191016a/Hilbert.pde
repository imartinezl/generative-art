class Hilbert{
  
  String axiom = "FR";
  float s, a;
  Hilbert(float s_, float a_) {
    s = s_;
    a = a_;
  }

  String rule(char c) {
    if (c == 'L') {
      return "+RF-LFL-FR+";
    } else if (c == 'R') {
      return "-LF+RFR+FL-";
    } else {
      return str(c);
    }
  }

  void display() {
    background(255);
    translate(0, height);
    for (char c : axiom.toCharArray()) {
      if (c == 'F') {
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
  
  
