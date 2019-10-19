

void setup() {
  

  
  println(axiom);
  String result = it(axiom);
  println(result);
  

}

String it(String axiom){
  ArrayList<String> str = new ArrayList<String>();
  for(char c: axiom.toCharArray()){
    if(c == 'A'){
      str.add("AB");
    }else if(c == 'B'){
      str.add("A");
    }
  }
  String result = "";
  for (String s : str)
  {
      result += s;
  }
  return result;
}

String axiom = "A";
void draw() {
  
  frameRate(1);
  axiom = it(axiom);
  println(axiom);
  
}
