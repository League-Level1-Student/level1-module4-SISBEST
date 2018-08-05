int frogX;
int frogY;
int hop;
 Car c1 = new Car((int) random(400), (int) random(400), (int) random(25, 30), (int) random(100, 200));
 Car c2 = new Car((int) random(400), (int) random(400), (int) random(25, 30), (int) random(25));
 Car c3 = new Car((int) random(400), (int) random(100), (int) random(25, 30), (int) random(25));
 Car c4 = new Car((int) random(400), (int) random(100), (int) random(25, 30), (int) random(100, 300));
 Car c5 = new Car((int) random(400), (int) random(100), (int) random(25, 30), (int) random(25));
void setup(){
 size(400,400);
}
void draw(){
  background(0, 0, 255);
  fill(0, 255, 0);
  ellipse(frogX, frogY, 20, 20);
  fill(255, 0, 0);
 c1.display();
 c2.display();
 c3.display();
 c4.display();
 c5.display();
 c3.movel();
 c4.mover();
 c2.movel();
 boolean i1 = intersects(c1);
 boolean i2 = intersects(c2);
 boolean i3 = intersects(c3);
 boolean i4 = intersects(c4);
 boolean i5 = intersects(c5);
 if(i1 = true){
   exit();
 }
 if(i2 = true){
   exit();
 }
 if(i3 = true){
   exit();
 }
 if(i4 = true){
   exit();
 }
 if(i5 = true){
   exit();
 }
}
void keyPressed()
{
      if(key == CODED){
            if(keyCode == UP)
            {
                 frogY--;
            }
            else if(keyCode == DOWN)
            {
                  frogY++;
            }
            else if(keyCode == RIGHT)
            {
                  frogX++;
            }
            else if(keyCode == LEFT)
            {
                  frogX--;
            }}
      }
   boolean intersects(Car car) {
      if ((frogY > car.cy && frogY < car.cy+50) && (frogX > car.cx && frogX < car.cx+car.size))
      {
             return true;
      }
      else 
      {
             return false;
      }
}

class Car{
  int cx;
  int cy;
  int size;
  int speed;
 Car(int cx, int cy, int size, int speed){
   this.cx = cx;
   this.cy = cy;
   this.size = size;
   this.speed = speed;
 }
 void display(){
      fill(0,255,0);
      rect(cx , cy, size, 50);
}
void movel(){
 cx += speed;
 if (cx > width){
   cx = 0;
 }
}
void mover(){
 cx -= speed; 
 if (cx > width){
   cx = 0;
 }
}
}