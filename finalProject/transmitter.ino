
const int CEPIN = 9;
const int CSNPIN = 10;

#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
RF24 radio(CEPIN, CSNPIN);                // CE, CSN
const byte address[6] = "00001";

// Pins for the pushbuttons
const int leftPin = A1;
const int rightPin = A2;
const int fwdPin = A0;
const int backPin = A3;
const int stopPin = A5;


void setup() {
  Serial.begin(115200);
  boolean retval = radio.begin();   //Starting the Wireless communication
  Serial.println(retval);
  radio.openWritingPipe(address);  //destination addres
  radio.setPALevel(RF24_PA_MIN);   // min or max
  radio.stopListening();           //This sets the module as transmitter
}
void loop() {

  int left = digitalRead(leftPin) << 2;
  int fwd = digitalRead(fwdPin) << 1;
  int right = digitalRead(rightPin) << 0;
  int back = digitalRead(backPin) << 3;
  int stp = digitalRead(stopPin) << 4;
  int data = left | fwd | right | back | stp;
  if (data) {
    Serial.print( "sending data = " );
    Serial.println(data);
    radio.write(&data, sizeof(data)) ;
  }
}
