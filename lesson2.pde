float[][][] xArchor = new float[51][41][2];

int beiShu=-3;
color red = color(255, 100, 100);
color yellow = color(255, 255, 100);
color blue = color(20, 150, 255);
int[] COLOR = { red, yellow, blue };

int count = 0;

void setup() {
  size(1200, 800);
  frameRate(15);

  noFill();
  strokeWeight(10);
  background(255);

  //生成第一条线的点
  for (int i = 0; i<41; i++) {
    xArchor[0][i][0]=beiShu*40;
    xArchor[0][i][1]=random(0, 60);
    beiShu+=1;
    //i:[0~40]
  }

  //接着画j条线，每条线都和前一条略有偏差，并趋近直线
  for (int j = 1; j<51; j++) {
    for (int i = 1; i<40; i++) {
      //因为第0个数据取不到所以单独设置
      if (i==1) {
        xArchor[j][0][1]=xArchor[j-1][0][1]+13;
      }
      //下一条线的坐标设置
      xArchor[j][i][0]=xArchor[j-1][i][0]+random(-3, 3);
      xArchor[j][i][1]=xArchor[j-1][i][1]*3/4+(xArchor[j-1][i-1][1]+xArchor[j-1][i+1][1])/8+13+random(-4, 4);
    }
  }

}

void draw() {
  if (count<xArchor.length) {
    stroke(COLOR[count%3]);
    beginShape();
    for (int t = 0; t<41; t++) {
      curveVertex(xArchor[count][t][0], xArchor[count][t][1]);
    }
    endShape();
  }
  count++;
saveFrame();
}
