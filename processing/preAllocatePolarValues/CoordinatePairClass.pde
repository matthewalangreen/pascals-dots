// CoordinatePair Class Definition
// Version 1.0
// Matthew Green
// May 24, 2017
// ***************************
class CoordinatePair
{
  // data  
  float x,y;
  
  // constructor 
  CoordinatePair() { x = 0; y = 0; } // this is the default constructor
  
  CoordinatePair(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  // methods
  void setX(float _x) {
    x = _x;
  }
  
  void setY(float _y) {
    y = _y;
  }
  
  void setXY(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  float getX() {
   return x; 
  }
  
  float getY() {
   return y; 
  }
  
  float[] getXY() {
   return new float[]{x,y}; 
  }

}// end of CoordinatePairs Class 
 