class ColorStripe1 {
  int unitNum;//有几个方格组成（纵向）
  int x;
  int count=0;
  color[] stripeColorPallette; //color pallette
  color c;

  ColorStripe1(int num, int x_) {
    unitSize = num;//改成直接读取unitsize就行
    x=x_;
    unitNum=height/unitSize;
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
      rect(x, unitSize*idx, unitSize, unitSize);
    }
  }
}
