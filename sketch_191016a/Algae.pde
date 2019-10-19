class Algae {

  String axiom = "A";
  
  Algae() {
    
  }

  String rule(char c) {
    if (c == 'A') {
      return "AB";
    } else if (c == 'B') {
      return "A";
    } else {
      return "";
    }
  }
  
  void display(){
    
  }
}
