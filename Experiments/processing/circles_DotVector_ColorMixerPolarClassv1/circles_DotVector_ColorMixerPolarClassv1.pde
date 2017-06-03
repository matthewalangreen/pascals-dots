import java.util.Iterator;
color[] pastels = {
  color(194, 86, 119), 
  color(199, 122, 159), 
  color(178, 116, 158), 
  color(157, 111, 156), 
  color(139, 108, 155), 
  color(125, 110, 160), 
  color(117, 114, 163), 
  color(81, 90, 157), 
  color(118, 145, 199), 
  color(101, 174, 208), 
  color(92, 153, 169), 
  color(99, 172, 171), 
  color(100, 170, 154), 
  color(105, 166, 142), 
  color(106, 166, 130)
};

// Object declarations
ArrayList<Dot> dots = new ArrayList<Dot>();
ColorMixer myMixer = new ColorMixer(pastels);
PolarGraph myGraph = new PolarGraph();

float size;
float mix = 0.3;
boolean moving = false;
Dot cDot;

void setup()
{
  background(246);
  ellipseMode(CENTER);
  size(900, 900);
  noStroke();
  frameRate(100);
}

void draw()
{
  background(246);
  for (int i = 0; i< dots.size(); i++ ) {
    cDot = dots.get(i);
    if(moving) {
    // will follow mouse:
    // PVector mouse = new PVector(mouseX,mouseY);
    // cDot.arrive(mouse); 
    
    // will follow polar curve:
    //PVector polar = new PVector(myGraph.x(),myGraph.y());
    //cDot.arrive(polar);
    
    // will follow polar curve differently
    PVector uniquePolar = new PVector(myGraph.x(),myGraph.y());
    cDot.arrive(uniquePolar);

    } else {
     PVector home = new PVector(cDot.x(),cDot.y());
     cDot.arrive(home);
    }
    cDot.update();
    cDot.display();
    myGraph.update();
    fill(myMixer.randomColor());
    //ellipse(myGraph.x(),myGraph.y(),20,20);

  }
 // myGraph.update();
   // fill(myMixer.randomColor());
   // ellipse(myGraph.x(),myGraph.y(),20,20);

  Iterator<Dot> it = dots.iterator();

  while (it.hasNext()) {
    Dot p = it.next();
    p.update();
    if (p.isDead()) {
      it.remove();
    }
  }
  //println(dots.size() + " Items in the dots ArrayList.");
 
  
  //println("my x: "+myGraph.x()+ " my y: "+myGraph.y());
  if(dots.size()>=1) {
   println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce()+ " Items: "+dots.size());
  } else {
     println("Max Speed: "+"###"+" Max Force: "+"###"+ " Items: "+dots.size());
  }
}

void mousePressed() {
  moving = !moving; 
 
}

void keyPressed()
{

  //*********************************************************************************

  if (key == 'a') { // 1 dot
    dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
  } else if (key == 'b') { // 2 dots
    for (int i = 0; i<2; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'c') { // 3 dots
    for (int i = 0; i<3; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'd') { // 4 dots
    for (int i = 0; i<4; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'e') { // 5 dots
    for (int i = 0; i<5; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'f') { // 6 dots
    for (int i = 0; i<6; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    } 
  } else if (key == 'p') { // 50 dots
    for (int i = 0; i<200; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  }
  //} else if (key == CODED) {
  //  if(keyCode == UP) {
  //   // println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce());
  //    for(int m = 0; m<dots.size(); m++) {
  //      dots.get(m).increaseMaxSpeed();
  //    }
  //  } else if(keyCode == DOWN) {
  //   // println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce());
  //    for(int m = 0; m<dots.size(); m++) {
  //      dots.get(m).decreaseMaxSpeed();
  //    }
  //  } else if(keyCode == LEFT) {
  //   // println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce());
  //    for(int m = 0; m<dots.size(); m++) {
  //      dots.get(m).decreaseMaxForce();
  //    }
  //  } else if(keyCode == RIGHT) {
  //   // println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce());
  //    for(int m = 0; m<dots.size(); m++) {
  //      dots.get(m).increaseMaxForce();
  //    }
  //  }

} // end keyPressed()

class Dot {

  // Data
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector newLocation;
  float firstX, firstY, radius, lifespan,maxForce,maxSpeed;
  color dotColor;

  // Constructor
  Dot(float _firstX, float _firstY, float _radius, color _dotColor) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(_firstX, _firstY);
    newLocation = location;
    radius = _radius;
    maxSpeed = 2;  // 7 is default
    maxForce = 0.06; // 0.4 is default
    dotColor = _dotColor;
    lifespan = random(100,255);
    firstX = _firstX;
    firstY = _firstY;
  }

  // Methods
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
    lifespan -= .1; // change this to affect how long they live overall
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

// ColorMixer Class Definition
// Version 1.0
// Matthew Green
// May 11, 2017
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
   c1 = palette[0]; // new code... to get rid of black spots at start/
   c2 = palette[1]; // -----------------------------------------------
  }
  
  // methods
  color randomColor() {
    return palette[(int)random(0,palette.length-1)];
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
 