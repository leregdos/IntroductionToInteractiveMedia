PImage img;
size( 800, 800);
img = loadImage("flag.gif");
noStroke();

// This part is used to draw the flag
fill(255, 0, 0);
rect(200, 20, 150, 200);
fill(0, 0, 255);
rect(350, 20, 150, 200);
fill(255, 0, 0);
rect(500, 20, 150, 200);
image(img, 200, 20);

// This part is used to draw my head
fill(155, 155, 155);
circle(350, 490, 30);

// This part is used to draw my body
stroke(0, 0, 0);
strokeWeight(4);
line(350, 505, 350, 555);

// This part is used to draw my limbs

line(350, 555, 335, 597);
line(350, 555, 365, 597);
line(350, 520, 320, 520);
line(350, 520, 380, 520);
line(320, 520, 310, 500);
line(380, 520, 390, 500);


// This part is used to draw the grassland
noStroke();
fill(0, 200, 0);
rect(0, 600, 800, 200);
