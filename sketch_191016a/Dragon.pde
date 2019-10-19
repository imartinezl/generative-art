class Dragon{
  
  String axiom = "FX";
  float s, a;
  Dragon(float s_, float a_) {
    s = s_;
    a = a_;
  }

  String rule(char c) {
    if (c == 'X') {
      return "X+YF+";
    } else if (c == 'Y') {
      return "-FX-Y";
    } else {
      return str(c);
    }
  }

  void display() {
    background(255);
    translate(width/2, height/2);
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
    s = s / 1.5;
  }
}
  
  
