# Nov 24 Extra Credit Homework Documentation

### The process

As I had built the foundation of Arduino and Processing interfacing by working on the previous Nov24 assignment, the interfacing part was not a big issue for me. However, conceptually, I still couldn't quite wrap my head around how the interfacing can function as a game. Then, I came up with the idea that the user can perform the simplest of interactions on the circuit and see its results on Processing, and that can count as a game as the results would pan out differently depending on the interaction. To complete this assignment, I built upon the ball bouncing example we worked on in class. I built a circuit on Arduino with only a button switch, and when it was clicked, the ball would "jump" and increase in size. When the ball reached its maximum size, it would "pop" and turn into a small ball. As how the ball bounced was dependent on its size, the interaction was really fun to look at: the bigger the ball, the slower it bounced, and the smaller it was, the faster it bounced. 

### Difficulties I have encountered and their workarounds

The first and most peculiar issue I encountered was that my switch button was not working properly. Whenever I clicked it, the Arduino circuit was turning on and off. After some time debugging, I realized that the issue was caused by the simplest error: I had hooked my input wire incorrectly. I immediately fixed the wiring, and it was working properly.

The second issue I faced was more conceptual. I didn't understand what type of interaction between Arduino and Processing could constitute a game. But I understood that anything that the user can interact with and be entertained from the interaction could be a game.

### Interesting observations I have made

By working through the first issue, I observed that even if we're quite capable of working with Arduino as per our experience, we are still prone to the simplest of errors. I think a little carefulness when building the circuit is never out of place.

### References
  - [The picture of my circuit](https://drive.google.com/file/d/1_yY4bU7PgxKJl4p_TW40mqcLHFrOhXg_/view?usp=sharing)
  - [The picture of my schematic](https://drive.google.com/file/d/1HbFEEwf3K-7-g6_Ahi0-DVd9DSXhpjZm/view?usp=sharing)
  - [The video](https://drive.google.com/file/d/1rD8FsWS8K3BG-u0eeqK1RD_1bhdUaG43/view?usp=sharing)
