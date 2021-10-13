import processing.sound.*;
PImage[] photos = new PImage[9]; // the array that holds all the pictures I used for my game
SoundFile song; // the variable that holds the soundfile I used for my game
int mouseClickCount = 0; // the variable that holds an integer that represents which "level" I'm at. For example, if I'm making my first choice in the game, it will be 1.
CustomBox[] customBoxArr = new CustomBox[4]; // the array that holds 4 CustomBox objects that is responsible for displaying the available choices to the player. 
float clickedBox; // the variable that holds the float that represents which box the player has chosen. Each box's identification float is unique because of how I calculated it. 
boolean gameEnded = false; // the boolean variable that represents whether the game has ended or not. The game will continue on displaying the choices for as long as this variable is false.



class CustomBox { // The class to build custom choice boxes from
  float xPos, yPos, xSize, ySize; // coordinates of the rectangle
  String textChoice; // the text of the choice box

  CustomBox( float _xPos, float _yPos, float _xSize, float _ySize, String _text) { // The constructor to build CustomBox objects
    xSize = _xSize;
    ySize = _ySize;
    xPos = _xPos;
    yPos = _yPos;
    textChoice = _text;
  }

  void drawBox() { // Simply draws the box
    fill(255, 255, 255);
    if (this.contains(mouseX, mouseY)) { // if a cursor is placed over the box, highlight it
      fill(100, 100, 100);
    }
    rect(xPos - 20, yPos, xSize, ySize);
    drawText(); // draws the text after drawing the box
  }
 
  void drawText() {  // draws the text inside the box 
    fill(0, 0, 0); // making the text black
    text(textChoice, xPos + 80, yPos + 20);
    fill(255, 255, 255); // reverting the color back to white as soon as we've displayed the text because the boxes will turn black as well.
  }

  boolean contains(float mx, float my) { // the method that's responsible for highlighting the choice box whenever the cursor is placed over it. Added for better user experience.
    if (mx > xPos && mx < xPos + xSize && my > yPos && my < yPos + ySize) { // if the mouse's x coordinate exists between the horizontal boundaries of the box AND the mouse's y coordinate exists between the vertical boundnaries of the box, the box contains the mouse cursor. 
      return true;
    } else {
      return false;
    }
  }
}

void introScreen() { // the intro screen of the game. Continues on to the game when the player clicks on their mouse.
  textSize(18);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Welcome to Different Choices!", 500, 450);
  text("In this game, you will encounter different scenarios based on your previous choices.", 500, 469);
  text("In each of the scenarios, you have 4 different choices that will impact how the game ends.", 500, 488);
  text("Click on your mouse to begin.", 500, 506);
}

void endScreen() { // After the game ends in a certain way, the player will be redirected to this screen which offers restart functionality. 
  background(0, 0, 0); 
  text("You have come to the end of your journey. \nYou can restart the game and explore other options", 500, 300);
  customBoxArr[0] = new CustomBox(410, 400, 210, 35, "Click here to restart"); // Replace the first box in the array with a choice box, which will restart the game when clicked upon. This box will be recognized in the mouseClicked function.
  customBoxArr[0].drawBox();
}

void gameDisplay() { // the main function that displays the game
  if (gameEnded == false) { // only show this screen if the game has not ended
    if (mouseClickCount == 0) { // mouseClickCount == 0 means the game has just started / been restarted. In that case, show intro screen.
      introScreen();
    } else if (mouseClickCount == 1) { // the first "level" of the game
      background(0, 0, 0);
      text("You are attending your Intro to IM Class and \nMichael is talking", 500, 300);
      customBoxArr[0] = new CustomBox(180, 400, 240, 35, "Ditch the Class");
      customBoxArr[1] = new CustomBox(600, 400, 240, 35, "Pay Close Attention");
      customBoxArr[2] = new CustomBox(180, 500, 240, 35, "Say something stupid");
      customBoxArr[3] = new CustomBox(600, 500, 240, 35, "Say something smart");
      for (int i = 0; i < 4; i++) {
        customBoxArr[i].drawBox(); // drawing each of the 4 boxes
      }
      image(photos[0], 250, 600, 500, 350); // displaying the picture that accompanies this level
    } else if (mouseClickCount == 2) { // the second "level" of the game
      background(0, 0, 0);
      if (clickedBox == 2.0) {
        text("You exited the zoom session and now you \nare sitting in front of your laptop", 500, 300);
        customBoxArr[0] = new CustomBox(180, 400, 260, 35, "Go out of your room");
        customBoxArr[1] = new CustomBox(600, 400, 260, 35, "Play some Valorant");
        customBoxArr[2] = new CustomBox(180, 500, 260, 35, "Take a nap");
        customBoxArr[3] = new CustomBox(600, 500, 260, 35, "      Start making some music");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[1], 250, 600, 500, 350);
      } else if (clickedBox == 3.0) {
        text("You paid close attention and have learned some interesting Processing tricks.\nBut now you feel like you've accomplished today's goal in the course and \nfind yourself longing for something else.", 500, 300);
        customBoxArr[0] = new CustomBox(180, 400, 320, 35, "         Time to go on social media");
        customBoxArr[1] = new CustomBox(600, 400, 320, 35, "           Keep paying close attention");
        customBoxArr[2] = new CustomBox(180, 500, 320, 35, "                Send DM to your crush on Zoom");
        customBoxArr[3] = new CustomBox(600, 500, 320, 35, "               Turn your camera off and vape");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[0], 250, 600, 500, 350);
      } else if (clickedBox == 4.0) {
        text("You said something stupid and you notice \nsome weak chuckles around the Zoom session", 500, 300);
        customBoxArr[0] = new CustomBox(180, 400, 320, 35, "     Keep saying stupid stuff");
        customBoxArr[1] = new CustomBox(600, 400, 320, 35, "                Wallow over what you just said");
        customBoxArr[2] = new CustomBox(180, 500, 320, 35, "                     Become quiet from embarrassment");
        customBoxArr[3] = new CustomBox(600, 500, 320, 35, "   Try to overcompensate");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[0], 250, 600, 500, 350);
      } else if (clickedBox == 5.0) {
        text("You said something smart and are now real smug!\nYou feel like you can take on the world!", 500, 300);
        customBoxArr[0] = new CustomBox(180, 400, 320, 70, "         Keep saying smart stuff");
        customBoxArr[1] = new CustomBox(600, 400, 320, 70, "                  Convert that smug energy into \nconfidence");
        customBoxArr[2] = new CustomBox(180, 500, 320, 70, "                       Open your browser and start \n                 looking up what you just said");
        customBoxArr[3] = new CustomBox(600, 500, 320, 70, "                   Become passive because you're \n    too smart for this class");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[0], 250, 600, 500, 350);
      }
    } else if (mouseClickCount == 3) { // the third "level" of the game
      background(0, 0, 0);
      if (clickedBox == 6.0) {
        text("There has been a fire and you are being asked \nto evacuate by Public Safety.", 500, 300);
        customBoxArr[0] = new CustomBox(180, 400, 260, 35, "     No! I'll stay in my room!");
        customBoxArr[1] = new CustomBox(600, 400, 260, 35, "Calmly evacuate");
        customBoxArr[2] = new CustomBox(180, 500, 260, 35, "Start panicking");
        customBoxArr[3] = new CustomBox(600, 500, 260, 35, "    Help put off the fire");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[2], 250, 600, 500, 350);
      } else if (clickedBox == 11.0) {
        text("You start playing some Valorant. But you forgot to exit your Discord, and Michael \nhas noticed that you're playing a game and have ditched the class.\nYou fail Intro to IM.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Oh no! Next?"); 
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, ""); // when the other 3 boxes are empty like this, it means this storyline is reaching its end. The only available button is redirects the player to the end screen (while displaying a unique reaction).
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[0].drawBox();
        image(photos[3], 250, 600, 500, 350);
      } else if (clickedBox == 18.0) {
        text("You take a deep long nap. But you never wake up. \nThere are some bad times to take a nap, friend.\nI know this is dark, but that's just how life is sometimes.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Um, what?");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[6], 250, 600, 500, 350);
      } else if (clickedBox == 27.0) {
        text("You made some DOPE music.\nWhat do you do now?", 500, 300);
        customBoxArr[0] = new CustomBox(180, 400, 320, 70, "         Share it with the world!");
        customBoxArr[1] = new CustomBox(600, 400, 320, 70, "                  Keep working on that \nmasterpiece");
        customBoxArr[2] = new CustomBox(180, 500, 320, 70, "                       Send it ONLY to your \n                 crush in class");
        customBoxArr[3] = new CustomBox(600, 500, 320, 70, "                   Not satisfied, but too \n         wornout to keep working");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[4], 250, 600, 500, 350);
      } else if (clickedBox == 7.0) {
        text("Your time in social media has consumed all your energy.\nDo not ever go on social media during online classes.\nYou fail all your classes.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "I regret it.");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[3], 250, 600, 500, 350);
      } else if (clickedBox == 12.0) {
        text("You keep your participation during the class. \nMichael is really happy at least one person is participating for once\nand gives you an A in his class.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "WOW! I rock!");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[8], 250, 600, 500, 350);
      } else if (clickedBox == 19.0) {
        text("You finally muster up all your courage and sends a DM to your crush on Zoom.\nTurns out, she's really interested in you as well.\nYou were able to build a really healthy and rewarding relationship with her.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Yeah, life!");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }        
        image(photos[5], 250, 600, 500, 350);
      } else if (clickedBox == 28.0) {
        text("You took a long satisfying hit from the vape. Feels real good, doesn't it? \nSmoking's cool! But as you were exhaling smoke, you suddenly feel your lungs failing.\nYou die. Didn't someone teach you smoking was bad?", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "I regret it.");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[6], 250, 600, 500, 350);
      } else if (clickedBox == 8.0) {
        text("Everyone in the class was so patient about what you were saying, \neven if they knew it was stupid. Their patience has inspired you a lot.\nYou start applying yourself and ACE the course!", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Thanks everyone!");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[8], 250, 600, 500, 350);
      } else if (clickedBox == 13.0) {
        text("You know, my friend, there are few things in life worth wallowing over.\nPlease accept this fourth wall breaking hug from me.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Thanks.");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
      } else if (clickedBox == 20.0) {
        text("Your crush in class noticed your embarrassment and offered you some comfort.\nYou guys really hit it off, and built a really happy relationship together.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Thanks my love!");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[5], 250, 600, 500, 350);
      } else if (clickedBox == 29.0) {
        text("You overcompensated and started talking about things you yourself didn't understand.\nCongratulations, you played yourself.\nNow everyone hates you.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "I'm sorry...");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
      } else if (clickedBox == 9.0) {
        text("Wow, can't contain the genius, can you?\nYou grow up to win the Nobel Prize for Class Genius.\nDefinitely not sarcasm. Congratulations.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Yay, I guess?");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
      } else if (clickedBox == 14.0) {
        text("Your confidence growing really put you into perspective.\nThen you question why you're even playing this game.\n Just by questioning that, you have won this game. Congratulations!", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Thanks!");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
      } else if (clickedBox == 21.0) {
        text("You wanted to just look something up.\nBut it's really easy to steer off course on the internet.\nThat distraction makes you fail the course.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Oh no...");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[3], 250, 600, 500, 350);
      } else if (clickedBox == 30.0) {
        text("You think you're too good for Intro to IM, don't you?\nWell, you're not. You fail this course and every other courses.\nThat passiveness will really cost you in the future, friend.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "I don't need them");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[3], 250, 600, 500, 350);
      }
    } else if (mouseClickCount == 4) { // the fourth "level" of the game
      background(0, 0, 0);
      if (clickedBox == 14.0) {
        text("You die in the fire.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Fire safetyn't");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[6], 250, 600, 500, 350);
      } else if (clickedBox == 33.0) {
        text("As you walk out of your residential building, you see an enormous dragon.\n He admits to starting the fire.", 500, 300);
        customBoxArr[0] = new CustomBox(180, 400, 320, 70, "                 Take out your sword and slay it!");
        customBoxArr[1] = new CustomBox(600, 400, 320, 70, "                  Ask him why he started the fire");
        customBoxArr[2] = new CustomBox(180, 500, 320, 70, "                       Ignore it completely");
        customBoxArr[3] = new CustomBox(600, 500, 320, 70, "                         Pet it");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[7], 250, 600, 500, 350);
      } else if (clickedBox == 70.0) {
        text("You chose to panic and eventually fainted.\n The fire got to you. Sorry about this.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Oh no...");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[6], 250, 600, 500, 350);
      } else if (clickedBox == 131.0) {
        text("You are not a firefighter. You couldn't do anything and died in the fire.\nShould have listened to public safety.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "SIKE");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[6], 250, 600, 500, 350);
      } else if (clickedBox == 35.0) {
        text("After sharing your work, you quickly rose into superstardom.\nEvery paper is talking about you, you are officially famous.\nCongratulations!", 500, 300);
        customBoxArr[0] = new CustomBox(400, 400, 260, 35, "              Here I come, Hollywood!");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
      } else if (clickedBox == 54.0) {
        text("You kept working and working on it.You created something that would \nforever be regarded as the greatest piece of music ever written.\nYou made it!", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "DoReMiSoLaSiDo");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
      } else if (clickedBox == 91.0) {
        text("After you sent her the music piece you've created, she gave it a listen\nand felt so much soul from it. You guys fell in love and went on\nto live a happy and fulfilling life.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Yeah, life!");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[5], 250, 600, 500, 350);
      } else if (clickedBox == 152.0) {
        text("There are moments in life when you are totally wornout to do the things\nyou enjoy doing, no matter how much you enjoy doing them.\nIt's all good, take a deep breath, and get some rest.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "Thanks. zzz");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
      }
    } else if (mouseClickCount == 5) { // the fifth "level" of the game
      background(0, 0, 0);
      if (clickedBox == 49.0) {
        text("You angered the dragon and it killed you with its fiery breath.\nBesides, you don't even have a sword! Come on, be serious.\nWe are not living in an imaginary world.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "But are dragons.. real?");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[6], 250, 600, 500, 350);
      } else if (clickedBox == 114.0) {
        text("After some inquisitveness from your end, the dragon admits\nto acting out from loneliness. But you two really hit it off\nand it took you as its new best friend!", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "RAWR!");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[5], 250, 600, 500, 350);
      } else if (clickedBox == 289.0) {
        text("After being completely ignored by you, the dragon, being the insecure\nbeast it is, took you down with its fiery breath.\nHow can you ignore something so big though?", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "I was scared...");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[6], 250, 600, 500, 350);
      } else if (clickedBox == 658.0) {
        text("After you tried to pet it, the dragon, feeling humiliated,\nchomped on you with its huge teeth.", 500, 300);
        customBoxArr[0] = new CustomBox(430, 400, 200, 35, "SIKE");
        customBoxArr[1] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[2] = new CustomBox(0, 0, 0, 0, "");
        customBoxArr[3] = new CustomBox(0, 0, 0, 0, "");
        for (int i = 0; i < 4; i++) {
          customBoxArr[i].drawBox();
        }
        image(photos[6], 250, 600, 500, 350);
      }
    }
  }
}


void setup() {
  SoundFile song = new SoundFile(this, "1.wav"); // loading the song
  song.loop(); // making sure that the song never ends

  for (int i = 0; i < 9; i++) { // loading each image from the data directory into the photos array
    photos[i] = loadImage("pic" + (i + 1) + ".png");
  }

  size(1000, 1000);
  background(0, 0, 0);
}

void draw() {
  if (gameEnded == false) { // display the game for as long as the game has not ended
    gameDisplay();
  } else {
    endScreen(); // display the end screen if the game has ended
  }
}

void mouseClicked() {
  if (gameEnded && customBoxArr[0].contains(mouseX, mouseY)) { // if this condition is true, it means that the user has clicked on the restart button. This code block resets the relevant variables to restart the game.
    gameEnded = false;
    mouseClickCount = 0;
    clickedBox = 0;
  }
  if (mouseClickCount == 0) {
    mouseClickCount++; // if mouse is clicked when mouseClickCount == 0, it means that the player will move on from the intro screen. No other functionality required other than incrementing the variable.
  } else {
    for (int i = 0; i < 4; i++) { // checking which of the four available choice boxes has been clicked. 
      if (customBoxArr[i].contains(mouseX, mouseY)) {
        clickedBox = pow(i + 2, mouseClickCount) + clickedBox; // assigning a unique id for each boxes so that the game knows which way to go after a box has been selected.
        mouseClickCount++; // ascending to the next "level"
      }
    }
  }
  // Checking for game endings by the "level" and box id.
  if (mouseClickCount == 4 && clickedBox == 19.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 26.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 15.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 20.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 27.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 36.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 16.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 21.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 28.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 37.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 17.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 22.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 29.0) {
    gameEnded = true;
  } else if (mouseClickCount == 4 && clickedBox == 38.0) {
    gameEnded = true;
  } else if (mouseClickCount == 5 && clickedBox == 107.0) {
    gameEnded = true;
  } else if (mouseClickCount == 5 && clickedBox == 30.0) {
    gameEnded = true;
  } else if (mouseClickCount == 5 && clickedBox == 86.0) {
    gameEnded = true;
  } else if (mouseClickCount == 5 && clickedBox == 147.0) {
    gameEnded = true;
  } else if (mouseClickCount == 5 && clickedBox == 51.0) {
    gameEnded = true;
  } else if (mouseClickCount == 5 && clickedBox == 70.0) {
    gameEnded = true;
  } else if (mouseClickCount == 5 && clickedBox == 168.0) {
    gameEnded = true;
  } else if (mouseClickCount == 6 && clickedBox == 81.0) {
    gameEnded = true;
  } else if (mouseClickCount == 6 && clickedBox == 146.0) {
    gameEnded = true;
  } else if (mouseClickCount == 6 && clickedBox == 321.0) {
    gameEnded = true;
  } else if (mouseClickCount == 6 && clickedBox == 690.0) {
    gameEnded = true;
  }
}
