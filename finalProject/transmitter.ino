
const int CEPIN = 9;
const int CSNPIN = 10;

#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
RF24 radio(CEPIN, CSNPIN);                // CE, CSN
const byte address[6] = "00001";
int valueFromProcessing;

void setup() {
  Serial.begin(115200);
  boolean retval = radio.begin();   //Starting the Wireless communication
  Serial.println(retval);
  radio.openWritingPipe(address);  //destination addres
  radio.setPALevel(RF24_PA_MIN);   // min or max
  radio.stopListening();           //This sets the module as transmitter
  Serial.println("0"); // starting the conversation

}
void loop() {
  while (Serial.available()) {
    valueFromProcessing = Serial.parseInt(); // reading the value sent from Processing

    // Only proceed if we have the end of line
    if (Serial.read() == '\n') {
      Serial.print( "sending data = " );
      Serial.println(valueFromProcessing);
      radio.write(&valueFromProcessing, sizeof(valueFromProcessing)) ;
    }
  }
}
