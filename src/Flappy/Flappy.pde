int birdX = 10;
int birdY;
double birdYVelocity = 5;
double gravity = .5;
int pipeX = 500;
 int upperPipeHeight = 200;
 int score = 0;
void setup(){
 size(500, 400);
}
void draw(){
background(0, 0, 255); 
fill(0, 255, 0);
ellipse(birdX, birdY, 20, 20);
birdYVelocity += gravity;
birdY+= birdYVelocity;
tp();
pipeX--;
fill(0, 255, 15);
text("Score: " + score + "!         S Flappy by Samuel is part of the S Suite: visit apps.samuelsharp.com for more fun!", 10, 10);
if(birdY > 400){
  exit();
}
if(intersectsPipes() == true){
  exit();
}

}

void mousePressed(){
 birdYVelocity = -10; 
}

void tp(){
  
  fill(255, 0, 0);
  if(pipeX < 0){
    score++;
    
    upperPipeHeight = (int) random(100, 350);
    pipeX = 500;
}
else{
  rect(pipeX, 0, 20, upperPipeHeight);
  rect(pipeX, upperPipeHeight + 100, 20, 200);
}

}
boolean intersectsPipes() { 
     if (birdY < upperPipeHeight && birdX > pipeX && birdX < (pipeX+20)){
          return true; }
     else if (birdY>upperPipeHeight + 100 && birdX > pipeX && birdX < (pipeX+20)) {
          return true; }
     else { return false; }
}
