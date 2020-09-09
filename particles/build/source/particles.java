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

public class particles extends PApplet {

ArrayList<Particle> particle;
PVector gravity = new PVector(0,0.01f);

public void setup() {
  
  particle = new ArrayList<Particle>();
}

public void draw() {
  background(255);
  if (mousePressed) {particle.add(new Particle());}
  for(Particle p : particle){
    p.force(gravity);
    p.update();
    p.display();
  }
  if (particle.size() > 300) {particle.remove(0);}
}
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

  public void force(PVector speed) {
    PVector acceleration = speed;
    acc.add(acceleration);
  }

  public void update() {
    vel.add(acc);
    pos.add(vel);
    vel.limit(9);
    alpha-=2;
  }

  public void display() {
    fill(200,alpha);
    stroke(1,alpha);
    ellipse(pos.x,pos.y,20,20);
  }
}
  public void settings() {  size(600,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "particles" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
