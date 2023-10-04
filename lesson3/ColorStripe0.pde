class ColorStripe0 {
  int unitNum;//number of units of a stripe
  int y;
  int count=0;
  color[] stripeColorPallette; //color pallette
  color c;

  ColorStripe0(int num, int y_) {
    unitSize = num;//改成直接读取unitsize就行
    y=y_;
    unitNum=width/unitSize;
    generatePallette();
  }

  //一次性生成完这一条的颜色
  void generatePallette() {
    stripeColorPallette = new color[unitNum];
    for (int idx = 0; idx < unitNum; idx ++) {
      setColor();
      stripeColorPallette[idx] = c;
    }
  }

  void setColor() {
    int a=int(random(100));
    if (a<70) {
      c=color(#FFC400);
    }
    if (a>90) {
      c=color(#E8451C);
    }
    if (a<80&&a>70) {
      c=color(#5968E3);
    }
    if (a>=80&&a<=90){
     c=color(250); 
    }
  }

  void drawStripe(int count_) {
    count=count_;
    for (int idx = 0; idx < count; idx ++) {
      fill(stripeColorPallette[(count-1-idx)%unitNum]);
      noStroke();
      rect(unitSize*idx, y, unitSize, unitSize);
    }
  }
}
