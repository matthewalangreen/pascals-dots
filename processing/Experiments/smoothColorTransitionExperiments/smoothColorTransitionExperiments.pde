color[] pastels = {
 // color(246, 235, 170), 
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

/*

float x = 0;
float step = 0.01;
float limit = (5*PI)/12;

color c1 = pastels[0];
color c2 = pastels[1];
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
*/


/*   // not working 
float l(float input) {
  float exp = -8*(input-0.6545);
  float tempe = (float)Math.pow(e,exp);
  return (1/1+tempe);
}  */

/*  // FINISH THIS
color[] colorSwap(float input, float lim, color[] vals) {
  int a,b;
  if(input > lim) {
   // swap
 }
 return new color[] {vals[a],vals[b]};
 // Do I convert this to a Class/Object to track data states?
 // Do I track array location extermally and pass it in?
}
*/

ColorMixer myMixer = new ColorMixer(pastels); 

void setup() {
  size(400,400);
  background(256);
}


void draw() {
  /*x += step;
  if(x > limit) {
    x = 0;
    temp = c1;
    c1 = c2;
    c2 = temp;
  }
  background(lerpColor(c1,c2,h(x))); */
  background(myMixer.mixColors(0.05));


}