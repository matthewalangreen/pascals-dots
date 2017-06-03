class PolarGraph 
{
 // data
 float firstX,firstY,xPos,yPos,theta,radius,increment,a,sizeChanger,curveThickness;
 int dots;
 color fillColor;
 
 // constructor
 PolarGraph(float _xPos, float _yPos, float _a) {
  firstX = _xPos;
  firstY = _yPos;
  a = _a;
  theta = 0;
  dots = 300;
  increment = PI/dots;
  sizeChanger = 0.01;
  curveThickness = 1;
 }
 
 // methods
  void display() {
    radius = 140*sin(-a*theta);
    translate(xPos, yPos); 
    theta += increment;
    xPos = radius * cos(theta);
    yPos = radius * sin(theta);
    fill(color(200,100,0)); 
    ellipse(xPos, yPos, 1, 1);
  }
  void changeFunction() {
   a += 0.2; 
  }
  float getX() {
   return firstX; 
  }
  float getY() {
   return firstY; 
  }
}


//void setup()
//{
//  size(350, 350);
//  background(255);
//  frameRate(1000); 
//  noStroke();
//}


//void draw()
//{
 
//  // THIS CHANGES THE SIZE ******************
// xx += sizeChanger;
// if(xx >= 4) {
//   sizeChanger = sizeChanger*-1;
// }
// if(xx <= 1) {
//   sizeChanger = sizeChanger*-1;
// }
// if(xx < 0) {xx = 0;};
 
// //******************************************
 
//  r = 140*sin(-a*theta);

//  translate(width/2, height/2); // this could be at (mouseX,mouseY)
//  theta += increment;
//  xPos = r * cos(theta);
//  yPos = r * sin(theta);
//  fill(color(200,100,0)); 
//  ellipse(xPos, yPos, xx, xx);

//}

//void mousePressed()
//{
//  xx = 1;
//  background(255);
//  a += .2;
//}