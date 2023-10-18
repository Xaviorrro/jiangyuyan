ArrayList<MyCircle> circles;
int maxRadius = 50;
int releasedCount = 0;
int colorNum;
color colorOfThis;
int brushWidth=30;
boolean drag=false;

int buttonX=100;
int buttonYellowY=100;
int buttonWhiteY=150;
int buttonBlackY=200;
int buttonBlueY=250;
int buttonBrownY=300;
int buttonWidth=50;
int buttonHeight=50;

int slider1X = 100;
int slider1Y = 800;
int slider1Width = 200;
int slider1Height = 20;

void setup() {
  size(1000, 1000);
  frameRate(20);
  circles = new ArrayList<MyCircle>();
}

void draw() {
  background(255);
  initiate();
  if (mousePressed&&drag==false) {
    MyCircle newCircle = new MyCircle(new PVector(mouseX, mouseY), brushWidth, releasedCount, colorOfThis);
    circles.add(newCircle);
  }
  for (int i = 0; i < circles.size(); i++) {
    MyCircle circle = circles.get(i);
    int speed = floor((circle.maxRadius - circle.radius) / 3);

    // 只有 releasedCount 等于圆的 released 属性时才继续扩大半径
    if (circle.radius < circle.maxRadius && circle.released == releasedCount) {
      circle.radius += speed;  // 半径增加的速度
    }

    boolean releaseBoolean=circle.released == releasedCount;
    // 显示圆
    circle.display(speed, releaseBoolean);
  }
}

void initiate(){
  fill(255);
  rect(buttonX, buttonWhiteY, buttonWidth, buttonHeight);
  fill(#FAA317);
  rect(buttonX, buttonYellowY, buttonWidth, buttonHeight);
  fill(0);
  rect(buttonX, buttonBlackY, buttonWidth, buttonHeight);
  rect(slider1X, slider1Y, slider1Width, slider1Height);
  textSize(24);
  String text="slide to control the brush width";
  text(text, 100, 850);
  text="press R to restart and press P to print the graphic";
  text(text, 100, 880);
  fill(#87C6E3);
  rect(buttonX, buttonBlueY, buttonWidth, buttonHeight);
  fill(#B4662A);
  rect(buttonX, buttonBrownY, buttonWidth, buttonHeight);
}


void mousePressed() {
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
    mouseY >= buttonYellowY && mouseY <= buttonYellowY + buttonHeight) {
    colorOfThis=color(#FAA317);
  }
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
    mouseY >= buttonWhiteY && mouseY <= buttonWhiteY + buttonHeight) {
    colorOfThis=color(255);
  }
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
    mouseY >= buttonBlackY && mouseY <= buttonBlackY + buttonHeight) {
    colorOfThis=color(0);
  }
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
    mouseY >= buttonBlueY && mouseY <= buttonBlueY + buttonHeight) {
    colorOfThis=color(#87C6E3);
  }
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
    mouseY >= buttonBrownY && mouseY <= buttonBrownY + buttonHeight) {
    colorOfThis=color(#B4662A);
  }
}

void mouseReleased() {
  drag=false;
  releasedCount++;
}

void mouseDragged() {
  if (mouseX >= slider1X && mouseX <= slider1X + slider1Width &&
    mouseY >= slider1Y && mouseY <= slider1Y + slider1Height) {
      drag=true;
    brushWidth = int(map(mouseX, slider1X, slider1X + slider1Width, 10, 70));
    if (mousePressed) {
      ellipse(mouseX, mouseY, brushWidth*2, brushWidth*2);
    } else {
      fill(255);
    }
  }
}

void keyPressed(){
 if (key=='p'||key=='P'){
   saveFrame();
 }
 if(key=='r'||key=='R'){
   circles=new ArrayList();
 }
}
