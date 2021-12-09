const int CEPIN = 9;
const int CSNPIN = 10;
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
RF24 radio(CEPIN, CSNPIN);  // CE, CSN
const byte address[6] = "00032"; // setting the address for radio interfacing


const int ain1Pin = 3;
const int ain2Pin = 4;
const int pwmAPin = 5;

const int bin1Pin = 8;
const int bin2Pin = 7;
const int pwmBPin = 6;


void setup() {

  pinMode(CEPIN, OUTPUT);
  pinMode(CSNPIN, OUTPUT);
  pinMode(ain1Pin, OUTPUT);
  pinMode(ain2Pin, OUTPUT);
  pinMode(bin1Pin, OUTPUT);
  pinMode(bin2Pin, OUTPUT);

  Serial.begin(9600);

  // RF24 setup
  if (!radio.begin()) {
    Serial.println("radio  initialization failed");
    while (1)
      ;
  } else {
    Serial.println("radio successfully initialized");
  }
  radio.openReadingPipe(0, address);  // Destination address
  radio.setPALevel(RF24_PA_MIN);      // Min or max
  radio.startListening();             // sets  module as receiver
}
void loop() {
  uint8_t pipeNum;

  if (radio.available(&pipeNum))  //Looking for the data.
  {
    int data;

    Serial.print("data available on pipe ");
    Serial.println(pipeNum);

    radio.read(&data, sizeof(data));  //Reading the data
    Serial.print("data = ");
    Serial.println( data);


    if (data == 2) { // moving right
      analogWrite(pwmBPin, 150);
      digitalWrite(bin1Pin, HIGH);
      digitalWrite(bin2Pin, LOW);
      analogWrite(pwmAPin, 0);
      digitalWrite(ain1Pin, HIGH);
      digitalWrite(ain2Pin, LOW);
    } else if (data == 3) { // moving backward
      analogWrite(pwmAPin, 255);
      digitalWrite(ain1Pin, LOW);
      digitalWrite(ain2Pin, HIGH);
      analogWrite(pwmBPin, 255);
      digitalWrite(bin1Pin, LOW);
      digitalWrite(bin2Pin, HIGH);
    } else if (data == 0) { // moving forward
      analogWrite(pwmAPin, 255);
      digitalWrite(ain1Pin, HIGH);
      digitalWrite(ain2Pin, LOW);
      analogWrite(pwmBPin, 255);
      digitalWrite(bin1Pin, HIGH);
      digitalWrite(bin2Pin, LOW);
    } else if (data == 1) { // moving left
      analogWrite(pwmBPin, 0);
      digitalWrite(bin1Pin, HIGH);
      digitalWrite(bin2Pin, LOW);
      analogWrite(pwmAPin, 150);
      digitalWrite(ain1Pin, HIGH);
      digitalWrite(ain2Pin, LOW);
    }
    if (data == 4) { // stopping
      analogWrite(pwmAPin, 0);
      digitalWrite(ain1Pin, HIGH);
      digitalWrite(ain2Pin, LOW);
      analogWrite(pwmBPin, 0);
      digitalWrite(bin1Pin, HIGH);
      digitalWrite(bin2Pin, LOW);
    }
  }
}
