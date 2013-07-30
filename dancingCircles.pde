float x1, y1, x2, y2;
float a = -1.5;
float b = 1.5;
float c = 30;
float d = 225;

void setup() {
  size(300, 300);
  smooth();
  x1 = width / 2.0;
  y1 = x1;
  x2 = width - x1;
  y2 = x2;
  c = width / 2.0;
  d = width / 2.0;
}

void draw() {
  background(0);
  x1 += random(a, b);
  y1 += random(a, b);
  x2 += random(a, b);
  y2 += random(a, b);
  c += random(a, b);
  d += random(a, b);
  fill(242, 101, 202, 88);
  ellipse(x1, y1, x2, y2);
  ellipse(c, c, c, c);
  ellipse(d, c, c, c);
}
