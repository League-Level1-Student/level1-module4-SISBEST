int frogX;
int frogY;
int hop;
 Car c1 = new Car((int) random(400), (int) random(400), (int) random(25, 30), (int) random(25));
 Car c2 = new Car((int) random(400), (int) random(400), (int) random(25, 30), (int) random(25));
 Car c3 = new Car((int) random(400), (int) random(100), (int) random(25, 30), (int) random(25));
 Car c4 = new Car((int) random(400), (int) random(100), (int) random(25, 30), (int) random(25));
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
            }
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

}
