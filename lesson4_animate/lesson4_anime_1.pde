PImage[] frames;
int frameWidth = 300;
int frameHeight = 300; 

int gridSpacing = 5; // 栅格间距
int count = 0; 

void setup() {
  size(300, 300);
  background(255);
  
  // 加载PNG帧
  frames = new PImage[10];
  for (int i = 0; i < frames.length; i++) {
    frames[i] = loadImage(i + ".png");
  }
}

void draw() {
  int frameIndex = count % frames.length;
  int startX = count * gridSpacing;
  PImage frame = frames[frameIndex].get(startX, 0, gridSpacing, frameHeight);
  
  image(frame, count*gridSpacing, 0);
  
  count++;
}

void mousePressed(){
 saveFrame(); 
}
