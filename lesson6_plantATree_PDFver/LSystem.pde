class LSystem {
  String sentence;
  Rule[] ruleset;
  int generation;

  int[] weight_vector;
  ArrayList choice_vector =new ArrayList();
  int totalWeight;

  LSystem(String sentence_, Rule[] ruleset_, int[] weight_vec) {
    sentence=sentence_;
    ruleset=ruleset_;
    weight_vector=weight_vec;
    generation=0;
    generateRuleWeights();
    for (int eachWeight : weight_vector) {
      totalWeight += eachWeight;
    }
  }

  void generateRuleWeights() {
    int i_elements_quantity;
    for (int i=0; i < weight_vector.length; i++) {
      i_elements_quantity = weight_vector[i];
      for (int j=0; j<i_elements_quantity; j++) {
        choice_vector.add(i);
        //choice_vector根据权重储存数量不等的01234
      }
    }
  }

  int ruleNumber() {//符合权重比例地取一个随机的数
    int r;
    int rule_number;
    r = floor(random(0, choice_vector.size()));
    rule_number = (int)choice_vector.get(r);
    return rule_number;
  }

  void generate() {//按照权重生成字串
    int rule_number = 0;
    String nextgen="";
    for (int i = 0; i < sentence.length(); i++) {
      char curr = sentence.charAt(i);
      rule_number = ruleNumber();
      char a = ruleset[rule_number].getA();
      if (a == curr) {
        nextgen += ruleset[rule_number].getB();
      }else{
        nextgen+=curr;
      }
    }
    sentence = nextgen;
    generation++;
  }
  
  float[] getWeightedColor() {
    float[] finalColorArray = new float[3];
    float redWeighted = 0;
    float greenWeighted = 0;
    float blueWeighted = 0;
    for (int i=0; i < weight_vector.length; i++) {
      Rule currRule = ruleset[i];
      int currRuleWeight = weight_vector[i];
      redWeighted += currRule.getRuleColorR()*((float)currRuleWeight/totalWeight);
      greenWeighted += currRule.getRuleColorG()*((float)currRuleWeight/totalWeight); 
      blueWeighted += currRule.getRuleColorB()*((float)currRuleWeight/totalWeight);
    }
    finalColorArray[0] = redWeighted;
    finalColorArray[1] = greenWeighted;
    finalColorArray[2] = blueWeighted;
    //printArray(finalColorArray);
    return finalColorArray;
  }
}
