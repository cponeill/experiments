int stepX;
int stepY;

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  colorMode(HSB, width, height, 100);
  stepX = mouseX+2;
  stepY = mouseY+2;
  
  for (int y = 0; y < height; y += stepY) {
    for (int x = 0; x < width; x += stepX) {
      fill(x, height-y, 100);
      ellipse(x, y, stepX, stepY);
    }
  }
}
