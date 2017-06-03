void setup() {
  size(300,300);
  background(255);
}


void draw() {
 
  if(keyPressed) {
    background(255);
   if(key == 'a') {
     fill(255,0,0);
     noStroke();
     ellipse(120,150,30,30);
   }
   if(key == 'b') {
      fill(0,0,255);
     noStroke();
     ellipse(170,150,30,30);
   }
    
  }
}