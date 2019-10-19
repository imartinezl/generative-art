class Algae {

  String axiom = "A";
  
  Algae(String axiom_) {
    axiom = axiom_;
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
