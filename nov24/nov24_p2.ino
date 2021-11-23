const int LEDPIN = 3; // the blue LED pin number

void setup() {
  Serial.begin(9600); // setting up serial communication baud
  Serial.println("0"); // starting the conversation
}

void loop() {

  while (Serial.available()) {
    int valueFromProcessing = Serial.parseInt(); // reading the value sent from Processing

    // Only proceed if we have the end of line
    if (Serial.read() == '\n') {
      int mappedVal = map(valueFromProcessing, 0, 640, 0, 255); // mapping the value from processing into 0 to 255 (LED brightness range)
      analogWrite(LEDPIN, mappedVal); // lighting the LED up
    }
  }
}
