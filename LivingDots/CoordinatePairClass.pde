// *************** CoordinatePair Class ************************* //

// CoordinatePair Class Definition
// Version 1.1
// Matthew Green
// May 24, 2017
// ***************************
class CoordinatePair
{
  // data  
  float x,y;
  
  // constructor 
  CoordinatePair(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void update(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  float getX() {
   return x; 
  }
  
  float getY() {
   return y; 
  }

}// end of CoordinatePairs Class 