class Rule {
  char a;
  String b;
  int[] ruleColor;

  Rule(char a_, String b_,  int[] ruleColor_) {
    a = a_;
    b = b_; 
    ruleColor = ruleColor_;
  }

  char getA() {
    return a;
  }

  String getB() {
    return b;
  }

  int[] getRuleColor() {
    return ruleColor;
  }
  
  int getRuleColorR() {
    return ruleColor[0];
  }
  
  int getRuleColorG() {
    return ruleColor[1];
  }
  
  int getRuleColorB() {
    return ruleColor[2];
  }
}
