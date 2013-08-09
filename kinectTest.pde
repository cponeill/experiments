import SimpleOpenNI.*;
SimpleOpenNI context;

void setup() {
  size(640*2, 480);
  context = new SimpleOpenNI(this);
  context.enableDepth();
  context.enableRGB();
}
  
void draw() {
  context.update();
  
  image(context.depthImage(), 0, 0);
  image(context.rgbImage(), 640, 0);
}
