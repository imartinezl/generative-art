 //<>// //<>//
//Algae fractal = new Algae();
//BinaryTree fractal = new BinaryTree(200);
//Cantor fractal = new Cantor(400, 40);
//Koch fractal = new Koch(30);
//Sierpinski fractal = new Sierpinski(400, 120);
//Sierpinski2 fractal = new Sierpinski2(400, 60);
//Dragon fractal = new Dragon(400, 90);
Plant fractal = new Plant(150, 25);

void setup() {

  size(400, 400);
  fractal.display();
}

String it(String axiom) {
  ArrayList<String> str = new ArrayList<String>();
  for (char c : axiom.toCharArray()) {
    str.add(fractal.rule(c));
  }
  String result = "";
  for (String s : str)
  {
    result += s;
  }
  return result;
}

int n = 0;
int nmax = 6;

void draw() {
  frameRate(5);

  fractal.axiom = it(fractal.axiom);
  fractal.display();

  n++;
  if (n > nmax) {
    noLoop();
  }
}
