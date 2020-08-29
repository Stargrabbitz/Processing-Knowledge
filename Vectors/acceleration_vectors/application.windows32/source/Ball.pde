class Ball {
  
   PVector position;
   PVector velocity;
   PVector acceleration;
   //PVector center = new PVector(width/2,height/2);
   PVector mouse = new PVector(mouseX,mouseY);
   
   
   Ball() {
     position = new PVector(width/2,height/2);
     velocity = new PVector(0,0); //starts without moving
     acceleration = new PVector(1,0);
   }
   
   PVector PerlinNoise(float t, float t2) { // the argument better be set to 0
     t2 = t = t + 0.001;
     float x = noise(t);
     float y = noise(t2);
     float vectorX = map(x,0,1,-0.5,0.5);
     float vectorY = map(y,0,1,-0.5,0.5);
     PVector Perlin = new PVector(vectorX, vectorY);
     return Perlin;
   }

   void update() {
     PVector mouse = new PVector(mouseX,mouseY);
     mouse.sub(position);
     mouse.setMag(0.5);
     acceleration = mouse.sub(PerlinNoise(0, 10000));
     
     velocity.add(acceleration);
     position.add(velocity);
     velocity.mult(0.99); // slows it down so mr speedy conzalas doesnt spaz out
     println(velocity);
 }
   
   void edges() {
      if((position.x > width) || (position.x < 0)) {
      velocity.x = velocity.x * -1; println("please work");
    } 
    if((position.y > height) || (position.y < 0)) {
      velocity.y = velocity.y * -1;
    }
   }
   
   void display() {
   
   ellipse(position.x, position.y,30,30);
   
 }
   

}
