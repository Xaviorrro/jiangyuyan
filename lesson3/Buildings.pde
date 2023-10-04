class Building {
    int x=int(random(unitNum-2)+1);
    int y=int(random(unitNum-2)+1);
  int time;
  int up;
  int down;
  color c1;
  color c2=color(255);
  boolean useful=true;

  Building() {
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
        fill(c1, (time*5)%1000);
        rect((x-1)*unitSize, (y-down)*unitSize, 4*unitSize, (up+down)*unitSize);
        setColor2();
        fill(c2, (time*5)%1000);
        rect(x*unitSize, y*unitSize, 2*unitSize, 3*unitSize);
      }
    } else {
      useful=false;
    }
  }

  void display(int now_) {
    time=now_;
    if (useful==true) {
      fill(c1, 255*abs(sin(time*0.001)));
      rect((x-1)*unitSize, (y-down)*unitSize, 4*unitSize, (up+down)*unitSize);
      fill(c2, 255*abs(sin(time*0.001)));
      rect(x*unitSize, y*unitSize, 2*unitSize, 3*unitSize);
    }
  }

  void setColor1() {
    int a=int(random(100));
    if (a<40) {
      c1=color(#E8451C);
    }
    if (a>=80) {
      c1=color(#F5E102);
    }
    if (a<80&&a>=40) {
      c1=color(#325FCE);
    }
  }
  void setColor2() {
    int a=int(random(100));
    if (a<20) {
      c2=color(#FFC400);
    }
    if (a>=80) {
      c2=color(#F5E102);
    }
    if (a<80&&a>=20) {
      c2=color(255);
    }
    //c2=color(0);
  }
}
