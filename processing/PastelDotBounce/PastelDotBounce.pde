// ****************** Header ************************ //
import java.util.Iterator; // for keeping track of dots as they die
//import processing.sound.*;
//SoundFile tones;

// Dot Instances
ArrayList<Dot> dots = new ArrayList<Dot>();
Dot cDot;


// Color Stuff
color[] pastels = {color(194, 86, 119), color(199, 122, 159), color(178, 116, 158), 
  color(157, 111, 156), color(139, 108, 155), color(125, 110, 160), color(117, 114, 163), 
  color(81, 90, 157), color(118, 145, 199), color(101, 174, 208), color(92, 153, 169), 
  color(99, 172, 171), color(255,131,0), /*orange */ color(100, 170, 154), 
  color(105, 166, 142), color(106, 166, 130) };
  
ColorMixer myMixer = new ColorMixer(pastels);
float mix = 0.05; // 0.3 is default
color bg; // to use with changing background colors on keyPress...


// Polar graph stuff...
// https://www.desmos.com/calculator/mic1r81ces
float[] aVals = {0.2,0.35,0.4,0.5,4,0.6,0.75,1.4,2,3};  
PolarGraph myGraph = new PolarGraph();
int numPairs = 0; // to keep track of size of coordinates array in myGraph
float tempX,tempY; // same as above


// Timers ... this is ugly and needs cleaning... refactor to use frameCount;
int timeLimit = 9000;  //change a values to switch to new curve
int movingTimer = 14000; // swicthes between static and moving positions
boolean moving = true;
int index = 0;


// for use with slideshow that saves background images
Slideshow slides;

// ******************  End Of Header ************************ //

void setup()
{
  //tones = new SoundFile(this,"edm_conv.mp3");
 
  fullScreen(JAVA2D);

  ellipseMode(CENTER);
  //size(1024, 768);
  noStroke();
  frameRate(24); // 100 is default
  myGraph.calculateValuePairs(aVals[0]); // calculate locations on first curve
  slides = new Slideshow();
  bg = color(0);
  
}

void draw()
{
  background(bg);
  
  // check to see if timeLimit has passed, 
  // if it has then switch to next "a" value in aVals[]
  if(millis() > timeLimit ) {
    timeLimit += 5000;
    index++;
    if(index > aVals.length-1) {
     index = 0;
    }
    myGraph.calculateValuePairs(aVals[index]);  // recalculate all values on new curve
  }
  //if(millis() > movingTimer) {
  //  movingTimer += 8000;
  //  moving = !moving;
  //}
  
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
  println("Items: "+dots.size()+" Millis: "+timeLimit+ " index: "+index+ " a-value: "+aVals[index]);
 //String t = "";
 //for(int i = 0; i<slides.size(); i++) {
 // t = t+slides.slidePathAtIndex(i)+"...";
 //}
 //println(t);
}

void mousePressed() {
  for(int i = 0; i<5; i++) {
    dots.add(new Dot(mouseX+random(-50,50),mouseY+random(-50,50),myMixer.mixColors(mix)));
   // tones.rate(1.625);
   // tones.play();
  }
}

void keyPressed()
{
  if (key == 'a' || key == '1') { // 1 dot
    dots.add(new Dot(random(width), random(height), myMixer.mixColors(mix)));
    //tones.rate(1);
   // tones.play();
  } else if (key == 'b' || key == '2') { // 2 dots
     // tones.rate(1.167);
     // tones.play();
      for (int i = 0; i<2; i++) {
        dots.add(new Dot(random(width), random(height), myMixer.mixColors(mix)));
      }
  } else if (key == 'c' || key == '3') { // 3 dots
     // tones.rate(1.333);
     // tones.play();
      for (int i = 0; i<3; i++) {
        dots.add(new Dot(random(width), random(height), myMixer.mixColors(mix)));
      }
  } else if (key == 'd' || key == '4') { // 4 dots
     // tones.rate(1.4166);
     // tones.play();
      for (int i = 0; i<4; i++) {
        dots.add(new Dot(random(width), random(height), myMixer.mixColors(mix)));
       
      }
  } else if (key == 'e' || key == '5') { // 5 dots
     // tones.rate(1.583);
     // tones.play();
      for (int i = 0; i<5; i++) {
        dots.add(new Dot(random(width), random(height), myMixer.mixColors(mix)));
      }
  } else if (key == 'f' || key == '6') { // 6 dots
     // tones.rate(1.749);
     // tones.play();
      for (int i = 0; i<6; i++) {
        dots.add(new Dot(random(width), random(height), myMixer.mixColors(mix)));
      } 
  } else if (key == 'g' || key == '0') { // 10 dots
     // tones.rate(2.666);
     // tones.play();
      for (int i = 0; i<10; i++) {
        dots.add(new Dot(random(width), random(height), myMixer.mixColors(mix)));
      }
  } else if (key == 'p') { // take screenshot 'n stuff
    slides.addSlide();
  } else if (key == 'r') { // set random mixed color background
    bg = myMixer.randomColor();
  } else if (key == 't' ) { // make background black
    bg = color(0,0,0);
  } else if (key == 'y') { // make background offwhite
    bg = color(246);
  } else if (key == 'm') { // make dots move
   moving = !moving;  
  }
} // end keyPressed()

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

// *************** CoordinatePair Class ************************* //

// CoordinatePair Class Definition
// Version 1.1
// Matthew Green
// May 24, 2017
// ***************************
class CoordinatePair
{
  // data  
  float x,y;
  
  // constructor 
  CoordinatePair(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  float getX() {
   return x; 
  }
  
  float getY() {
   return y; 
  }

}// end of CoordinatePairs Class 
 

// *************** End of CoordinatePair Class ************************* //

// *************** Dot Class ************************* //

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

// *************** End of Dot Class ************************* //

// *************** Polar Class ************************* //

// PolarGraph Class Definition
// Version 1.1
// Matthew Green
// May 22, 2017
// ***************************
class PolarGraph
{
  // data  
  float xPos,yPos,period,theta,alpha,increment,dotController,r,a,size;
  color curColor,temp;
  ArrayList<CoordinatePair> valuePairs;
  
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
    valuePairs = new ArrayList<CoordinatePair>();
    //r = 300 * sin(-a*theta);
  }
  
  // methods
  void calculateValuePairs(float val) {
    valuePairs.clear();
    for(float i = 0; i<30*PI; i+=increment) {
      float tx = size*sin(-val*i)*cos(i) + width/2;
      float ty = size*sin(-val*i)*sin(i) + height/2;
      valuePairs.add(new CoordinatePair(tx,ty));
    }
  }
  
  float[] getValuePair(int index) {
    if(index < valuePairs.size()) {
      return new float[] {valuePairs.get(index).getX(),valuePairs.get(index).getY()};     
    } else {
      return new float[] {-1000,1000};
    }
  }
  
  int valuePairsSize() {
   return valuePairs.size(); 
  }
  
  // ***********************************************
  
  
  void update() {
   r = size * sin(-a*theta);
   //translate(width/2,height/2);
   theta += increment; 
   xPos = r * cos(theta) + width/2;
   yPos = r * sin(theta) + height/2;
  }
  
  
  // ****************** Pretty sure these are all extras *************************** //
  float randomX() {
    float t = random(0,10*PI);
    return size*sin(-a*t) * cos(t) + width/2;
  }
  
  float randomY() {
    float t = random(0,10*PI);
    return size*sin(-a*t) * sin(t) + height/2;
  }
  
  float x() {
    return xPos;
  }
  
  float y() {
    return yPos;
  }
  
  void changeGraph() {
    a += .2;
  }
  
  
} // End of polar class

// *************** End of Polar Class ************************* //

// *************** SlideShow Class ************************* //

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