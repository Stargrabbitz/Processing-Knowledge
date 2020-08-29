Ball ball;

void setup() {
 size(640,360);
 ball = new Ball();
}

void draw() {
  background(100);
  ball.display();
  ball.update();
  ball.edges();
  
}
