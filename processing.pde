int leftLocation = 170;
int rightLocation = 170;
int paddleRadius = 15;
int mousePressed = 0;
int backgroundColor = color(60,222,95);
int ballX = 200;
int ballY = 200;
int velocityX = (-1,1);
int velocityY = random(-.5,.5);;
int leftPoints = 0;
int rightPoints = 0;

void setup() {
   size(400, 400);
   frameRate(120); 
   start();
 }
void paddleLeft(yLeft) {
   fill(255,0,0);
   rect(20, yLeft, 20, 60,paddleRadius);
}
void paddleRight(yRight) {
   fill(0,0,255);
   rect(360, yRight, 20, 60,paddleRadius);
}
void ball(){
   if(ballY > 399){
      velocityY = -.5;
   }
   if(ballY < 1){
      velocityY = .5;
   }

   if(ballX === 50 && ballY < leftLocation+65 && ballY > leftLocation){
      velocityX = 1;
   }
   if(ballX === 350 && ballY < rightLocation+65 && ballY > rightLocation){
      velocityX = -1;
   }
   ballY = ballY + (velocityY);
   ballX = ballX +(velocityX*2);
   fill(0,0,0);
   ellipse(ballX,ballY, 20, 20);

}

void keyPressed() {
  if (keyCode == UP && ballX > 200) {
     if(rightLocation > 0 ){
        rightLocation = rightLocation -5;
     }
  }
  if (keyCode == DOWN && ballX > 200) {
     if(rightLocation < 340 ){
        rightLocation = rightLocation +5;
     }
  }
  if (keyCode == 'W') {
     if(leftLocation > 0 && ballX < 200){
        leftLocation = leftLocation -5;
     }
  }
  if (keyCode == 'S') {
     if(leftLocation < 340 && ballX < 200){
        leftLocation = leftLocation + 5;
     }
  }
}
void points(){
   if(ballX > 450){
      ballX = 200;
      leftPoints = leftPoints +1;
   }
   if(ballX < 0){
      ballX = 200;
      rightPoints = rightPoints +1;
   }
}
void draw(){
   if(mousePressed == true){
      fill(255,255,255)
      rect(0, 0, 400, 400);
      if(ballX < 200){
         fill(255,102,102)
         rect(0, 0, 400, 400);
      }else{
         fill(128,212,255)
         rect(0, 0, 400, 400);
      }
      paddleLeft(leftLocation);
      paddleRight(rightLocation);
      ball();
      points();
      textSize(50);
      text(leftPoints, 30, 70);
      text(rightPoints, 300, 70);
   }
   }

void mouseClicked() {
   mousePressed = true;
  }
  