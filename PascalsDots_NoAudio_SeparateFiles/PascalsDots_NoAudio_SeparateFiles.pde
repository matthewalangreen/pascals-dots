int time = 5000;
int timeLimit = time;
boolean firstRun = true;

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
  if(firstRun && dots.size()>4) {
   firstRun = false; 
  // println("first run is false");
  }
  
  // get new curve each time all dots are dead
  if(dots.size() < 1 && !firstRun) {
    println("curve change");
  int t = (int)random(0,aVals.length-1);
  myGraph.calculateValuePairs(aVals[t]);
  }
  
  // multiple key press conditions
  //  clear all on a & p & u
  if(keys[0] && keys[15] && keys[20]) {
   dots.clear();
  }
  
  // make dots move on a & b
  if(keys[0] && keys[1]) {
    moving = !moving;
  }
  
  background(bg);
 

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
    // myGraph.update();
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


 
