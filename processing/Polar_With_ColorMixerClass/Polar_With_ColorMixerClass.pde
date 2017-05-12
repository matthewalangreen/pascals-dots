int radius = 20;
float diameter = 2*radius;
float xPos;
float yPos;
float theta = 0;
int dotController = 300; // 20, 100
float increment = PI/dotController;
float r;
color blue = #42548d;
int function = 1;
float a = 0.8;
color temp;

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

// This is an object of my ColorMixer class (see Class definition at bottom for details). 
ColorMixer myMixer = new ColorMixer(pastels);  


void setup()
{
  size(350, 350);
  background(255);
  frameRate(800); // 120, 500, 800, 1000
}

float sizeChanger = 0.001;
float xx = 1;

void draw()
{
 //background(myMixer.mixColors(0.1));
 xx += sizeChanger;
 if(xx >= 6) {
   sizeChanger = sizeChanger*-1;
 }
 if(xx <= 1) {
   sizeChanger = sizeChanger*-1;
 }
 if(xx < 0) {xx = 0;};
  r = 140*sin(-a*theta);

  translate(width/2, height/2);
  theta += increment;
  xPos = r * cos(theta);
  yPos = r * sin(theta);
  fill(myMixer.mixColors(0.1)); // this mixes the colors.
  noStroke();
  ellipse(xPos, yPos, xx, xx);
  point(xPos, yPos);
}

void mousePressed()
{
  xx = 1;
  background(255);
  a += .2;
  if (a==1) a += .2;
}