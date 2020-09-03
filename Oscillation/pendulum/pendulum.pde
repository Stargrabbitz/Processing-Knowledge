object pendBall;

void setup(){
  size(600,300);
  pendBall = new object(width/2,height/2,10);
}

void draw(){
  background(120);
  pendBall.update();
  pendBall.display();
}
