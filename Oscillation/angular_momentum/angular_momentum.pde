// when using trig in processing
// we use RADIANS!

float angle = 0;
float angularVel = 0;
float angularAcc = 0.001;
float a = 100;
void setup() {
  size(800,600);
}

void draw() {
  background(255);
  stroke(0);
  rectMode(CENTER);
  fill(175);
  translate(width/2,height/2);
  rotate(angle);
  line(-a,0,a,5);
  ellipse(-a,0,20,20);
  ellipse(a,0,20,20);
  float something = map(mouseX,0,width,0.001, -0.001);
  angularVel += something;
  angle += angularVel;
}
