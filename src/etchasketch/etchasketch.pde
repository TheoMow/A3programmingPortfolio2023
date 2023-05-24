// Theo Mowdood | oct 3 22 | etchasketch
int x , y;
void setup() {

size(500,500);}
void draw(){
 
  ellipse (x,y,1,1);
  noStroke();

  
}
void mousePressed (){
  save("line.png");
}
void keyPressed (){
 if (key == 's' ){
   y = y +1
   ;
 }
 if ( key == 'd' ) {
   x = x + 1;
 }
 if ( key == 'w') {
   y = y - 1;
 }
 if ( key == 'a') {
   x = x -1;
 }
 if (key == 'e') {
  
   fill (100);
   ellipse (x,y, 1,1);
 }
 if (key == 'g'){
   fill(255);
   ellipse (x,y,1,1);
 }
 if (key == 'r'){
   fill(255,0,0);
   ellipse(x,y,1,1);
   
 }
}

//int x, y;

//void moveRight(int rep){
//  for(int i = 0; i <rep;i++){
//    point(x+i,y);
//  }
//  x=x+rep;
//}

//void moveDown(int rep){
//  for(int i = 0; i <rep;i++){
//    point(x,y+i);
//  }
//  y=y+rep;
//}

//void moveUp(int rep){
//  for(int i = 0; i <rep;i++){
//    point(x,y-i);
//  }
//  y=y-rep;
//}
//void moveLeft(int rep){
//  for(int i = 0; i <rep;i++){
//    point(x-i,y);
//  }
//  x=x-rep;
//}
//void moveUpRight(int rep){
//  for(int i = 0; i <rep;i++){
//    point(x+i,y-i);
//  }
//  x=x+rep;
//  y=y-rep;
//}
