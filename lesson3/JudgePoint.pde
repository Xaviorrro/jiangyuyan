class JudgePoint {
  boolean white=false;//是不是遮罩部分
  boolean exist=false;//属不属于某一条线
  int x;
  int y;
  color c;

  JudgePoint(int x_, int y_) {
    x=x_;
    y=y_;
  }

  void display() {
    if (this.white==true&&this.exist==false) {
      fill(255);
      noStroke();
      rect(x, y, unitSize, unitSize);
    }
  }

  void buildings(int time) {
    int x=int(random(unitNum-2)+1);
    int y=int(random(unitNum-2)+1);
    int up=0;
    int down=0;
    JudgePoint a=judgePoint[x] [y];
    if (a.exist==false) {
      if (judgePoint[x-1][y].exist==false&&judgePoint[x+1][y].exist==false) {
        for (int i=1; i<unitNum-y; i++) {
          if (judgePoint[x] [y+i].exist==true) {
            up=i;
            break;
          }
        }
        for (int i=1; i<y-1; i++) {
          if (judgePoint[x] [y-i].exist==true) {
            down=i;
            break;
          }
        }
        setColor1();
        fill(c,time%1000);
        rect((x-1)*unitSize, (y-down)*unitSize, 4*unitSize, (up+down)*unitSize);
        setColor2();
        fill(c);
        rect(x*unitSize, y*unitSize, 2*unitSize, 3*unitSize);
      }
    }
  }
  void setColor1() {
    int a=int(random(100));
    if (a<40) {
      c=color(#E8451C);
    }
    if (a>=80) {
      c=color(#F5E102);
    }
    if (a<80&&a>=40) {
      c=color(#325FCE);
    }
  }

  void setColor2() {
    int a=int(random(100));
    if (a<20) {
     c=color(#FFC400);
    }
    if (a>=80) {
        c=color(#F5E102); 
    }
    if (a<80&&a>=20) {
      c=color(255);
    }
    //c=color(0);
  }
}
