class PowerUp{
  int x, y, diam, speed;
  char type;
 // PImage rock;

  PowerUp() {
    x= int(random(width));
    y = -50;
    diam = int(random(90, 130));
    speed = int(random(2, 6));
    //rock = loadImage("rock2.png");
    int rand = int(random(3));
    if(rand==0){
      type = 'A';
      
    }else if (rand ==1){
      type='H';
    }else{
      type = 'T';
    }
  }
  void display() {
    fill(255,255,0);
    ellipse(x,y,diam,diam);
    fill(255);
    text(type,x,y);
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
   boolean intersect(Ship ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<25) {
      
      return true;
    } else {
      return false;
    }
    
      
    
  }
}
