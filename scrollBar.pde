Scrollbar bar1, bar2;
PFont font;

void setup() {
  size(100, 100);
  noStroke();
  bar1 = new Scrollbar(10, 35, 80, 10, 0.0, 100.0);
  bar2 = new Scrollbar(10, 55, 80, 10, 0.0, 1.0);
  font = loadFont("Courier-30.vlw");
  textFont(font);
  textAlign(CENTER);
}

void draw() {
  background(204);
  fill(0);
  int pos1 = int(bar1.getPos());
  text(nf(pos1, 2), 50, 30);
  float pos2 = bar2.getPos();
  text(nf(pos2, 1, 2), 50, 90);
  bar1.update(mouseX, mouseY);
  bar2.update(mouseX, mouseY);
  bar1.display();
  bar2.display();
}

void mousePressed() {
  bar1.press(mouseX, mouseY);
  bar2.press(mouseX, mouseY);
}
void mouseReleased() {
  bar1.release();
  bar2.release();
}

  class Scrollbar {
    int x, y;
    float sw, sh;
    float pos;
    float posMin, posMax;
    boolean rollover;
    boolean locked;
    float minVal, maxVal;
    
    Scrollbar(int xp, int yp, int w, int h, float miv, float mav) {
      x = xp;
      y = yp;
      sw = w;
      sh = h;
      minVal = miv;
      maxVal = mav;
      pos = x + sw/2 - sh/2;
      posMin = x;
      posMax = x + sw - sh;
    }
    
    void update(int mx, int my) {
      if(over(mx, my) == true) {
        rollover = true;
      } else {
        rollover = false;
      }
      if (locked == true) {
        pos = constrain(mx-sh/2, posMin, posMax);
      }
    }
    
    void press(int mx, int my) {
      if (rollover == true) {
        locked = true;
      } else {
        locked = false;
      }
    }
    
    void release() {
      locked = false;
    }
    
    boolean over(int mx, int my) {
      if ((mx > x) && (mx < x+sw) && (my > y) && (my < y+sh)) {
        return true;
      } else {
        return false;
      }
    }
    
    void display() {
      fill(255);
      rect(x, y, sw, sh);
      if ((rollover == true) || (locked == true)) {
        fill(0);
      } else {
        fill(102);
      }
      rect(pos, y, sh, sh);
    }
    
    float getPos() {
      float scalar = sw/(sw-sh);
      float ratio = (pos -x) * scalar;
      float offset = minVal + (ratio/sw * (maxVal-minVal));
      return offset;
    }
  }
