class Plant{
  
  String axiom = "X";
  float s, a;
  Plant(float s_, float a_) {
    s = s_;
    a = a_;
  }

  String rule(char c) {
    if (c == 'X') {
      return "F+[[X]-X]-F[-FX]+X";
    } else if (c == 'F') {
      return "FF";
    } else {
      return str(c);
    }
  }

  void display() {
    background(255);
    translate(width/2, height);
    for (char c : axiom.toCharArray()) {
      if (c == 'F') {
        line(0, 0, 0, -s);
        translate(0, -s);
      } else if (c == '+') {
        rotate(radians(-a));
      } else if (c == '-') {
        rotate(radians(a));
      } else if (c == '[') {
        pushMatrix();
      } else if (c == ']') {
        popMatrix();
      } 
    }
    s = s / 2;
  }
}
  
  
