// these are the values I'm using to locate the center of the 
// circle and the little circle that travels around its perimeter
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

// setup the canvas
void setup()
{
  size(350, 350);
  background(255);
  frameRate(60);
 
}

void draw()
{
  //background(255);


  r = 140*sin(-a*theta);
 
  translate(width/2, height/2);
  theta += increment;
  xPos = r * cos(theta);
  yPos = r * sin(theta);
  fill(blue);
  noStroke();
  ellipse(xPos, yPos, 6, 6);
  point(xPos, yPos);
}


void mousePressed()
{
  background(255);
   a += .2;
   if(a==1)
   { a += .2; }  
}