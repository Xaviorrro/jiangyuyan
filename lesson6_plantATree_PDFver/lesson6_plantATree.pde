import processing.pdf.*;
int pageCounter=0;

Rule[] ruleset = new Rule[5];
LSystem lstm;
int[] weight_vector=new int[5];//权重数据
int countLimit=5;
String[] gens = new String[countLimit];//每一次生成的字串存储

int counter=0;
int clicktime;
int settime=500;//多少毫秒长一次

int setX;
int setY;//树的XY坐标
boolean shouldRedraw=false;
boolean shouldRedrawSwitch=true;
boolean drag=false;

int buttonX=200;
int buttonY=1200;
int buttonWidth=200;
int buttonHeight=50;

int slider1X = 200;
int slider1Y = 1300;
int slider1Width = 400;
int slider1Height = 30;

int len=height/3;
float r=radians(25);
float[] black=new float[3];
Turtle thisSecond=new Turtle("F", len, r, black);

void setup() {
  size(2500, 1600,PDF,"record.pdf");
  //fullScreen();
  background(255, 239, 206);

  int[][] ruleColors = {{31, 92, 84}, {97, 145, 102}, {48, 69, 71}, {197, 114, 0}, {74, 99, 94}};
  setX=width/2;
  setY=height/2;

  ruleset[0] = new Rule('F', "F[+F]+[+F-F-F]-F[-F][-F-F]", ruleColors[0]);
  ruleset[1] = new Rule('F', "FF[+FF][-F+F][FFF]F", ruleColors[1]);
  ruleset[2] = new Rule('F', "F[+FF][-FF]F[-F][+F]F", ruleColors[2]);
  ruleset[3] = new Rule('F', "F[+F]+[-F-F]-FF[-F-F][-F][F]", ruleColors[3]);
  ruleset[4] = new Rule('F', "FF+[+F-F-F]-[-F+F+F]", ruleColors[4]);
  newTree();
}

void draw() {
  PGraphicsPDF pdf = (PGraphicsPDF) g;
  initiate();
  if (shouldRedraw==true) {
    background(255, 239, 206);
  }
  if ((millis()-clicktime)>=settime) {
    background(255, 239, 206);
    clicktime+=settime;
    counter++;
    if (counter==4) {
      noLoop();
    }
    translate(setX, height);
    rotate(-PI/2);
    thisSecond.len=setY/3/pow(2, counter);
    thisSecond.todo=gens[counter];
    thisSecond.turtle();
     pdf.nextPage();
     pageCounter++;
  }
  shouldRedraw=false;
 
  if(pageCounter==4){
   exit(); 
  }
}

void mousePressed() {
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth &&
    mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
    shouldRedrawSwitch=!shouldRedrawSwitch;
  } else if (mouseX >= slider1X && mouseX <= slider1X + slider1Width &&
    mouseY >= slider1Y && mouseY <= slider1Y + slider1Height) {
    noLoop();
  } else {
    setX=mouseX;
    clicktime=millis();
    counter=0;
    newTree();
    if (shouldRedrawSwitch==true) {
      shouldRedraw=true;
    }
    loop();
  }
}




void newTree() {
  background(255, 239, 206);
  
  //初始化权重系统
  for (int i=0; i<5; i++) {
    weight_vector[i]=floor(random(101));
  }

  printArray(weight_vector);

  LSystem lstm=new LSystem("F", ruleset, weight_vector);

  //在gen[]中储存每一次的字串
  for (int i=0; i<countLimit; i++) {
    lstm.generate();
    gens[i]=lstm.sentence;
  }

  //导入颜色串至turtle中
  thisSecond.colorArray=lstm.getWeightedColor();
}


void initiate() {
  noStroke();
  fill(255);
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  textSize(40);
  String text="height of the tree is "+str(setY);
  text(text, 200, 1370);
  text="click to switch between'single tree'and 'trees'";
  text(text, 200, 1180);
  rect(slider1X, slider1Y, slider1Width, slider1Height);
}

void mouseDragged() {
  if (mouseX >= slider1X && mouseX <= slider1X + slider1Width &&
    mouseY >= slider1Y && mouseY <= slider1Y + slider1Height) {
    drag=true;
    setY = int(map(mouseX, slider1X, slider1X + slider1Width, height/5, height/3*2));
  }
}
