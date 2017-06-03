class Dot {
 // data
 float x,y,radius,speed;
 
 // constructor
 Dot(float x_, float y_, float radius_) {
  x = x_;
  y = y_;
  radius = radius_;
  speed = 5;
 }
 
 // methods
 void display() {
  noStroke();
  ellipse(x,y,radius,radius); 
 }
 
 void moveUp() {
   y = y - speed;
 }
 
  void moveDown() {
   y = y + speed;
 }
 
  void moveRight() {
   x = x + speed;
 }
 
  void moveLeft() {
   x = x - speed;
 }
 
} // end of Dot class definition

ArrayList<Dot> dots; // arrayList to hold all my dot objects I'll be making


void setup() {
 size(500,500);
 background(255);
 dots = new ArrayList<Dot>();
}

void draw() {
  background(255);
  fill(255,0,0);
  if(keyPressed) {
   if(key == 'w') {
    for(int i = 0; i<dots.size(); i++) {
     dots.get(i).moveUp(); 
    }
   } else if(key == 's') {
     for(int i = 0; i<dots.size(); i++) {
     dots.get(i).moveDown(); 
    }
   } else if(key == 'd') {
     for(int i = 0; i<dots.size(); i++) {
     dots.get(i).moveRight(); 
    }
   } else if(key == 'a') {
     for(int i = 0; i<dots.size(); i++) {
     dots.get(i).moveLeft(); 
    }
   }
  }
  
  // show all dots
  for(int i = 0; i<dots.size(); i++) {
   dots.get(i).display(); 
  }
}

void mousePressed() {
  dots.add(new Dot(mouseX,mouseY,random(5,20)));
}