const int button = A0; // the button's input pin
int buttonVal; // the button's val either HIGH or LOW

void setup() {
  Serial.begin(9600);
  Serial.println("0"); // starting the conversation
}

void loop() {
  buttonVal = digitalRead(button); 
  while (Serial.available()) { // sending the button value to Processing
    if (buttonVal == HIGH) {
      Serial.println(1);
    }
    else {
      Serial.println(0);
    }
  }
}
