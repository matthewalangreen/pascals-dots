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

ArrayList<Dot> dots = new ArrayList<Dot>();
ColorMixer myMixer = new ColorMixer(pastels);
float size;
float mix = 0.3;
boolean moving = false;
Dot cDot;

void setup()
{
  background(246);
  ellipseMode(CENTER);
  size(900, 900);
}

void draw()
{
  background(246);
  for (int i = 0; i< dots.size(); i++ ) {
    cDot = dots.get(i);
    if(moving) {
     PVector mouse = new PVector(mouseX,mouseY);
    cDot.arrive(mouse); 
    } else {
     PVector home = new PVector(cDot.x(),cDot.y());
     cDot.arrive(home);
    }
    cDot.update();
    cDot.display();
  }

  Iterator<Dot> it = dots.iterator();

  while (it.hasNext()) {
    Dot p = it.next();
    p.update();
    if (p.isDead()) {
      it.remove();
    }
  }
  println(dots.size() + " Items in the dots ArrayList.");
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
  }
} // end keyPressed()

class Dot {

  // Data
  PVector location;
  PVector velocity;
  PVector acceleration;


  float firstX, firstY, radius, maxForce, maxSpeed, lifespan;
  color dotColor;

  // Constructor
  Dot(float _firstX, float _firstY, float _radius, color _dotColor) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(_firstX, _firstY);
    radius = _radius;
    maxSpeed = 7;
    maxForce = 0.4;
    dotColor = _dotColor;
    lifespan = random(100,255);
    firstX = _firstX;
    firstY = _firstY;
  }

  // Methods
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
    lifespan -= .3; // change this to affect how long they live overall
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
    stroke(1, lifespan);
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