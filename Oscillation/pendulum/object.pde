class object {
PVector origin;
PVector pos;
float mass;
float angle = PI/4;
float aAcc;
float aVel;
float length;
//this function takes the power as an int because
//i dont want it to work with floats xD
  float powerOf(float num, int power){
    float number = num;
    for(int i = 1; i < power; i++){
      number = number * num;
    }
//this code block is because otherwise negative squaroot
    if(number < 0){
      return -number;
    }else {
      return number;
    }
//-------------------------------------------------------
  }

  object(float x, float y, float m) {
    mass = m;
    pos = new PVector(x,y);
    origin = new PVector(width/2,0);
    length = sqrt(powerOf(pos.x-origin.x,2) + powerOf(origin.y-pos.y,2));
    println(length);
  }

  void update() {
    pos.x = origin.x + length * sin(angle);
    pos.y = origin.y + length * cos(angle);
    aAcc = -0.01 * sin(angle);
    angle += aVel;
    aVel += aAcc;
    aVel *= 0.988;
  }

  void display() {
    line(origin.x, origin.y, pos.x, pos.y);
    ellipse(pos.x, pos.y, 50, 50);
  }
}
