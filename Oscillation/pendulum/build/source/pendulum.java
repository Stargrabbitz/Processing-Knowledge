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

public class pendulum extends PApplet {

object pendBall;
// PVector g;
// PVector acc;
// PVector vel;
// float mass;

public void setup(){
  
  pendBall = new object(width/2,height/2,10);
}

public void draw(){
  background(120);
  pendBall.update();
  pendBall.display();
}
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
  public float powerOf(float num, int power){
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
  }

  object(float x, float y, float m) {
    mass = m;
    pos = new PVector(x,y);
    origin = new PVector(width/2,0);
    length = sqrt(powerOf(pos.x-origin.x,2) + powerOf(origin.y-pos.y,2));
    println(length);
  }


  public void update() {
    pos.x = origin.x + length * sin(angle);
    pos.y = origin.y + length * cos(angle);
    aAcc = -0.01f * sin(angle);
    angle += aVel;
    aVel += aAcc;
    aVel *= 0.988f;
  }

  public void display() {
    line(origin.x, origin.y, pos.x, pos.y);
    ellipse(pos.x, pos.y, 50, 50);
  }
}
  public void settings() {  size(600,300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pendulum" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
