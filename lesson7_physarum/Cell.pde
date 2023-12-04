class Cell {
  PVector pos;
  float dirAngle;
  PVector dir;
  float angle=PI/6;
  float size=5;
  PVector attraction;
  float speed=2.5;

  Cell(float x_, float y_) {
    pos=new PVector(x_, y_);
    dirAngle = random(TWO_PI);
  }

  void update() {
    setAttraction();
    smell();
    move();
  }

  void setAttraction() {
    PVector mousePos=new PVector(mouseX, mouseY);
    if (mousePressed==true) {
      attraction=PVector.sub(mousePos, pos);//指向或排斥鼠标的attraction
    } else {
      attraction=PVector.sub(pos, mousePos);
    }
    if (attraction.mag()<100) {
      dirAngle=dirAngle*(1-attract)+attraction.heading()*attract;
    }
  }

  void smell() {
    float F, FL, FR;

    int cXIndex = floor(WrapValue(pos.x+detectRange*cos(dirAngle), width));
    int cYIndex = floor(WrapValue(pos.y+detectRange*sin(dirAngle), height));

    int cIndex = (cXIndex + cYIndex*width);
    F = (pixels[cIndex]);
    println("F: " + F);


    int lXIndex = floor(WrapValue(pos.x+detectRange*cos(dirAngle-angle), width));
    int lYIndex = floor(WrapValue(pos.y+detectRange*sin(dirAngle-angle), height));

    int lIndex = (lXIndex + lYIndex*width);
    FL = (pixels[lIndex]);


    int rXIndex = floor(WrapValue(pos.x+detectRange*cos(dirAngle+angle), width));
    int rYIndex = floor(WrapValue(pos.y+detectRange*sin(dirAngle+angle), height));

    int rIndex = (rXIndex + rYIndex*width);
    FR = (pixels[rIndex]);


    if (FL < FR) {
      dirAngle+=angle;
      //println("turn left");
    } else if (FR < FL) {
      dirAngle-=angle;
      //println("turn right");
    }
  }


  void move() {
    this.pos.x += cos(dirAngle)*speed;
    this.pos.y += sin(dirAngle)*speed;
    this.pos.x = WrapValue(this.pos.x, width);
    this.pos.y = WrapValue(this.pos.y, height);
    pixels[floor(pos.x)+floor(pos.y)*width] = color(255, 255, 255);
  }
}
