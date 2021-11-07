const int greenLedPin = 8;
const int buttonSwitch = A2;
const int blueLedPin = 5;
const int yellowLedPin = 6;
const int ldrPin = A0;
int maxBright = 0; // a variable to store the maximum brightness of environment for LDR
int minBright = 1023; // a variable to store the minimum brightness of environment for LDR
int buttonValue = 0; // a variable that changes depending on how many times / for how long the switch is pressed
bool buttonValIncreasing = true; // a variable that decides whether the button value should be incremented or decremented
int loopValue = 0; // a variable incremented each loop() call to slow down button value updating

void setup() {
  Serial.begin(9600);
  pinMode(greenLedPin, OUTPUT);
}

void loop() {
  int ldrValue = analogRead(ldrPin);
  int buttonState = digitalRead(buttonSwitch);
  if (ldrValue > maxBright) { // setting the maxBrightness of LDR
    maxBright = ldrValue;
  }
  if (ldrValue < minBright) { // setting the minBrightness of LDR
    minBright = ldrValue;
  }
  if (ldrValue > maxBright - 100) { // if the brightness is higher than this threshold, turn the light off
    digitalWrite(greenLedPin, LOW);
  } else if (ldrValue < maxBright - 100) { // if the brightness is lower than this threshold, turn the light on
    digitalWrite(greenLedPin, HIGH);
  }
  if (loopValue % 60 == 0) { // an if check to slow down how fast the buttonValue was being updated. Since loop() is called 60 times per second, if this statement were not here, the blue and yellow LEDs will blink rapidly.
    if (buttonState == HIGH) { // when the button is pressed
      if (buttonValue >= 255) { // if buttonValue is higher than this threshold, start decrementing
        buttonValIncreasing = false;
      } else if (buttonValue == 0) { // if buttonValue reaches 0, start incrementing
        buttonValIncreasing = true;
      }
      if (buttonValIncreasing) {
        buttonValue++;
      } else {
        buttonValue--;
      }
    } else { // do nothing if the button is not pressed
      buttonValue = buttonValue;
    }
  }
  loopValue++;
  analogWrite(yellowLedPin, map(buttonValue, 0, 255, 255, 0)); // the yellow LED should get brighter as blue gets dimmer
  analogWrite(blueLedPin,  buttonValue); // the blue LED should get brighter as yellow gets dimmer
}
