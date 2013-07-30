int numLines = 500;
MovingLine[] lines = new MovingLine[numLines];
int currentLine = 0;

void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  for (int i = 0; i < numLines; i++) {
    lines[i] = new MovingLine();
  }
}

void draw() {
  background(204);
  for (int i = 0; i < currentLine; i++) {
    lines[i].display();
  }
}

void mouseDragged() {
  lines[currentLine].setLines(mouseX, mouseY, pmouseX, pmouseY);
  if (currentLine < numLines - 1) {
    currentLine++;
  }
}

class MovingLine {
  float x1, y1, x2, y2;
  float a = -1.0;
  float b = 1.0;
  
  void setLines(int x, int y, int px, int py) {
    x1 = x;
    y1 = y;
    x2 = px;
    y2 = py;
  }
  
  void display() {
    x1 += random(a, b);
    y1 += random(a, b);
    x2 += random(a, b);
    y2 += random(a, b);
    ellipse(x1, y1, x2, y2);
  }
}
