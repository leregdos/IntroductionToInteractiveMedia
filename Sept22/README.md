# Sept22 Homework Documentation

### The process

Before I started my work on this project, I was extremely tempted to re-use my last homework code since I have learned that what I did on the previous homework is a generative artwork. I could have just made the circle and the line in the previous code separate Objects and be done with it. However, that seemed a bit uninspired to me, and I really wanted to get my hands on the new functions I've learned from the Homework Readings (`rotate()`, `scale()`, and `translate()`). Therefore, I reset my whole canvas.

First, I created the classes from which I could construct the shapes to appear on the canvas. I have created the `CustomBox` and `CustomTriangle` classes, which would be responsible for portraying the shapes on the screen. 

Then, I moved on to create the movement methods for each class. Originally, the rectangles were moving side to side, up and down depending on its location. And the triangles were rotating around their given origin, which was generated randomly. The result of such overlapping actually did not satisfy me, so I tampered around a little and discovered that it was actually better if the rectangles did not move and later eclipsed by the rotating triangles. 

In the final version of the code, a random number of rectangles (CustomBox objects), whose coordinates are generated randomly proportionate to the canvas size, are created and stored in an Object Array. The draw methods for these boxes are called at the start and never again. A random number of triangles (CustomTriangle objects) dependant on the number of rectangles are then generated and stored in the array. The draw method for these triangles, which is responsible for mainly rotating the triangle, are called in the draw function. 


### Difficulties I have faced

Aside from deciding if I should rewrite my old code (easier) or start from scratch (more creative), I kept getting a `NullPointerException` on my Processing code, which frustrated me a lot. But I was able to debug my code after Googling around a lot. The page that helped me out a lot in debugging the code has been referenced below. I was not initializing my object array when declaring them. Small issue, but very hard to identify. Perhaps the smaller the issue is, the harder it is to spot it from the code. 


### Interesting Observations I have made

It felt bizarre to me that after doing all these coding to make sure the rectangles bounce around in the canvas, I decided to delete all the moving part. Perhaps sometimes, more could be less? 


### References
- Homework Reading 1 ([link](https://www.youtube.com/watch?v=o9sgjuh-CBM)).
- Null Pointer Exception Solution ([link](https://forum.processing.org/two/discussion/8071/why-do-i-get-a-nullpointerexception)).

### The screenshot of the program 
![](screenshot.png)

