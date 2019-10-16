

void setup() {
}

void draw() {
}

void dragonCurve(float order, float len) {
  rotate(order * 45);
  dragonCurveRecursive(order, len, 1);
}

void dragonCurveRecursive(float order, float len, float sign):
if (order == 0) {
  //drawLine(length);
} else {
  rootHalf = (1 / 2) ** (1 / 2);
  dragonCurveRecursive(order - 1, len * rootHalf, 1);
  rotate(sign * -90);
  dragonCurveRecursive(order - 1, len * rootHalf, -1);
}
}
