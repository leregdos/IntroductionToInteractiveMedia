import processing.serial.*;
Serial myPort; // initializing serial
CustomBox[] customBoxArr = new CustomBox[5]; // custom box array
float clickedBox = 5; // a variable to keep track of which direction was pressed

class CustomBox { // The class to build custom direction boxes from
  float xPos, yPos, xSize, ySize; // coordinates of the rectangle
  String textChoice; // the text on the box

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
    textSize(32);
    text(textChoice, xPos, yPos + 30);
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

void setup() {
  size(1000, 1000);
  background(0, 0, 0);
  customBoxArr[0] = new CustomBox(420, 200, 200, 50, "Forward"); // Making new direction box objects and adding it to the array
  customBoxArr[1] = new CustomBox(130, 465, 200, 50, "Left");
  customBoxArr[2] = new CustomBox(750, 465, 200, 50, "Right");
  customBoxArr[3] = new CustomBox(420, 780, 200, 50, "Backward");
  customBoxArr[4] = new CustomBox(440, 465, 150, 50, "Stop");
  String portname=Serial.list()[0]; // getting the first available serial
  myPort = new Serial(this, portname, 9600); // instantiating a new Serial object
  myPort.clear(); // clearing the buffer
}

void draw() {
  for (int i = 0; i < 5; i++) { // drawing each box using a for loop
    customBoxArr[i].drawBox();
  }
  if (clickedBox == 0) { // execute based on which box was clicked
    myPort.write(0 + "\n");
  } else if (clickedBox == 1) {
    myPort.write(1 + "\n");
  } else if (clickedBox == 2) {
    myPort.write(2 + "\n");
  } else if (clickedBox == 3) {
    myPort.write(3 + "\n");
  } else if (clickedBox == 4) {
    myPort.write(4 + "\n");
  }
  println(clickedBox);
}

void mouseClicked() {
  for (int i = 0; i < 5; i++) { // checking which of the four available choice boxes has been clicked. 
    if (customBoxArr[i].contains(mouseX, mouseY)) {
      clickedBox = i;
    }
  }
}
void keyPressed() {
  if (keyCode == UP) { // aside from checking which direction was clicked by the mouse, check if the user is clicking any of the 4 direction buttons, or the space bar (stop).
    clickedBox = 0;
  } else if (keyCode == DOWN) {
    clickedBox = 3;
  } else if (keyCode == RIGHT) {
    clickedBox = 2;
  } else if (keyCode == LEFT) {
    clickedBox = 1;
  } else if (key == ' ') {
    clickedBox = 4;
  }
}
