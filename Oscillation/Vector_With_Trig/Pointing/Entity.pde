class Entity {
  
  PVector pos;
  PVector acc;
  PVector vel;
  

  Entity(){
    pos = new PVector(width/2,height/2);
    acc = new PVector(0,0);
    vel = new PVector(0,0);
  }
  
  void update() {
    PVector dirForce = new PVector(mouseX, mouseY);
    dirForce.sub(pos);
    dirForce.setMag(0.3);
    acc = dirForce;
    

    
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
   void edges() {
    if(pos.x > width){ vel.x *= -1; pos.x = width;} // we change the position
    if(pos.x < 0){vel.x *= -1; pos.x = 0;}          //otherwise the balls will go
    if(pos.y > height){vel.y *= -1; pos.y = height;}//through the ground
    if(pos.y < 0){vel.y *= -1; pos.y = 0;}
   }
  
  void display() {
    float angle = atan(vel.y/vel.x);
    stroke(0);
    pushMatrix();
      rectMode(CENTER);
      translate(pos.x,pos.y);
      rotate(angle);
      rect(0,0,30,10); // x y is always at 0 because we defining its location
      //at the point of transation, and what ever that translation point is
      //.. will be 0,0
    popMatrix();
  }


}
