import processing.serial.*;

Serial myPort;        // The serial port
float inByte = 0; // the variable to hold the potentiometer value sent from Arduino.
void setup () {
  size(400, 300); // setting up the canvas

  printArray(Serial.list()); // printing list of available serial ports
  myPort = new Serial(this, Serial.list()[0], 9600); // using the first serial port
  myPort.bufferUntil('\n'); // buffering until a newline is found, so that processing doesn't miss the first callback event from Arduino
}

void draw () {
  background(200); // background color of the canvas
  circle(inByte, height / 2, 30); // the circle whose x coordinates are controlled by values taken from Arduino potentiometer
}

void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n'); // read line by line
  if (inString != null) { // making sure the string is not empty
    inString = trim(inString); // trimming off whitespace
    inByte = float(inString); // converting to float
    inByte = map(inByte, 0, 1023, 0, width); // mapping the value that's between 0 to 1023 to a value between 0 and width
  }
}
