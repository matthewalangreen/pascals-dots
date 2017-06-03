// these are the values I'm using to locate the center of the 
// circle and the little circle that travels around its perimeter
int radius = 20;
float diameter = 2*radius;
float xPos;
float yPos;
float theta = 0;
float increment = PI/20;

// setup the canvas
void setup()
{
  size(400,400);
  background(255);
  
  // put the big circle in the center. We will draw a small, red circle that travels
  // around its perimeter.
}

void draw()
{
  background(255);
  
  // this is all the stuff that moves the little red circle around the big one.
  // its using the idea that any point on a circle, centered at the origin
  // is of the form: (radius * cos(angle), radius * sin(angle))
  // read more about that here: https://en.wikipedia.org/wiki/Polar_coordinate_system 
  translate(width/2,height/2);
  theta += increment;
  xPos = radius * cos(theta);
  yPos = radius * sin(theta);
  fill(255,0,0);
  ellipse(xPos,yPos,diameter/4, diameter/4);

}