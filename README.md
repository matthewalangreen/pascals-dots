# Pascal’s Dots

## Description
This project is a collaboration with students from [Riverpoint Academy](twitter.com/riverptacademy)  [Carl Richardson](http://www.carllrichardson.com)  and [Brook Gannon](http://www.brookgannon.com).  Carl’s show is entitled, “Nerd” and opens at [Marmot Art Space](http://www.marmotartspace.com) in Spokane Washington on Friday, July 7th and runs through August 1st.

Our task was to create an interactive piece which invites participants to explore patterns in [Pascal’s Triangle](https://en.wikipedia.org/wiki/Pascal%27s_triangle).   Participants press twenty-one, unmarked arcade buttons, presented in a triangle.  As they press different buttons they are presented with different quantities, patterns and tones.  Participants discover and create as the control the polar spirals.

## Table of Contents
- Description
- Installation
- Usage
- Contributing
- Credits
- License

## Installation
Fork, Clone or Download this repo.  Code has been split across multiple files to make editing and development easier.  Some classes are designed to work independently of this particular application. See the Wiki for more details.  All code is compatible with [Processing 3.3.3](https://processing.org) and [Minim 2.2.2](https://github.com/ddf/Minim) (for audio).

A no-audio version is available on: openprocessing.org: [Pascal’s Dots - OpenProcessing](https://www.openprocessing.org/sketch/431211)

## Usage
All keys are mapped to lowercase alpha keys on a standard English keyboard.  Anna used a [Teensy 3.6](https://www.pjrc.com/store/teensy36.html) to build a custom USB controller which consists of twenty-one arcade buttons arrayed in a triangle.  Each button emulates a key on the keyboard in the following layout:
```
		           a                                                   1
		         b   c                                               1   1
  		       d   e   f                                           1   2   1
 		     g   h   i   j                                       1   3   3   1
 		   k   l   m   n  o                                    1   4   6   4   1
                 p   q   r   s   t  u                                1   5  10   10  5   1
```

On the left you’ll see the keys and on the right their corresponding positions in Pascal’s Triangle.  Each key pressed creates the corresponding quantity of dots on screen in addition to the corresponding note in the scale, with 10 being the 1 in the next octave.

#### The following keys & combinations create additional behaviors:
- v - switch to random polar curve that acts as path for dots
- w - alternate between white & black background color
- z - create a stream of dot objects from random (x, y) position
- x - select new random background color from mix of given color palette.
- a & b & c - alternate between dots moving to original & stationary positions and dots following selected polar curve.
- a & p & u - clear all dots from screen and remove from memory

## Contributing
Contributing: Larger projects often have sections on contributing to their project, in which contribution instructions are outlined. Sometimes, this is a separate file. If you have specific contribution preferences, explain them so that other developers know how to best contribute to your work. To learn more about how to help others contribute, check out the guide for (setting guidelines for repository contributors)[https://help.github.com/articles/setting-guidelines-for-repository-contributors/].

## Credits
Carl Richardson - Thank you for the invitation to share in your work.  I’m honored to be part of your show.  Also, I think the orange is growing on me.

Brook Gannon - Thanks for the killer sounds and your patience with my demanding indecision.  

Riverpoint Academy Students - Anna, Lexi and Taylor.  Thank you for your curiosity, passion and hard work. I’m glad to have had your participation in this project, I can’t wait to see what you do next!

A special thank you to @shiffman for writing [Nature of Code](http://natureofcode.com)  Your chapters on Vectors, Particle Systems and Autonomous Agents enabled me to create something with simple rules that creates engaging visuals that feel to me to perfectly balance chaos and predictability.  I’m so excited with how it turned out and I’m grateful to you for laying such a beautiful foundation on which I could build.

## License
[Attribution ShareAlike 3.0 United States (CC BY-SA 3.0 US)](https://creativecommons.org/licenses/by-sa/3.0/us/)

#nerd #processing #docs
