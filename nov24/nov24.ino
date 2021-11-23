void setup() {
  Serial.begin(9600); // setting up serial
}

void loop() {
  int sensorValue = analogRead(A0); // reading the value
  Serial.println(sensorValue); // sending the potentiometer value
  delay(1);        // delay in between reads for stability
}
