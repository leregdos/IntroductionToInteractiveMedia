const int ain1Pin = 3;
const int ain2Pin = 4;
const int pwmAPin = 5;

const int bin1Pin = 8;
const int bin2Pin = 7;
const int pwmBPin = 6;
const int upSwitch = A0;
const int downSwitch = A1;
const int leftSwitch = A2;
const int rightSwitch = A3;

int upState;
int downState;
int leftState;
int rightState;


void setup() {
  pinMode(ain1Pin, OUTPUT);
  pinMode(ain2Pin, OUTPUT);
  pinMode(bin1Pin, OUTPUT);
  pinMode(bin2Pin, OUTPUT);

}

void loop() {
  // turn in one direction, full speed

  upState = digitalRead(upSwitch);
  downState = digitalRead(downSwitch);
  leftState = digitalRead(leftSwitch);
  rightState = digitalRead(rightSwitch);
  if (upState == HIGH) {
    analogWrite(pwmAPin, 255);
    digitalWrite(ain1Pin, HIGH);
    digitalWrite(ain2Pin, LOW);
    analogWrite(pwmBPin, 255);
    digitalWrite(bin1Pin, HIGH);
    digitalWrite(bin2Pin, LOW);
  } else if (downState == HIGH) {
    analogWrite(pwmAPin, 255);
    digitalWrite(ain1Pin, LOW);
    digitalWrite(ain2Pin, HIGH);
    analogWrite(pwmBPin, 255);
    digitalWrite(bin1Pin, LOW);
    digitalWrite(bin2Pin, HIGH);
  } else if (leftState == HIGH) {
    analogWrite(pwmAPin, 150);
    digitalWrite(ain1Pin, HIGH);
    digitalWrite(ain2Pin, LOW);
    analogWrite(pwmBPin, 0);
    digitalWrite(bin1Pin, HIGH);
    digitalWrite(bin2Pin, LOW);
  } else if (rightState == HIGH) {
    analogWrite(pwmBPin, 150);
    digitalWrite(bin1Pin, HIGH);
    digitalWrite(bin2Pin, LOW);
    analogWrite(pwmBPin, 0);
    digitalWrite(bin1Pin, HIGH);
    digitalWrite(bin2Pin, LOW);
  } else {
    analogWrite(pwmBPin, 0);
    digitalWrite(bin1Pin, HIGH);
    digitalWrite(bin2Pin, LOW);
    analogWrite(pwmBPin, 0);
    digitalWrite(bin1Pin, HIGH);
    digitalWrite(bin2Pin, LOW);
  }
}
