boolean mouseWasPressed = false;

int circleCoordinateX = 0;
int circleCoordinateY = 500;
int circleDiameter = 30;
int lineCoordinateY = circleCoordinateY;
boolean right = true;
boolean toBottomLine = true;
boolean toTopCircle = true;

void setup() {

  size(1000, 1000);
  background(0, 0, 0);

  // For Loop Responsible for the background colors
  for (int i = 0; i < 1000; i+= 5) {
    fill(random(255), random(255), random(255));
    ellipse(500, i, 1000, 5);
  }
}

void moveComponents(){// This function is mainly responsible for moving the circle and the line
  
    if (right) { // if the circle or the line has reached the horizontal boundary, I want them to bounce back, this right boolean variable is changed everytime the horizontal boundary has been reached
      circleCoordinateX++;
    } else {
      circleCoordinateX--;
    }
    if (circleCoordinateX >= 1000) {
      right = false;
    } else if (circleCoordinateX <=0) {
      right = true;
    }
    
    if (lineCoordinateY >= 1000) { // If the line reaches the bottom border, it bounces back and starts going upwards
      toBottomLine = false;
    } else if (lineCoordinateY <= 0) {
      toBottomLine = true;
    }
    
    if (toBottomLine) { // to make the line go down if it's going downwards, up if it's going upwards
      lineCoordinateY++;
    } else {
      lineCoordinateY--;
    }
    
    
    
    if (circleCoordinateY >= 1000) { // If the circle reaches the top border, it bounces back and starts going downwards
      toTopCircle = true;
    } else if (circleCoordinateY <= 0) {
      toTopCircle = false;
    }
    if (toTopCircle) { 
      circleCoordinateY--;
    } else {
      circleCoordinateY++;
    }
}

void draw() {
  if (mousePressed == true) {
    // The next 2 lines are to alter the behavior of the moving parts when the mouse is pressed
    lineCoordinateY--;
    circleCoordinateY++;

    circle(circleCoordinateX, circleCoordinateY, circleDiameter); // drawing the circle
    stroke(random(255), random(255), random(255)); // adding random coloring to the line
    strokeWeight(4); 
    line(circleCoordinateX, lineCoordinateY, circleCoordinateX, lineCoordinateY + 43); // drawing the line
    moveComponents();

  } else {

    circle(circleCoordinateX, circleCoordinateY, circleDiameter);
    stroke(random(255), random(255), random(255));
    strokeWeight(4);
    line(circleCoordinateX, lineCoordinateY, circleCoordinateX, lineCoordinateY + 43);
    moveComponents();
  }
}
