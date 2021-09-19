 //Setting the HEIGHT and WIDTH as global variables ready to be used anywhere in the code.
int WIDTH = 1000;
int HEIGHT = 1000;


class CustomBox { // The class to build custom rectangles from
  float xPos, yPos, xSize, ySize; // coordinates of the rectangle

  CustomBox( float _xPos, float _yPos, float _xSize, float _ySize) { // The constructor to build CustomBox objects
    xSize = _xSize;
    ySize = _ySize;
    xPos = _xPos;
    yPos = _yPos;
  }

  void drawBox() { // Simply draws the box
    fill(255, 255, 255);
    rect(xPos, yPos, xSize, ySize);
  }
}

class CustomTriangle { // The class to build custom triangles from
  float x1, y1, x2, y2; // coordinates of the triangle, need only 2 pairs because the 3rd pair will be at the origin point generated randomly
  
  // Random color variables
  float redValue = random(255);
  int greenValue = 0;
  float blueValue = random(100);
  float angle = 0; // The angle at which the triangles would rotate per calling of the draw method. Starts at 0 because it will be incremented later
  float translateValueX = random(WIDTH); // The randomly generated value to be declared as the x point of the origin through the translate function 
  float translateValueY = random(HEIGHT); // The randomly generated value to be declared as the y point of the origin through the translate function

  CustomTriangle( float _x1, float _y1, float _x2, float _y2) { // Constructor to build custom triangles from
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
  }

  void drawTriangle() { // Drawing the triangle and also calling the translate and rotate methods reponsible for the rotate animation
    fill(redValue, greenValue, blueValue);
    pushMatrix();
    translate(translateValueX, translateValueY);
    angle += 0.01;

    rotate(angle / 2);
    triangle(0, 0, x1, y1, x2, y2);


    popMatrix();
  }
}
// The arrays to store objects made from the 2 classes
CustomBox[] customBoxArr = new CustomBox[parseInt(random(50))];
CustomTriangle[] customTriangleArr = new CustomTriangle[customBoxArr.length / 6];



void setup() {

  size(1000, 1000);
  background(0, 0, 0);
  // Filling the arrays through a for loop
  for (int i = 0; i < customBoxArr.length; i++) {
    customBoxArr[i] = new CustomBox(random(WIDTH), random(HEIGHT), random(WIDTH / 3), random(HEIGHT / 3));
    customBoxArr[i].drawBox();
  }
  for (int i = 0; i < customTriangleArr.length; i++) {
    customTriangleArr[i] = new CustomTriangle(random(WIDTH), random(HEIGHT), random(WIDTH), random(HEIGHT));
  }
}

void draw() {

// Animating the triangles by accessing each triangle object and calling its draw method.
  for (int i = 0; i < customTriangleArr.length; i++) {
    customTriangleArr[i].drawTriangle();
  }
}
