ArrayList<ColorStripe1> cs1s;
ArrayList<ColorStripe0> cs0s;
ArrayList<Building> buildings=new ArrayList<Building>();
int stripeCount = 1;//已经画到第几条线
int unitSize = 20;//小方格边长
int unitNum=800/unitSize;//number of units of a stripe
JudgePoint[][] judgePoint= new JudgePoint[unitNum][unitNum];
int countNum;//计"出来了n个格子了
int iterTick = 5;//计时用：几帧画一个格子

void setup() {
  size(800, 800);
  background(255);
  fill(255,255,0);
  initiate();
}

void initiate() {
  //导入unitsize

  //导入判定点
  for (int i=0; i<unitNum; i++) {
    for (int j=0; j<unitNum; j++) {
      judgePoint[i][j]=new JudgePoint(i*unitSize, j*unitSize);
    }
  }
  cs1s = new ArrayList<ColorStripe1>();
  cs0s = new ArrayList<ColorStripe0>();
  for (int k=0; k<20; k++) {
    generate();
  }
}

void generate() {
  //生成线条
  int direct=int(random(2));
  if (direct==1) {//生成纵向线，并标记来过
    int number=int((map(randomGaussian(), -1, 1, 400, 1200)%height))/unitSize;

    cs1s.add(new ColorStripe1(unitSize, number*unitSize));
    //标记来过、是否被遮盖
    boolean Switch=true;
    for (int i=0; i<unitNum; i++) {
      if (judgePoint[number][i].exist==true&&randomPercent(90)==false) {
        Switch=!Switch;
        continue;
      }
      if (judgePoint[number][i].exist==false) {
        if (Switch==false) {
          judgePoint[number][i].white=true;
        } else {
          judgePoint[number][i].exist=true;
        }
      }
    }
  } else {//横向线，出现在两侧的多一些
    int number=int((map(randomGaussian(), -1, 1, 400, 1200)%width))/unitSize;
    cs0s.add(new ColorStripe0(unitSize, number*unitSize));
    boolean Switch=true;
    for (int i=0; i<unitNum; i++) {
      if (judgePoint[i][number].exist==true&&randomPercent(90)==false) {
        Switch=!Switch;
        //continue;
      }
      if (judgePoint[i][number].exist==false) {
        if (Switch==false) {
          judgePoint[i][number].white=true;
        } else {
          judgePoint[i][number].exist=true;
        }
      }
    }
  }
}

void draw() {
  background(255);
  for (int i=0; i<buildings.size(); i++) {
    buildings.get(i).display(millis());
    println(buildings.get(i).up,buildings.get(i).down,buildings.get(i).useful);
  }

  for (int idx = 0; idx < cs1s.size(); idx ++) {
    cs1s.get(idx).drawStripe(stripeCount);
  }
  for (int idx = 0; idx < cs0s.size(); idx ++) {
    cs0s.get(idx).drawStripe(stripeCount);
  }
  for (int i=0; i<unitNum; i++) {
    for (int j=0; j<unitNum; j++) {
      judgePoint[i][j].display();
    }
  }

  if (stripeCount%30==0) {
    buildings.add(new Building());
  }

  //计时
  if (countNum/iterTick>0) {
    stripeCount ++;
    countNum = 0;
  }

  countNum ++;
  saveFrame();
}

boolean randomPercent(int percent) {
  int a=int(random(100));
  if (a>percent) {
    return false;
  } else {
    return true;
  }
}

void keyPressed() {
  if (key=='p') {
    initiate();
  }
}
