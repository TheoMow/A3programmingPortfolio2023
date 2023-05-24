class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;
  // constructor
  Button(int x, int y, int w, int h, char val) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.val = val;
    c1 = color(128);
    c2= color(190);
    on = false;
  }


  void display() {
    if (on) {
    fill(c2);
    } else {
    fill(c1);
    }
    rectMode(CENTER);
    fill(random(255),random(255),random(255));
    rect(x,y,w,h,100);
    fill(random(255),random(255),random(255));
    textSize(20);
    textAlign(CENTER);
    text(val,x,y+7);
  }

  void hover(int mx, int my) {
    on = (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2);
  }
}
