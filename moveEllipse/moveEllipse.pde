void setup()
{
  size(600,600);  // set the size
  background(255); // set the background color
}


// this is the main loop.  All the stuff I'd like to repeat goes here
void draw()
{
  // erase the old stuff
  background(255);
  
  fill(59,0,200); // change the color
  noStroke(); // take off the border
  ellipse(mouseX,mouseY,50,50); // draw the circle
}