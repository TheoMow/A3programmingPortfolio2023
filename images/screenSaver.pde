//theo mowdood | oct 10 22| screen saver
int x = 10;
float xpos, ypos;
float strokeW;
float pointCount;
class Lines {
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength= tempLength;
  }
  void display(int x) {
    strokeW = random(1, 2);
    lineLength= random(1, 50);
    stroke(random(200), random(100), random(10));
    if (xpos > width || xpos < 0 || ypos > height || ypos <0) {
      xpos= random(width);
      ypos=random(height);
    } else if (random(100)>90) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (random(100)>80) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      } else if (random(100)>70) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } else {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      }
    }
  }

Lines[] myLines= new Lines[10];
void setup() {
  fullScreen();
  size(displayWidth, displayHeight);
  xpos= random(width);
  ypos = random(height);
  background(random(255));
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines (random(width), random(height), random(1, 5), random(1, 20));
  }
}

void draw() {
  Lines[] myLines=new Lines[10];
  for (int i= 0; i <myLines.length; i ++) {
    Lines iLines = myLines[i];
    iLines.display(x);
   
  }

  strokeW = 1;
  pointCount = random(1, 10);
  stroke(0);
  strokeWeight(strokeW);
  if (xpos > width || xpos<0 || ypos > height || ypos < 0) {
    xpos= random(width);
    ypos = random(height);
  }
  if (random(100)>70) {
    strokeWeight(strokeW);
    moveLeft(xpos, ypos, pointCount);
  } else if (random(100)>65) {
    strokeWeight(strokeW);
    moveUp(xpos, ypos, pointCount);
  } else if (random (100) > 55) {
    strokeWeight(strokeW);
    moveDown(xpos, ypos, pointCount);
  } else {
    strokeWeight(strokeW);
    moveRight(xpos, ypos, pointCount);
  }
}
void moveRight (float startX, float startY, float moveCount) {
  for (float i =0; i<moveCount; i ++) {
    point(startX+i, startY);
    xpos = startX + 1;
    ypos = startY;
  }
}

void moveLeft (float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX-1, startY);
    xpos = startX - 1;
    ypos = startY;
  }
}

void moveUp (float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX, startY-1);
    xpos =startX;
    ypos = startY -1;
  }
}

void moveDown (float startX, float startY, float moveCount) {
  for ( float i = 0; i <moveCount; i++) {
    point(startX, startY + 1);
    xpos = startX;
    ypos= startY + 1;
  }
}
