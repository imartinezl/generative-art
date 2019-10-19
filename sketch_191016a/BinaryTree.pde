class BinaryTree {

  String axiom = "0";
  float s;
  
  BinaryTree(float s_) {
    s = s_;
  }

  String rule(char c) {
    if (c == '0') {
      return "1[0]0";
    } else if (c == '1') {
      return "11";
    } else {
      return str(c);
    }
  }
  void display() {
    background(255);
    translate(width/2, height);
    for (char c : axiom.toCharArray()) {
      if (c == '0') {
        line(0, 0, 0, -s);
        translate(0, -s);
      } else if (c == '1') {
        line(0, 0, 0, -2*s);
        translate(0, -2*s);
      } else if (c == '[') {
        pushMatrix();
        rotate(radians(-45));
      } else if (c == ']') {
        popMatrix();
        rotate(radians(45));
      }
    }
    s = s / 2;
  }
}
