import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class acceleration_vectors extends PApplet {

Ball ball;

public void setup() {
 
 ball = new Ball();
}

public void draw() {
  background(100);
  ball.display();
  ball.update();
  ball.edges();
  
}
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
   
   public PVector PerlinNoise(float t, float t2) { // the argument better be set to 0
     t2 = t = t + 0.001f;
     float x = noise(t);
     float y = noise(t2);
     float vectorX = map(x,0,1,-0.5f,0.5f);
     float vectorY = map(y,0,1,-0.5f,0.5f);
     PVector Perlin = new PVector(vectorX, vectorY);
     return Perlin;
   }

   public void update() {
     PVector mouse = new PVector(mouseX,mouseY);
     mouse.sub(position);
     mouse.setMag(0.5f);
     acceleration = mouse.sub(PerlinNoise(0, 10000));
     
     velocity.add(acceleration);
     position.add(velocity);
     velocity.mult(0.99f); // slows it down so mr speedy conzalas doesnt spaz out
     println(velocity);
 }
   
   public void edges() {
      if((position.x > width) || (position.x < 0)) {
      velocity.x = velocity.x * -1; println("please work");
    } 
    if((position.y > height) || (position.y < 0)) {
      velocity.y = velocity.y * -1;
    }
   }
   
   public void display() {
   
   ellipse(position.x, position.y,30,30);
   
 }
   

}
  public void settings() {  size(640,360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "acceleration_vectors" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
