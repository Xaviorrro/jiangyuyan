class MyCircle {
  PVector position;
  int radius;
  int released;
  int speed;
  int maxRadius;
  color c;
  boolean release=false;
  ArrayList<PVector> lastTime;

  MyCircle(PVector position, int maxRadius, int released,color c_) {
    this.position = position;
    this.radius = 0;
    this.maxRadius=maxRadius;
    this.released = released;
    c=c_;
  }

  void display(int speed_,boolean release_) {
    speed=speed_;
    release=release_;
    fill(c, 40);
    noStroke();
    float angleStep = TWO_PI / 12;  // 每个点之间的角度差
    float angleOffset = random(TWO_PI);  // 角度偏移量，用于生成不同的形状

    if (speed!=0 && release==true) {
      lastTime=new ArrayList<PVector>();
      beginShape();
      for (float angle = 0; angle < TWO_PI; angle += angleStep) {
        float radiusNoise = noise(this.position.x + cos(angle + angleOffset), this.position.y + sin(angle + angleOffset));
        float radius = map(radiusNoise, 0, 1, this.radius, this.radius * 2);  // 通过映射将噪声值转换为半径大小
        float x = this.position.x + radius * cos(angle);
        float y = this.position.y + radius * sin(angle);
        curveVertex(x, y);
        PVector temp=new PVector(x,y);
        lastTime.add(temp);
      }
      endShape();
    }else{
      beginShape();
      for (int i=0;i<lastTime.size();i++) {
        curveVertex(lastTime.get(i).x, lastTime.get(i).y);
      }
      endShape();
    }
  }
}
