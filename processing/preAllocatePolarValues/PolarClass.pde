// PolarGraph Class Definition
// Version 1.1
// Matthew Green
// May 22, 2017
// ***************************
class PolarGraph
{
  // data  
  float xPos,yPos,period,theta,alpha,increment,dotController,r,a,size;
  color curColor,temp;
  ArrayList<CoordinatePair> valuePairs;
  
  // ** REMEMBER **
  // r = 140*sin(-a*theta);
  // xPos = r * cos(theta);
  // yPos = r * sin(theta);
  
  // constructor 
  PolarGraph() {
    a = 0.6;
    period = PI/2;
    theta = 0;
    alpha = theta;
    dotController = 100;
    increment = period/dotController;
    size = 150;
    valuePairs = new ArrayList<CoordinatePair>();
    //r = 300 * sin(-a*theta);
  }
  
  // methods
  void calculateValuePairs() {
    for(float i = 0; i<10*PI; i+=increment) {
      float tx = size*sin(-a*i)*cos(i) + width/2;
      float ty = size*sin(-a*i)*sin(i) + height/2;
      valuePairs.add(new CoordinatePair(tx,ty));
    }
  }
  
  float[] getValuePair(int index) {
    if(index < valuePairs.size()) {
      return new float[] {valuePairs.get(index).getX(),valuePairs.get(index).getY()};     
    } else {
      return new float[] {-1000,1000};
    }
  }
  
  
  void update() {
   r = size * sin(-a*theta);
   //translate(width/2,height/2);
   theta += increment; 
   xPos = r * cos(theta) + width/2;
   yPos = r * sin(theta) + height/2;
  }
  
  
  float randomX() {
    float t = random(0,10*PI);
    return size*sin(-a*t) * cos(t) + width/2;
  }
  
  float randomY() {
    float t = random(0,10*PI);
    return size*sin(-a*t) * sin(t) + height/2;
  }
  
  float x() {
    return xPos;
  }
  
  float y() {
    return yPos;
  }
  
  void changeGraph() {
    a += .2;
  }
  
  
} // End of polar class