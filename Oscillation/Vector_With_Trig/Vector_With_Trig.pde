Object[] ball;

void setup() {
  size(600,300);
  ball = new Object[1];
  
  for(int i = 0; i < ball.length; i++) {
    ball[i] = new Object(random(100,500), 250, random(3,5));
    println("position of ball x: " + ball[i].pos.x);
    println("postion of ball y: " + ball[i].pos.y);
    println("size of ball: " + ball[i].mass);
  }
  
}

void draw() {
  PVector f = new PVector(1,1);
  for(int i = 0; i < ball.length; i++){
    ball[i].applyForce(f);
    ball[i].wall();
    ball[i].update();
    ball[i].display();
  }
}
