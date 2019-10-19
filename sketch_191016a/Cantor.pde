class Cantor {

  String axiom = "A";
  float x, y_incr;
  float y = 0;
  Cantor(float x_, float y_incr_) {
    x = x_;
    y_incr = y_incr_;
  }

  String rule(char c) {
    if (c == 'A') {
      return "ABA";
    } else if (c == 'B') {
      return "BBB";
    }
    return "";
  }

  void display() {
    //background(255);
    noStroke();
    pushMatrix();
    translate(0, y);
    for (char c : axiom.toCharArray()) {
      if (c == 'A') {
        rect(0, 0, x, y_incr/2);
        translate(x, 0);
      } else if (c == 'B') {
        translate(x, 0);
      }
    }
    popMatrix();
    x = x / 3;
    y += y_incr;
  }
}
