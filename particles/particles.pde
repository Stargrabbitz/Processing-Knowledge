ArrayList<Particle> particle;
PVector gravity = new PVector(0,0.01);

void setup() {
  size(600,400);
  particle = new ArrayList<Particle>();
}

void draw() {
  background(255);
  if (mousePressed) {particle.add(new Particle());}
  for(Particle p : particle){
    p.force(gravity);
    p.update();
    p.display();
  }
  if (particle.size() > 300) {particle.remove(0);}
}
