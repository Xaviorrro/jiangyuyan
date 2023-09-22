float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(600, 600);
}

void draw() {
r=random(0,255);
g=random(0,255);
b=random(0,255);
a=random(0,255);

x=random(0,width);
y=random(0,height);
diam=random(20,80);

noStroke();
fill(r,g,b,a);
ellipse(x,y,diam,diam);

}
