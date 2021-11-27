# Final Project Documentation

### Coming up with the Concept

Ever since this class started, I have been yearning for building things and seeing how a piece of code in my computer can interact with the real world. 
Therefore, I was excited when we started working with Arduino, and learning how we can interface between Arduino and Processing was the cherry on top.
Ever since the first class we had, since Michael introduced us the syllabus to us, highlighting some sample final projects, I knew I wanted to be able to build robots by the end of the class. So, I propose to build a small robot that is controlled through my computer in Processing. Since the robot needs to be mobile, we'll use a radio component to communicate between 2 Arduino microcontrollers: one hooked up to the Processing in my computer and transmitting the message, the other in the robot, receiving the message. Overall, I am extremely excited to see how my project turns out. I am teaming up with my classmate Afra Almazroui for this project.

### Finalized Concept - A Robot in a Maze

We will build a two wheeled robot controlled from Processing on the laptop. For this, we will use two Arduino microcontrollers: one Arduino will be connected to the laptop, receiving input from Processing and transmitting that message to the remote Arduino using a radio component, and the remote Arduino will receive that message and perform the actions by activating the motor. Then, after we get the final product, we want the users to interact with our robot by navigating it through a maze.

### Description of the Arduino Program

There will be two Arduino microcontrollers in this project, therefore there will be two different programs. The first Arduino program will receive commands from the Processing program, and transmit that command through the radio. The second program will receive the command through the radio and will be responsible for utilizing the motors to move the robot. 

### Description of the Processing Program

The Processing program will display 4 squares (Forward, Backward, Left, Right) to provide a user interface to the person controlling the robot. These squares, when clicked, will move the robot in the aforementioned direction. The robot can also be controlled by the 4 arrow keys. 

### Risks, most complicated, or most unknown parts

  - Complicated:

    - One of the most complicated things we will have to do for this project is making sure that the radio is connected to the breadboard and DC motors of our robot, and that it can be controlled through processing. 
Calculating the dimensions of the robot and the maze is complicated and a bit time consuming, but easy to figure out. 

  - Risks:
    - Since we are a group, we will have to be coordinated and on track of each other’s progress.

  - Unknown part:

    - We are still figuring out how to use a radio transmitter, but we know the schematics of how to connect it. 

