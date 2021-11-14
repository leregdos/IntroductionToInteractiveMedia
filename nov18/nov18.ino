#include "pitches.h" // the header file I used to import tone pitches
const int button1 = A0; // switch #1
const int button2 = A1; // switch #2
const int button3 = A2; // switch #3
const int button4 = A3; // switch #4
const int button5 = A4; // switch #5
const int ldr = A5;  // the LDR I used to control pitches depending on the brightness
const int speaker = 8; // the speaker I used to emit sound
int buttonState1; // the variable to know if switch #1 is connected
int buttonState2; // the variable to know if switch #2 is connected
int buttonState3;  // the variable to know if switch #3 is connected
int buttonState4;  // the variable to know if switch #4 is connected
int buttonState5;  // the variable to know if switch #5 is connected
int maxBright = 0; // a variable to store the maximum brightness of environment for LDR
int minBright = 1023; // a variable to store the minimum brightness of environment for LDR

int melody[] = { // the frequencies to emit when the brightness is high as notes
  NOTE_C5, NOTE_D5, NOTE_E5, NOTE_F5, NOTE_G5
};
int melodyAlt[] = { // the alternate frequencies to emit when the brightness is low as notes
  NOTE_C3, NOTE_D3, NOTE_E3, NOTE_F3, NOTE_G3
};


void setup() {
  Serial.begin(9600);
}

void loop() {
  int ldrValue = analogRead(ldr); // reading the LDR value
  if (ldrValue > maxBright) { // setting the maxBrightness of LDR
    maxBright = ldrValue;
  }
  if (ldrValue < minBright) { // setting the minBrightness of LDR
    minBright = ldrValue;
  }
  int noteDuration = 1000 / 4; // how long the tone should play, in milliseconds
  int pauseBetweenNotes = noteDuration * 1.30; //  how long the program should wait after playing the tone

  buttonState1 = digitalRead(button1); // reading if the switches have been connected
  buttonState2 = digitalRead(button2);
  buttonState3 = digitalRead(button3);
  buttonState4 = digitalRead(button4);
  buttonState5 = digitalRead(button5);
  if (ldrValue > maxBright - 100) { // if the brightness is higher than this threshold, play the higher pitch
    if (buttonState1 == HIGH) { // if switch #1 is connected
      tone(speaker, melody[0], noteDuration); // playing the tone depending on which switch has been connected
      delay(pauseBetweenNotes); // delaying for the amount of time to pause between playing
      noTone(8); // stopping the tone, if this were not here, the tones would play simultaneously
    } else if (buttonState2 == HIGH) { // if switch #2 is connected
      tone(speaker, melody[1], noteDuration);
      delay(pauseBetweenNotes);
      noTone(8);
    } else if (buttonState3 == HIGH) { // if switch #3 is connected
      tone(speaker, melody[2], noteDuration);
      delay(pauseBetweenNotes);
      noTone(8);
    } else if (buttonState4 == HIGH) { // if switch #4 is connected
      tone(speaker, melody[3], noteDuration);
      delay(pauseBetweenNotes);
      noTone(8);
    } else if (buttonState5 == HIGH) { // if switch #5 is connected
      tone(speaker, melody[4], noteDuration);
      delay(pauseBetweenNotes);
      noTone(8);
    }
  } else if (ldrValue < maxBright - 100) { // if the brightness is lower than this threshold, play the lower pitch
    if (buttonState1 == HIGH) { // if switch #1 is connected
      tone(speaker, melodyAlt[0], noteDuration);
      delay(pauseBetweenNotes);
      noTone(8);
    } else if (buttonState2 == HIGH) { // if switch #2 is connected
      tone(speaker, melodyAlt[1], noteDuration);
      delay(pauseBetweenNotes);
      noTone(8);
    } else if (buttonState3 == HIGH) { // if switch #3 is connected
      tone(speaker, melody[2], noteDuration);
      delay(pauseBetweenNotes);
      noTone(8);
    } else if (buttonState4 == HIGH) { // if switch #4 is connected
      tone(speaker, melodyAlt[3], noteDuration);
      delay(pauseBetweenNotes);
      noTone(8);
    } else if (buttonState5 == HIGH) { // if switch #5 is connected
      tone(speaker, melodyAlt[4], noteDuration);
      delay(pauseBetweenNotes);
      noTone(8);
    }
  }

}
