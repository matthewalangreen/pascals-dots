float x = 0;
float step = 0.01;
float limit = (5*PI)/12;

color c1 = color(255,0,0);
color c2 = color(0,255,0);
color temp;  // placeholder for switch
float e = 2.71828;

float f(float input) {
  return (limit*limit*input*input);
}

float g(float input) {  
  return ((float)Math.pow(e,(input-1))-0.367);
}

float h(float input) {
   return sin(1.2*input);
}

float j(float input) {
   return 0.7639*input;
}

float k(float input) {
   return 0.139*log(1000*input);
}

/*   // not working 
float l(float input) {
  float exp = -8*(input-0.6545);
  float tempe = (float)Math.pow(e,exp);
  return (1/1+tempe);
}  */

void setup() {
  size(400,400);
  background(256);
}


void draw() {
  x += step;
  if(x > limit) {
    x = 0;
    temp = c1;
    c1 = c2;
    c2 = temp;
  }
  background(lerpColor(c1,c2,f(x)));
  //println("g(x) = "+g(x)[0]+" limit = "+g(x)[1]);
}