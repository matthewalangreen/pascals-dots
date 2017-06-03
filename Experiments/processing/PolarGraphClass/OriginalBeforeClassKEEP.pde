
//float xPos, yPos, theta,r;
//int dotController = 300; 
//float increment = PI/dotController;
//float a =200.2; //0.6, 20,50,100, 200 <-- this is my favorite

//float sizeChanger = 0.001;
//float xx = 1;

//color[] pastels = { 
//  color(194, 86, 119), 
//  color(199, 122, 159), 
//  color(178, 116, 158), 
//  color(157, 111, 156), 
//  color(139, 108, 155), 
//  color(125, 110, 160), 
//  color(117, 114, 163), 
//  color(81, 90, 157), 
//  color(118, 145, 199), 
//  color(101, 174, 208), 
//  color(92, 153, 169), 
//  color(99, 172, 171), 
//  color(100, 170, 154), 
//  color(105, 166, 142), 
//  color(106, 166, 130)
//};


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