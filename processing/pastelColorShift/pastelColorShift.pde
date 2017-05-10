int radius = 20;
float diameter = 2*radius;
float xPos;
float yPos;
float theta = 0;
int dotController = 100;
float increment = PI/dotController;
float r;
color blue = #42548d;
int function = 1;
float a = 0.6;

color[] pastels = {
  color(246, 235, 170), 
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
ColorMixer colorJam = new ColorMixer(pastels);  


void setup()
{
  size(350, 350);
  background(255);
  frameRate(120);
}

void draw()
{
  r = 140*sin(-a*theta);

  translate(width/2, height/2);
  theta += increment;
  xPos = r * cos(theta);
  yPos = r * sin(theta);
  fill(colorJam.lerpedColor(0.01)); // this mixes the colors.
  noStroke();
  ellipse(xPos, yPos, 6, 6);
  point(xPos, yPos);
}

void mousePressed()
{
  background(255);
  a += .2;
  if (a==1) a += .2;
}

class ColorMixer
{
  // data  
  color[] pastels; 
  int index;
  float x;
  float lerpAmount;
  
  // constructor 
  ColorMixer(color[] _colors) {
    pastels = _colors;
    index = 0;
    x = 0;
    lerpAmount = 0.005;
    }
  
  // methods
  color lerpedColor(float amt) {
    color c1, c2;
    
    if(x > PI/2) {
     x = 0;
     index++;
       if(index % 14 == 0) { // fix this... when it resets the counter it makes the mix yucky...
         index = 0; 
       }
    }
   
    x += amt;
    c1 = pastels[index];
    c2 = pastels[index+1];
    return lerpColor(c1,c2,abs(sin(x)));
  }

}