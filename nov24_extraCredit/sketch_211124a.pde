PVector velocity;
PVector gravity;
PVector position;
PVector acceleration;
float mass = 50;
import processing.serial.*;
Serial myPort;
void setup() { 
  size(640, 360); // setting up the canvas
  noFill();
  position = new PVector(width/2, 0); // setting up the position PVector object
  velocity = new PVector(0, 0); // velocity PVector object
  acceleration = new PVector(0, 0); // acceleration PVector object
  gravity = new PVector(0, 0.3*mass); // gravity PVector object
  printArray(Serial.list());
  String portname=Serial.list()[0]; 
  myPort = new Serial(this, portname, 9600); // initializing new Serial object
  myPort.clear(); // clearing buffer
  myPort.bufferUntil('\n'); // buffer until an input comes
  delay (2000);
}
void draw() {
  background(255);
  applyForce(gravity);
  velocity.add(acceleration);
  position.add(velocity);
  acceleration.mult(0);
  ellipse(position.x, position.y, mass, mass);
  if (position.y > height-mass/2) { // checking if the ball fell on the floor
    velocity.y *= -0.9;  // bouncing back while losing some energy
    position.y = height-mass/2;  // prevent sinking beneath the floor

  }
}
void applyForce(PVector force) { // the application of Newton's second law
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}
void serialEvent(Serial myPort) { // when the button is pressed
  String inString = myPort.readStringUntil('\n');
  if (inString != null) { 
    inString = trim(inString);
    float inValue = float(inString);
    if (inValue == 1.0) { // if arduino is sending this value
      position.y -= 10; // make the ellipse jump
      if (mass >= width / 2 + 50) { // pop the ellipse
        mass = 15;
      } else { // enlargen the ellipse
        mass += 5;
      }
    }
  }
}
