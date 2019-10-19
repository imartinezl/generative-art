 //<>// //<>//
//BinaryTree fractal = new BinaryTree(200);
//Cantor fractal = new Cantor(400, 40);
Koch fractal = new Koch(30);

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
int nmax = 5;

void draw() {
  frameRate(5);

  fractal.axiom = it(fractal.axiom);
  fractal.display();
  
  n++;
  if (n > nmax) {
    noLoop();
  }
}
