Object[] entity;
void setup() {
  size(900,700);
  entity = new Object[10];
  for (int i = 0; i < entity.length; i ++) {
    entity[i] = new Object(random(1,3), random(50, 550), 60);  
  }
}

void draw() {
  background(100);
  for (int i = 0; i < entity.length; i++){
    
    entity[i].wall();
    entity[i].display();
  }
}
