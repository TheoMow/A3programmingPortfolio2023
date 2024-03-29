// Theo mowdood |28 Nov 2022 | SpaceGame
import processing.sound.*;
SoundFile blaster;
Ship s1;
Timer rockTimer, powerUpTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powerUps= new ArrayList<PowerUp>();

Star[] stars = new Star[100];
int score, level, rockCount, laserCount;
boolean play;

void setup() {
  if(score<900){
    
  }
  size(900, 900);
  blaster = new SoundFile(this, "energySound.wav");

  s1 = new Ship();
  rockCount = 1000;
  rockTimer = new Timer(rockCount);
  
  rockTimer.start(rockCount);
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 0;
  rockCount=1000;
  laserCount = 0;
  play = false;
}

void draw() {
  if(score>900){
    rockCount-=0.0001;
    level=1;
    
  }if(score>1800){
    level=2;
    
  } if(score>4000){
    level=3;
  
    
  }if(score>8000){
    level=4;
    
    
  }
  if (!play) {
    startScreen();
  } else {
    background(0);
    // render stars
    for (int i = 0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    infoPanel();
    noCursor();
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start(rockCount);
    }
    // distributing rocks
   
    // render rock / ship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        score+=r.diam;
        //todo: add animation of explosion
        rocks.remove(r);
      }

      if (r.reachBottom()) {
        rocks.remove(r);
        println(rocks.size());
      } else {
        r.display();
        r.move();
      }
    }
    // render lasers and detect rock collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          lasers.remove(l);
          r.diam -= 100;
          if (r.diam<2) {
            rocks.remove(r);
          }
          score+=100;
        }
      }
      if (l.reachTop()) {
        lasers.remove(l);
        println(rocks.size());
      } else {
        l.display();
        l.move();
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    if (s1.health<0) {
      gameOver();
    }
  }
}

void mousePressed() {
   blaster.play();
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 4) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    println("Lasers:" + lasers.size());
  }
}



void infoPanel() {
  fill(128, 127);
  rect(width/3, 25, width, 50);
  fill(255);
  textSize(30);
  text( "SPACEGAME" + " | LEVEL:" + level + " | Score:" + score + "| Health: " + s1.health + " | Ammo:" + s1.ammo, width/6, 50);
}

void startScreen() {
  background (0);
  fill (255);
  textAlign(CENTER);
  textSize(50);
  text("click or press any key to start...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
 
  
  background (0);
  fill (#CE1111);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = false;
    noLoop();
    
  }
  
}
