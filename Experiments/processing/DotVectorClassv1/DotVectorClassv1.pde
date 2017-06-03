//Dot myDot;
ArrayList<Dot> dots = new ArrayList<Dot>();

void setup() {
 size(640,360);
 background(255);
 //myDot = new Dot(random(width),random(height),20, color(200,0,0,200));
 for(int i = 0; i<20; i++) {
  dots.add(new Dot(random(200),random(200),20,color(200,0,0,200))); 
 }
}

void draw() {
 //translate(width/2,height/2);
 background(255);
 
 //myDot.arrive(mouse);
 //myDot.update();
 //myDot.display();
 for(int i = 0; i<dots.size(); i++ ) {
   PVector mouse = new PVector(mouseX,mouseY);
   dots.get(i).arrive(mouse); 
   dots.get(i).update();
   dots.get(i).display();
 }

 println("mouseX: "+mouseX+ " mouseY: "+mouseY);
}


class Dot {
 
  // Data
  PVector location;
  PVector velocity;
  PVector acceleration;

  float firstX,firstY,radius,maxForce,maxSpeed;
  color dotColor;
  
  // Constructor
  Dot(float _firstX, float _firstY, float _radius, color _dotColor) {
   acceleration = new PVector(0,0);
   velocity = new PVector(0,0);
   location = new PVector(firstX,firstY);
   radius = _radius;
   maxSpeed = 7;
   maxForce = 0.4;
   dotColor = _dotColor;
  }
  
  // Methods
   void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void seek(PVector target) {
   PVector desired = PVector.sub(target,location);
   desired.normalize();
   desired.mult(maxSpeed);
   PVector steer = PVector.sub(desired,velocity);
   steer.limit(maxForce);
   applyForce(steer);
  }
  
   void arrive(PVector target) {
    PVector desired = PVector.sub(target,location);

    // The distance is the magnitude of
    // the vector pointing from
    // location to target.
    float d = desired.mag();
    desired.normalize();
    // If we are closer than 100 pixels...
    if (d < 100) {
      //[full] ...set the magnitude
      // according to how close we are.
      float m = map(d,0,100,0,maxSpeed);
      desired.mult(m);
      //[end]
    } else {
      // Otherwise, proceed at maximum speed.
      desired.mult(maxSpeed);
    }

    // The usual steering = desired - velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void display() {
    fill(200);
    stroke(1);
    fill(dotColor);
    ellipse(location.x,location.y,radius,radius);
  }
  
}