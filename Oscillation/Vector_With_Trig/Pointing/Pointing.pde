Entity object;
void setup() {
  size(800,600);
  object = new Entity();
}

void draw() {
  background(0);
  
  //PVector Mouseforce = new PVector(map(mouseX,0, width,-0.01,0.1), map(mouseY,0, height,-0.01,0.1));
  
  //object.applyForce(Mouseforce);
  object.update();
  object.edges();
  object.display();
  
  
  
}
