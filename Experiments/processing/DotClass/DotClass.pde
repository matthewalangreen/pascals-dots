class Dot
{
  // data
  float xPos, yPos, radius;
  color dotColor;
  
  // constructor
  Dot(float _xPos, float _yPos, float _radius, color _dotColor) {
    xPos = _xPos;
    yPos = _yPos;
    radius = _radius;
    dotColor = _dotColor;
  }
  // methods
  void show() {
   noStroke();
   fill(dotColor);
   ellipseMode(CENTER);
   ellipse(xPos,yPos,radius,radius);
  }
}