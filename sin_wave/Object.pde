class Object{
  
  float xcoord;
  float ycoord;
  float startAngle = 0;
  float angleVel = 0.23;
  float time;
  
  Object(float x, float y) {
    xcoord = x;
    ycoord = y;
  }
  float perlinNoise(float t) {
    time += t;
    float x = time;
    x = map(sin(x),0,1,-0.3,0.3);
    return x;
  }
  
  void place(float y){
    ycoord = y;
    xcoord += perlinNoise(0.005);
    // not even perlin noise ended up changing it to the sin function
  }
  
  void display() {
    fill(100,40);
    ellipse(xcoord,ycoord,60,60);
  }
}
