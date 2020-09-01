Object[] ball;
float x = -200.0;
float y = 0.0;
float startAngle = 0;
float angleVel = 0.23;
int n = 200;

void setup() {
  size(800,600);
  ball = new Object[n];
  for(int i = 0; i < ball.length/2; i++){
    x += 15;
    ball[i] = new Object(x,y);
  }
  frameRate(60);
  x= -170;
  for(int i = n/2; i < ball.length; i++){
    x += 15;
    ball[i] = new Object(x,y);
  }
}

void draw() {
  background(220);
  //y = map(sin(angle),-1,1,0,height);
   startAngle += 0.015;
   float angle = startAngle;
    
  for(int i = 0; i < ball.length; i++){
    y = map(sin(angle),-1,1,0,height);
    ball[i].place(y);
    ball[i].display();
    angle += angleVel;
  }
  
    for(int i = n/2; i < ball.length; i++){
    y = map(cos(angle),-1,1,0,height);
    ball[i].place(y);
    ball[i].display();
    angle += angleVel;
  }
    

}
