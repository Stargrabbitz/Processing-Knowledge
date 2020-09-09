class Particle {

  PVector acc;
  PVector vel;
  PVector pos;
  float alpha =255;

  Particle() {
    pos = new PVector(mouseX,mouseY);
    acc = new PVector(0,0);
    vel = new PVector(random(-2,2),random(-2,2));
  }

  void force(PVector speed) {
    PVector acceleration = speed;
    acc.add(acceleration);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    vel.limit(9);
    alpha-=2;
  }

  void display() {
    fill(200,alpha);
    stroke(1,alpha);
    ellipse(pos.x,pos.y,20,20);
  }
}
