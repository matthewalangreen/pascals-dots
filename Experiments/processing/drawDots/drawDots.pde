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

float temp;
Dot cDot;

void setup() {
 size(800,800);
 frameRate(1000);
 background(255);
}

void draw() {
  
}

void mousePressed() {
  temp = random(10,20);
  cDot = new Dot(mouseX,mouseY,temp,pastels[(int)random(0,13)]);
  cDot.show();
}