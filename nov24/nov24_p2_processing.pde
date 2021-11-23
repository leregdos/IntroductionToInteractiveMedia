import processing.serial.*;
Serial myPort; // initializing serial
int ellipseXVal = 320; // the variable to store the x coordinate of circle

void setup() {
  size(640, 360); // canvas size
  noFill(); // no colors
  printArray(Serial.list()); // printing available serial ports
  String portname=Serial.list()[0]; // getting the first available serial
  myPort = new Serial(this, portname, 9600); // instantiating a new Serial object
  myPort.clear(); // clearing the buffer
}
void draw() {
  background(255);
  circle(ellipseXVal, height / 2, 30); // drawing the circle
  myPort.write(ellipseXVal + "\n"); // sending the x coordinate to arduino
}
void keyPressed() {
  if (keyCode==LEFT) { // moving the circle left
    if (ellipseXVal > 10) {
      ellipseXVal-=10;
    }
  }
  if (keyCode==RIGHT) { // moving the circle right
    if (ellipseXVal < width - 10) {
      ellipseXVal+=10;
    }
  }
}
