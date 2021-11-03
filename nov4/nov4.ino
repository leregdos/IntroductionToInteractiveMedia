const int buttonSwitch = A0; // saving the switch input into a variable
const int greenPin = 10; // saving the green LED output into a variable
const int bluePin = 13; // saving the blue LED output into a variable
void setup() {
  pinMode(greenPin, OUTPUT); // setting green LED for output
  pinMode(bluePin, OUTPUT); // setting blue LED for output

}

void loop() {
  int buttonState = digitalRead(buttonSwitch); // reading the switch on digital mode so it only has 2 states (ON and OFF)

  if (buttonState == HIGH) { // if the switch is connected
    digitalWrite(greenPin, HIGH);
    digitalWrite(bluePin, LOW);
  }
  else {  // if the switch is disconnected
    digitalWrite(greenPin, LOW);
    digitalWrite(bluePin, HIGH);
  }

}
