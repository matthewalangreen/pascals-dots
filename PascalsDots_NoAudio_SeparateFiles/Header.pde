// ****************** Header ************************ //
import java.util.Iterator; // for keeping track of dots as they die


// Key press stuff **************************** //
boolean[] keys;
// A  0      J  9       S  18  
// B  1      K  10      T  19
// C  2      L  11      U  20  
// D  3      M  12      V  21
// E  4      N  13      W  22
// F  5      O  14      X  23  
// G  6      P  15      Y  24  
// H  7      Q  16      Z  25
// I  8      R  17  

//            A
//          B   C
//        D   E   F
//      G   H   I   J
//    K   L   M   N   O
//  P   Q   R   S   T   U
            
            
//            0
//          1   2
//        3   4   5
//      6   7   8   9
//    10  11  12  13  14
//  15  16  17  18  19  20
// end key press stuff *********************** //




// Dot Instances
ArrayList<Dot> dots = new ArrayList<Dot>();
Dot cDot;
PVector location;

// Color Stuff
color[] pastels = {color(194, 86, 119), color(199, 122, 159), color(178, 116, 158), 
  color(157, 111, 156), color(139, 108, 155), color(125, 110, 160), color(117, 114, 163), 
  color(81, 90, 157), color(118, 145, 199), color(101, 174, 208), color(92, 153, 169), 
  color(99, 172, 171), color(255,131,0), /*orange */ color(100, 170, 154), 
  color(105, 166, 142), color(106, 166, 130) };
  
ColorMixer myMixer = new ColorMixer(pastels);
float mix = 0.05; // 0.3 is default
color bg; // to use with changing background colors on keyPress...
boolean isBlack = true;


// Polar graph stuff...
// https://www.desmos.com/calculator/mic1r81ces
float[] aVals = {0.2,0.35,0.4,0.5,4,0.6,0.75,1.4,2,3};  
PolarGraph myGraph = new PolarGraph();
int numPairs = 0; // to keep track of size of coordinates array in myGraph
float tempX,tempY; // same as above


// Timers ... this is ugly and needs cleaning... refactor to use frameCount;
//int timeLimit = 9000;  //change a values to switch to new curve
//int movingTimer = 14000; // swicthes between static and moving positions
boolean moving = false;
int aValsIndex = 0;  // used to keep track of where we are in the aVals[] array


// for use with slideshow that saves background images
Slideshow slides;

// for drawing mode
boolean fountainOn = false;
// ******************  End Of Header ************************ //
