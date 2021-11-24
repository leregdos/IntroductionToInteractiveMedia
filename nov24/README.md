# Nov 24 Homework Documentation

### The process

As the two tasks of this assignment resembled heavily the class work we did on the 16th, the codes for the assignment was built upon the code we worked with in the class. As the first task was to change a circle's X coordinate on Processing by reading from an analog input on Arduino, I used a potentiometer as it can be used to easily change the value manually, and sent its values to Processing through the Serial object. In processing, I would make sure that the values being received was in the range of the canvas' width by using the `map` function. As a result, I could interact with my circuit and see the result in Processing, on my computer. 

The second task was to control an LED's brightness through Processing. I built upon the code from the previous task, and added a functionality of moving the circle horizontally using the `LEFT` and `RIGHT` buttons on the computer. As the X coordinate of the circle changed, I would send that value to Arduino, which would map it to a value between 0 and 255. As a result, I could control the LED's brightness on my circuit from my computer using the `LEFT` and `RIGHT` buttons. 

### Difficulties I have encountered and their workarounds

For the both tasks, the whole concept of interfacing between Arduino and Processing through the Serial was something quite tough to wrap my head around. Therefore, before I started working on this assignment, I carefully rewatched the class recording several times to really understand how it was working. 

### Interesting observations I have made

By working on this assignment, I had the chance to observe that as we can interface between the Arduino IDE and Arduino circuit through the Serial monitor, we can interface between Processing and the Arduino circuit through Serial as well. We just have to make sure that the Processing code is equipped to receive input from Serial.

### References
  - [Task 1 Circuit Picture](https://drive.google.com/file/d/1CyClcV83YPd8eckGVsJQY37P18LcsmUh/view?usp=sharing)
  - [Task 1 Schematic Picture](https://drive.google.com/file/d/1MVqyohC_FEEX8FbM1Axi_MAPkseIlz3R/view?usp=sharing)
  - [Task 1 Video](https://drive.google.com/file/d/17WEEHG2kHCV7iQ97rKJ5oTT8OXFM6rik/view?usp=sharing)
  - [Task 2 Circuit Picture](https://drive.google.com/file/d/1hVGY8qCOYR2NkI_YDN4gh8wiHZACzXfu/view?usp=sharing)
  - [Task 2 Schematic Picture](https://drive.google.com/file/d/1-3SQabfMJlqi-TBE0_1-uzBoZjhW8mR5/view?usp=sharing)
  - [Task 2 Video](https://drive.google.com/file/d/1o2k-azGPrWf5ZpMFZHQ7DAccyxmF3uMX/view?usp=sharing)
