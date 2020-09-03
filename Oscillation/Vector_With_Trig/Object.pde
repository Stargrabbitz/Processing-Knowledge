class Object {
  
  PVector pos; //position
  PVector vel; //velocity
  PVector acc; //acceleration
  float mass; // mass is in kg
  
  float angle = 0;
  float angularVel = 0;
  float angularAcc;
  
  Object(float m, float x, float y) {
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = m;
  }
  
  void applyForce(PVector force){
    PVector acceleration = force.div(mass);
    acc.add(acceleration); 
  }
  
  void wall() {
    if(pos.x > width){ vel.x *= -1; pos.x = width;} // we change the position
    if(pos.x < 0){vel.x *= -1; pos.x = 0;}          //otherwise the balls will go
    if(pos.y > height){vel.y *= -1; pos.y = height;}//through the ground
    if(pos.y < 0){vel.y *= -1; pos.y = 0;}
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    
    angularAcc = acc.x;
    angularVel += angularAcc;
    angle += angularVel;
    
    acc.mult(0);
  }


  void display() {
  fill(175);
  stroke(0);
  rectMode(CENTER);
  pushMatrix();// must be used in conjuction with pop matrix
  translate(pos.x,pos.y);
  rotate(angle); //remember angle is in 
  rect(pos.x, pos.y, mass * 10, mass * 10);
  popMatrix(); // makes it so that we only translate this object
  }


}
