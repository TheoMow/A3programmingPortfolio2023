class Rock {
  int x, y, diam, speed;
  PImage rock;

  Rock() {
    x= int(random(width));
    y = -50;
    diam = int(random(90, 130));
    speed = int(random(2, 10));
    rock = loadImage("rock2.png");
  }
  void display() {
    rock.resize(diam, diam);
    imageMode(CENTER);
    image(rock, x, y);
  }
  void move() {
    y += speed;
  }
  boolean reachBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect() {
    return true;
  }
}
