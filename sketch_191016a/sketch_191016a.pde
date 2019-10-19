 //<>// //<>//
BinaryTree fractal = new BinaryTree(200);

void setup() {

  size(400, 400);
  background(255);  
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
int nmax = 10;

void draw() {
  frameRate(5);
  background(255);
  fractal.axiom = it(fractal.axiom);
  fractal.display();
  
  n++;
  if (n > nmax) {
    noLoop();
  }
}
