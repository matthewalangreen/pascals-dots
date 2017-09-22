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

void setup()
{
  fullScreen();

  ellipseMode(CENTER);
  //size(1024, 768);
  noStroke();
  frameRate(24); // 100 is default
  myGraph.calculateValuePairs(aVals[0]); // calculate locations on first curve
  slides = new Slideshow();
  bg = color(0);
  
  // boolean array to manage simultaneous key presses
  keys = new boolean[26];
  for(int i = 0; i<keys.length; i++) {
   keys[i] = false; 
  }
  
  location = new PVector(random(width),random(height));
}

void draw()
{
  // multiple key press conditions
  
  // clear all on a & p & u
  if(keys[0] && keys[15] && keys[20]) {
   dots.clear();
  }
  
  // make dots move on a & b & c
  if(keys[0] && keys[1] && keys[2]) {
    moving = !moving;
  }
  
  background(bg);
  if(fountainOn) {
    for(int i = 0; i<5; i++ ) {
    dots.add(new Dot(location.x,location.y,myMixer.mixColors(mix)));
    }
  }
  

  numPairs = myGraph.valuePairsSize(); // keep track of how many coordinate pairs their are for error checking
  
  // loop through dots and draw them based on if they should be moving or not...
  for (int i = 0; i< dots.size(); i++ ) {
    cDot = dots.get(i); // keep track of the current dot
    if(moving) { // if mouse is clicked ******************** CHANGE THIS TO REFLECT TWO BUTTONS PRESSED **********************************
      if(numPairs > i) { //error checking
        float[] t =  myGraph.getValuePair(i);
        tempX = t[0];
        tempY = t[1];
        
        // make new target for each dot to arrive at
        PVector preAllocPolar = new PVector(tempX,tempY);
        cDot.arrive(preAllocPolar);
      }

    } else { // if not moving, send all dots back to their original positions...
     PVector home = new PVector(cDot.x(),cDot.y());
     cDot.arrive(home);
    }
    // draw update their positions and draw them to the screen
    cDot.update();
    cDot.display();
    myGraph.update();
  }  // end of dots loop
 
  // Check to see if dots are alive.  Remove the dead ones.
  Iterator<Dot> it = dots.iterator();
  while (it.hasNext()) {
    Dot p = it.next();
    p.update();
    if (p.isDead()) {
      it.remove();
    }
  }
  // debugging
  //println("Items: "+dots.size()+ " index: "+index+ " a-value: "+aVals[index]);
  //String t = "";
  //for(int i = 0; i<slides.size(); i++) {
  // t = t+slides.slidePathAtIndex(i)+"...";
  //}
  //println(t);
}

// helper functions
void makeDot() {
   dots.add(new Dot(random(width), random(height), myMixer.mixColors(mix)));
}

void makeDots(int num) {
  for(int i = 0; i<num; i++) {
    makeDot();
  }
}


void keyPressed()
{
  // 1 dot keys... there are lots!
  if (key == 'a') { 
    keys[0] = true; makeDot(); 
  } 
  if (key == 'b') { 
    keys[1] = true; makeDot(); 
  } 
  if (key == 'c') { 
    keys[2] = true; makeDot(); 
  } 
  if (key == 'd') { 
    keys[3] = true; makeDot(); 
  } 
  if (key == 'f') { 
    keys[5] = true; makeDot(); 
  } 
  if (key == 'g') { 
    keys[6] = true; makeDot(); 
  } 
  if (key == 'j') { 
    keys[9] = true; makeDot(); 
  } 
  if (key == 'k') { 
    keys[10] = true; makeDot(); 
  } 
  if (key == 'o') { 
    keys[14] = true; makeDot(); 
  } 
  if (key == 'p') { 
    keys[15] = true; makeDot(); 
  } 
  if (key == 'u') { 
    keys[20] = true; makeDot(); 
  }  // end of 1 dot makers
  
  // 2 dots
  if (key == 'e') { 
    keys[4] = true; makeDots(2); 
  } 
  
  // 3 dots
   if (key == 'h') { 
    keys[7] = true; makeDots(3); 
  } 
  if (key == 'i') { 
    keys[8] = true; makeDots(3); 
  } 
  
  // 4 dots
  if (key == 'l') { 
    keys[11] = true; makeDots(4); 
  } 
  if (key == 'n') { 
    keys[13] = true; makeDots(4); 
  } 
  
  // 5 dots
  if (key == 'q') { 
    keys[16] = true; makeDots(5); 
  } 
  if (key == 't') { 
    keys[19] = true; makeDots(5); 
  }
  
  // 6 dots
  if (key == 'm') { 
    keys[12] = true; makeDots(6); 
  } 
  
  // 10 dots
  if (key == 'r') { 
    keys[17] = true; makeDots(10); 
  } 
  if (key == 's') { 
    keys[18] = true; makeDots(10); 
  } 
  
  
  // get random curve
  if(key == 'v') {
    int t = (int)random(0,aVals.length-1);
    myGraph.calculateValuePairs(aVals[t]);
  }
  
  // black/white toggle background color
  if (key == 'w') { 
    keys[22] = true;
    isBlack = !isBlack;
    if (isBlack) {
      bg = color(0);
    } else {
      bg = color(246);
    }
  } 
  
  // random background color
   if (key == 'x') { 
    keys[23] = true; bg = myMixer.randomColor();
  }
  
  // screenshot
  if (key == 'y') { 
    keys[24] = true; slides.addSlide();
  } 
  
  // fountain
  //if (key == 'z') { 
  //  keys[25] = true;  
  //  fountainOn = !fountainOn;
  //  location.x = random(width);
  //  location.y = random(height);
  //}
  
  if (key == 'z') {
     moving = !moving; 
  }
  
  
} // end keyPressed()

void keyReleased() {
  if (key == 'a') {
    keys[0] = false;
  }
  if (key == 'b') { 
    keys[1] = false;
  } 
  if (key == 'c') { 
    keys[2] = false;
  } 
  if (key == 'd') { 
    keys[3] = false;
  } 
  if (key == 'e') { 
    keys[4] = false;
  } 
  if (key == 'f') { 
    keys[5] = false;
  } 
  if (key == 'g') { 
    keys[6] = false;
  } 
  if (key == 'h') { 
    keys[7] = false;
  } 
  if (key == 'i') { 
    keys[8] = false;
  } 
  if (key == 'j') { 
    keys[9] = false;
  } 
  if (key == 'k') { 
    keys[10] = false;
  } 
  if (key == 'l') { 
    keys[11] = false;
  } 
  if (key == 'm') { 
    keys[12] = false;
  } 
  if (key == 'n') { 
    keys[13] = false;
  } 
  if (key == 'o') { 
    keys[14] = false;
  } 
  if (key == 'p') { 
    keys[15] = false;
  } 
  if (key == 'q') { 
    keys[16] = false;
  } 
  if (key == 'r') { 
    keys[17] = false;
  } 
  if (key == 's') { 
    keys[18] = false;
  } 
  if (key == 't') { 
    keys[19] = false;
  } 
  if (key == 'u') { 
    keys[20] = false;
  } 
  if (key == 'v') { 
    keys[21] = false;
  } 
  if (key == 'w') { 
    keys[22] = false;
  } 
  if (key == 'x') { 
    keys[23] = false;
  } 
  if (key == 'y') { 
    keys[24] = false;
  } 
  if (key == 'z') { 
    keys[25] = false;
  } 
}

// *************** ColorMixer Class ************************* //
// ColorMixer Class Definition
// Version 1.1
// Matthew Green
// May 24, 2017
// ***************************
class ColorMixer
{
  // data  
  float x,limit,e;
  color c1,c2,mix,temp;
  int i,indexDelta,arrLength;
  color[] palette;
  
  // constructor 
  ColorMixer(color[] _colors) { 
   palette = _colors;
   x = 0;
   limit = (5*PI)/12;
   i = 1;
   indexDelta = 1;
   arrLength = palette.length;
   e = 2.71828;
   c1 = palette[0]; // eliminates black spot from v1.0
   c2 = palette[1]; // -------------------------------
  }
  
  // methods

  color randomColor() {
    int c,d;
    c = (int)random(0,arrLength-1);
    d = c+1;
   return lerpColor(palette[c],palette[d],random(0,1));
  }
  
  color mixColors(float delta) {
    x += delta;
    if(x > limit) {
     x = 0;
     if(i == arrLength - 2) {
       indexDelta = -1;
     }
     
     if(i == 0) {
       indexDelta = 1;
     }
     
     if(indexDelta == 1) {
       c1 = palette[i];
       c2 = palette[i+1];
     }
     
     if(indexDelta == -1) {
       c1 = palette[i+1];
       c2 = palette[i];
     }
     i += indexDelta;
    }
    return lerpColor(c1,c2,h(x));
  }
 
  // helper methods -- used in to mix colors at different rates
  // see this for more info: https://www.desmos.com/calculator/pv0mckn3rl
  float f(float input) {
  return (limit*limit*input*input);
  }

  float g(float input) {  
    return ((float)Math.pow(e,(input-1))-0.367);
  }
  
  float h(float input) {
     return sin(1.2*input);
  }
  
  float j(float input) {
     return 0.7639*input;
  }
  
  float k(float input) {
     return 0.139*log(1000*input);
  }
  
}
 

// *************** End of ColorMixer Class ************************* //
 

class Dot {
  
  // Data
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector newLocation;
  float firstX, firstY, radius, lifespan,maxForce,maxSpeed;
  color dotColor;
  float radiusChange;
  float deathRate;
  int counter;
  boolean growing;

  // Constructor
  Dot(float _firstX, float _firstY, color _dotColor) {
    
    // ********************************** CHANGE THESE AS NEEDED *************************
    maxSpeed = 16;  // 7 is default
    maxForce = 1.2; // 0.4 is default
    deathRate = 0.4; // 0.8 is default
    radiusChange = 0.1; // 0.04 is default
    lifespan = random(150,400); //100,255 is default
    // ***********************************************************************************
    
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(_firstX, _firstY);
    newLocation = location;
    radius = random(10,50); 
    dotColor = _dotColor;
    firstX = _firstX;
    firstY = _firstY;
    growing = true;
    counter = 0;
  }

  // Methods
  void pulse() {
    counter++;
    if(counter > 30) {
      counter = 0;
      growing = !growing;
      radiusChange = radiusChange*(-1);
    }
    radius += radiusChange;
  }
  
  float getMaxSpeed() {
   return maxSpeed; 
  }
  
  float getMaxForce() {
   return maxForce; 
  }
  
  void increaseMaxSpeed() {
    maxSpeed += 0.25;
  }
  
  void decreaseMaxSpeed() {
    maxSpeed -= 0.25;
  }
  
  void increaseMaxForce() {
    maxForce += 0.25;
  }
  
  void decreaseMaxForce() {
    maxForce -= 0.25;
  }
  
  PVector getNewLocation() {
    return newLocation;
  }
  
  void setNewLocation(float x, float y) {
   newLocation = new PVector(x,y); 
  }
  
  float x() {
   return firstX; 
  }
  
  float y() {
   return firstY; 
  }
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
    //lifespan -= .08; // change this to affect how long they live overall
    lifespan -= deathRate;
    pulse();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void arrive(PVector target) {
    PVector desired = PVector.sub(target, location);

    // The distance is the magnitude of
    // the vector pointing from
    // location to target.
    float d = desired.mag();
    desired.normalize();
    // If we are closer than 100 pixels...
    if (d < 100) {
      //[full] ...set the magnitude
      // according to how close we are.
      float m = map(d, 0, 100, 0, maxSpeed);
      desired.mult(m);
      //[end]
    } else {
      // Otherwise, proceed at maximum speed.
      desired.mult(maxSpeed);
    }

    // The usual steering = desired - velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void display() {
    //float disp = map(lifespan, 1000, 3000, 0, 255);
    //stroke(1, lifespan);
    fill(dotColor, lifespan);
    ellipse(location.x, location.y, radius, radius);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

// PolarGraph Class Definition
// Version 1.2
// Matthew Green
// June 7, 2017
// ***************************
class PolarGraph
{
  // data  
  float xPos,yPos,period,theta,alpha,increment,dotController,r,a,size;
  color curColor,temp;
  ArrayList<PVector> valueVectors;
  
  // ** REMEMBER **
  // r = 140*sin(-a*theta);
  // xPos = r * cos(theta);
  // yPos = r * sin(theta);
  
  // constructor 
  PolarGraph() {
    a = 0.7;  // 0.6 is default
    period = PI/2;
    theta = 0;
    alpha = theta;
    dotController = 50;
    increment = period/dotController;
    size = 450;
    valueVectors = new ArrayList<PVector>();
    //r = 300 * sin(-a*theta);
  }
  
  // methods
  void calculateValuePairs(float val) {
    valueVectors.clear();
    //valuePairs.clear();
    for(float i = 0; i<30*PI; i+=increment) {
      float tx = size*sin(-val*i)*cos(i) + width/2;
      float ty = size*sin(-val*i)*sin(i) + height/2;
      valueVectors.add(new PVector(tx,ty));
    }
  }
  
  float[] getValuePair(int index) {
    if(index < valueVectors.size()) {
      return new float[] {valueVectors.get(index).x,valueVectors.get(index).y};     
    } else {
      return new float[] {-1000,1000};
    }
  }
  
  int valuePairsSize() {
   return valueVectors.size();
  }
  
  // ***********************************************
  
  
  void update() {
   r = size * sin(-a*theta);
   theta += increment; 
   xPos = r * cos(theta) + width/2;
   yPos = r * sin(theta) + height/2;
  }
  
} // End of polar class

// Slideshow Class Definition
// Version 1.1
// Matthew Green
// May 29, 2017
// ***************************
class Slideshow
{
  // data  
  ArrayList<String> slides;
  int numSlides;
  
  // constructor 
  Slideshow() {
   slides = new ArrayList<String>();
   numSlides = 0;
  }
  
  // methods
  void addSlide() {
    numSlides++;
    String temp = "pics/"+numSlides+".png";
    slides.add(temp);
    save(temp);
  }
 
  PImage slideAtIndex(int index) {
   return loadImage(slides.get(index)); 
  }
  
  String slidePathAtIndex(int index) {
   return slides.get(index); 
  }
  
  int size() { 
    return slides.size(); 
  }
  
}// end of SlideShow Class 
 

// *************** End of SlideShow Class ************************* //