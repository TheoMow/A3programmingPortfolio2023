Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.00";
boolean left = true;
float l, r, result;
char op = ' ';

void setup() {
  size(322, 600);
  numButtons[0] = new Button(120, 559, 80, 80, '0');
  numButtons[1] = new Button(40, 479, 80, 80, '1');
  numButtons[2] = new Button(120, 479, 80, 80, '2');
  numButtons[3] = new Button(200, 479, 80, 80, '3');
  numButtons[4] = new Button(40, 399, 80, 80, '4');
  numButtons[5] = new Button(120, 399, 80, 80, '5');
  numButtons[6] = new Button(200, 399, 80, 80, '6');
  numButtons[7] = new Button(40, 319, 80, 80, '7');
  numButtons[8] = new Button(120, 319, 80, 80, '8');
  numButtons[9] = new Button(200, 319, 80, 80, '9');
  opButtons[0] = new Button(200, 559, 80, 80, '=');
  opButtons[1] = new Button(40, 559, 80, 80, '±');
  opButtons[2] = new Button(280, 559, 80, 80, '÷');
  opButtons[3] = new Button(280, 479, 80, 80, '+');
  opButtons[4] = new Button(280, 399, 80, 80, '-');
  opButtons[5] = new Button(280, 319, 80, 80, '*');
  opButtons[6] = new Button(40, 239, 80, 80, 'c');
  opButtons[7] = new Button(120, 239, 80, 80, '.');
  opButtons[8] = new Button(200, 239, 80, 80, 's');
  opButtons[9] = new Button(280, 239, 80, 80, '?');
  opButtons[10] = new Button(280, 239, 80, 80, '?');
  opButtons[11] = new Button(280, 239, 80, 80, '?');
}

void draw() {
  background(80);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed() {
  for (int i =0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      if (dVal.equals("0.00")) {
        dVal = str(numButtons[i].val);
      } else {
        dVal += str(numButtons[i].val);
      }
    }
    if (left) {
      l = float(dVal);
    } else {
        r = float(dVal);  
    }
  }
  
  for (int i = 0; i<numButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'c') {
      dVal = "0.00";
      left = true;
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      dVal = "0.00";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "0.00";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      op = '±';
      dVal = "0.00";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      dVal = "0.00";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '*') {
      op = '*';
      dVal = "0.00";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      preformCalculation();
    }
  }
  println("l;"+l+" r:" + r + " op:" + op + "result:" + result + "left:" + left);
}
void updateDisplay() {
  fill(80);
  rect(310, 70, 155, 135, 28);
  fill(255);
  textAlign(RIGHT);
  text(dVal, width, 80);
}

void preformCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }

  dVal = str(result);
  l = result;
  left = true;
}
