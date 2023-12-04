import controlP5.*;

ControlP5 cp5;
float detectRange;
float selectedLetterValue;

PGraphics tContext;

Cell[] cells;

char selectedLetter;
float attract;

float WrapValue(float n, float mod) {
  return (n + mod) % mod;
}

void setup() {
  size(800, 800);
  background(0);
  cells=new Cell[3000];
  for (int i = 0; i < cells.length; i++) {
    cells[i]=new Cell(random(width), random(height));
  }

  cp5 = new ControlP5(this);

  cp5.addSlider("detectController")
    .setPosition(50, 50)
    .setSize(200, 20)
    .setRange(20, 100)
    .setValue(30);

  cp5.addSlider("selectLetter")
    .setPosition(50, 100)
    .setSize(200, 20)
    .setRange(65, 90)
    .setValue(65);

  cp5.addSlider("attract")
    .setPosition(550, 100)
    .setSize(200, 20)
    .setRange(0.05, 0.5)
    .setValue(0.3);
}


void draw() {
  fill(0, 5);//渐变效果
  noStroke();
  rect(0, 0, width, height);
  drawCells(cells);
  loadPixels();

  createLetter();


  for (int i = 0; i < cells.length; i++) {
    cells[i].update();
  }

  updatePixels();//新增
  blendMode(MULTIPLY);
  image(tContext, 0, 0);
  blendMode(BLEND);


  fill(255);
  textAlign(LEFT, TOP);
   PFont FontChinese = createFont("微软雅黑", 20);
   textFont(FontChinese);
  text("探测深度：" + detectRange, 50, 150);
  text("选择字母：" + selectedLetter, 50, 180);
  text("排斥/吸引程度：" + attract, 50, 210);
   text("点击吸引，不点击排斥", 50, 240);
}

void controlEvent(ControlEvent event) {
  if (event.isController()) {
    if (event.getName().equals("detectController")) {
      detectRange = event.getController().getValue();
    } else if (event.getName().equals("selectLetter")) {
      selectedLetterValue = event.getController().getValue();
    } else if (event.getName().equals("attract")) {
      attract= event.getController().getValue();
    }
  }
}

void createLetter() {
  PFont myFont = createFont("Britannic Bold", 32);

  tContext = createGraphics(width, height);
  tContext.beginDraw();
  tContext.background(0);
  tContext.fill(255, 240);
  tContext.textAlign(CENTER);
  tContext.textFont(myFont);
  tContext.textSize(height);
  selectedLetter=char(int(selectedLetterValue));
  tContext.text(selectedLetter, width * 0.5, height * 0.8);
  tContext.endDraw();//生成黑底白字的字母储存在tcontext中
}

void drawCells(Cell[] c) {
  fill(255, 255, 0);
  noStroke();
  for (int i = 0; i < c.length; i++) {
    ellipse(c[i].pos.x, c[i].pos.y, c[i].size, c[i].size);
  }
}
