float amplitude = 300;
//float period = 200; //just means we want the period to last 200 frames
float angle = 0.0;
void setup(){
  size(640,360);
}

void draw() {
  background(70);
  translate(width/2,height/2);
  //float x = amplitude*sin((frameCount/period) * TWO_PI);
  float x = amplitude * sin(angle);
  // we can accomplish the same result just by adding to the 
  //angle variable
  ellipse(x,0,20,20);
  angle += 0.05;
}
