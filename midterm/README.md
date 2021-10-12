# Midterm Project Documentation

At first, I had an idea to build a simple game where asteroids of random size and speed fall from the top of the screen and the player has to control a spacecraft to dodge them. Pretty niche. But when I started sketching the game, I realized I wanted something different from my own midterm project. I wanted it not only to be a game, but an experience. I wanted something shocking, funny, entertaining, and wholesome. Then I saw that I could achieve all that with a text based video game.

The game premises were simple enough: each time, the player is presented with a scenario and they have 4 different choices on how to act. Each choice leads to different endings, with different stories. But then I saw the great flaw in my grand vision of a game. By offering the player 4 different choices each scenario, I am increasing the number of scenarios each level by a power of 4! Even though my game does not function like a normal game in terms of level and everything, it has levels. Please consult [this sketch](sketch.jpg) I made when developing the implementation. As you can see, my game functions like a tree Data Structure in computer science. The first level would be in this case the first scenario. And the following 4 scenarios would be second level etc. You can clearly see the growth rate from the sketch as well. Extremely unideal! 

Plus, how should the game know which choice box the player selects? How can I uniquely identify each choice box? After a long thinking, I figured out a way to assign each box a value depending on their index in the customBoxArray(that holds only 4 choice boxes; each new box replaces an element in the array rather than pushing. This way is much more memory efficient) and the current level of the scenario, and the previously clicked box. The formula is: (index + 2) ^ currentLevel + previousValue. With this new formula, I was able to uniquely identify each boxes without having to resort to extreme measures such as making different variables for each of the boxes.

I had two different workarounds for the first issue. First was to reduce the number of choices to 2 because exponent of 2 is much better than exponent of 4. For illustration, in level 5 scenarios, the number of scenarios I would have if I went with 2 would be only 32 whilst the number of scenarios I would have if I went with 4 would be a staggering 1024! However, I did not want to change my original vision for the game, even though it seemed like the smarter thing to do. I wanted to stick with it for once. 

So I went with the other workaround: end some storylines short. So that the number of scenarios does not necessarily increase by power of 4 each level. To work with this new limitation, I added some "WOW" factors to the stories so that even the shortest of storylines could be an experience. The "WOW" factor I added to several of my storylines was the thing that made my game shocking and entertaining. 

I enriched all of my storylines with some dry humor. Additionally, my game narration involves some heavy fourth wall breaking, and those things made my game funny. 

Some storylines end with a word of wisdom that relies heavily on breaking the fourth wall, and those were the wholesome parts of my game. 

To further supplement the experience of my game, I added images for visual aid in each scenario. Plus, I added the 8 bit rendition of my favorite song as a background music, which fit perfectly!

Overall, the end product is not exactly what I expected it to be, but it fulfills each parameter of the vision I had initially. 


