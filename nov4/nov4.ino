const int buttonSwitch = A0;
const int greenPin = 10;
const int bluePin = 13;
void setup() {
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);

}

void loop() {
  int buttonState = digitalRead(buttonSwitch);

  if (buttonState == HIGH) {
    digitalWrite(greenPin, HIGH);
    digitalWrite(bluePin, LOW);
  }
  else {
    digitalWrite(greenPin, LOW);
    digitalWrite(bluePin, HIGH);
  }

}
