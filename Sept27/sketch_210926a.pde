// Indexing each row by classification to form the poetry when reading the CSV file
final int PERSON = 0;
final int ACTION = 1;
final int FEELING = 2;
final int INTENTION = 3;
final int RECIPIENT = 4;
final int SOUND = 5;
final int ENVIRONMENT = 6;
////////////////////////////////////////////////
String strings[]; 
String articles[] = {"The ", "Her ", "His ", "Their ", "My "}; // The articles that would precede each line


String generatePoetry () { // The function to generate poetry from the CSV file. As each row in the CSV file contains 7 items in sequence of their classification, 
// we choose a random row using the chosenRow[] array variable and access the specific index for each element of the poem (PERSON, ACTION, FEELING, INTENTION, RECIPIENT, SOUND, and ENVIRONMENT).
  String returnStr = ""; // we use this returnStr variable to concatenate all the strings we got from the randomly chosen row.
  String chosenRow[];
  chosenRow = split(strings[int (random(strings.length))], ',');
  String article = articles[int(random(articles.length))];
  returnStr += article;
  returnStr += chosenRow[PERSON];
  chosenRow = split(strings[int (random(strings.length))], ',');
  returnStr += " ";
  returnStr += chosenRow[ACTION];
  returnStr += " feeling ";
  chosenRow = split(strings[int (random(strings.length))], ',');
  returnStr += chosenRow[FEELING];
  chosenRow = split(strings[int (random(strings.length))], ',');
  returnStr += " to ";
  returnStr += chosenRow[INTENTION];
  chosenRow = split(strings[int (random(strings.length))], ',');
  returnStr += " ";
  returnStr += article.toLowerCase();
  returnStr += chosenRow[RECIPIENT];
  returnStr += " ";
  chosenRow = split(strings[int (random(strings.length))], ',');
  returnStr += chosenRow[SOUND];
  chosenRow = split(strings[int (random(strings.length))], ',');
  returnStr += " in the ";
  returnStr += chosenRow[ENVIRONMENT];
  return returnStr;
}


class GeneratedText { // The generated text class that determines where the poem is drawn and how big the text size will be.
  int red, green, blue, xCoor, yCoor, size; // the color variables and position variables and the size variable
  String text;
  int countMove = 0;

  GeneratedText(int x, int y, int rValue, int gValue, int bValue, int sizeArg) {
    xCoor = x;
    yCoor = y;
    red = rValue;
    green = gValue;
    blue= bValue;
    size = sizeArg;
  }
  void textDraw() { // this method is responsible for drawing the poem based on the location and painting it with random color. 
    textSize(size);
    fill(red, green, blue);
    textAlign(LEFT);
    text(text, xCoor, yCoor);
    if (countMove < 4) { // added this if statement to make sure the poem is not too blurred
      moveText();
    }
  }

  void moveText() {// This method is to blur the text by moving it by a certain count so that it doesn't get too blurry

    xCoor++;
    yCoor++;
    countMove++;
  }
}

GeneratedText[] textArr = new GeneratedText[int(random(3, 13))]; // an array of random length that holds poems

void setup() {
  size(1000, 1000);
  background(10, 25, 34);
  strings = loadStrings("data.csv"); // loading the csv file
  for (int i = 0; i < textArr.length; i++) { // populating the array using for loop
    String poetry = generatePoetry();
    GeneratedText generatedText = new GeneratedText(0, int(random(height - 200)), int(random(255)), int(random(255)), int(random(255)), int(random(20, 40)));
    textArr[i] = generatedText;
    textArr[i].text = poetry;
  }
}

void draw() {
  for (int i = 0; i < textArr.length; i++) { // drawing each poem using their textDraw method.
    textArr[i].textDraw();
  }
}
