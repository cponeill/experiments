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
  
  PImage depth = context.depthImage();
  PImage rgb = context.rgbImage();
  
  image(depth, 0, 0);
  image(rgb, 640, 0);
}
