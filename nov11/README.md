# Nov 11 Homework Documentation

### Coming up with the concept

For me, it was sort of ingrained to me that a digital input should correspond to a digital output and an analogue input should correspond to an analogue output. But after reading the instructions for this assignment, I gave myself some time to think of an idea for a circuit. Then, I realized that I could use digital input to control an analogue output and an analogue input to control a digital output! Therefore, I was set on the concept that one set of digital LED outputs would be controlled by what'd be read by the analogue input and another set of analogue LED outputs would be controlled by what'd be read by the digital input. To me, coming up with this was the creative process. 

### The process

As soon as I came up with the concept for my circuit, I started thinking of possible analog inputs I could use, and the LDR seemed like a good one. The LEDs could turn off if the environment is bright and turn on if the environment is dark. Soon after that, I also decided to use the button switch as a digital input. However, I was stumped on how I could creatively use a digital input that's either HIGH or LOW to control an analog output that has its values on a range (0, 255). But then I realized that I could just use a variable to store how many times a button was being pressed! Now I had 2 LEDs that turn brighter and brighter as I click on the button. I wanted it to do more than that. For example, the two LEDs could alternate in brightness. It could be that while one LED is bright, the other could be dim and vice versa. `map()` was a great function to use in this case. But what would happen if the two LEDs reached the maximum brightness? I could start decrementing their values if the value reached 255. The final product was a circuit that turned an LED on if the brightness was low and off if the brightness was high, and "transferred the light" between LEDs depending on how many times the button is being pressed.

### Problems I have encountered

### Interesting things I have learned

### References
  - [The schematic](391A6767-AF5C-469F-9D24-76B9FC709A78.jpeg)
  - [The photograph](photograph.HEIC)
  - [The video](https://drive.google.com/file/d/1WmlqJ-Ex7w8RWcAltxXLqwofbWYuSDoK/view?usp=sharing)
