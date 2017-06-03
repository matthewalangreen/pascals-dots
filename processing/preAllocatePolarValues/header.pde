//              1
//           1     1
//         1    2    1
//        1   3   3    1
//       1  4   6   4   1
//      1  5  10  10  5   1

//            a
//           a  a
//         a  b  a
//        a  c  c  a
//       a  d  f  d a
//      a e g  g  e  a


import java.util.Iterator;

Dot cDot;

color[] pastels = {
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
  color(255,131,0),   // eew.  Gross orange
  color(100, 170, 154), 
  color(105, 166, 142), 
  color(106, 166, 130)
};

ArrayList<Dot> dots = new ArrayList<Dot>();
ColorMixer myMixer = new ColorMixer(pastels);
PolarGraph myGraph = new PolarGraph();

float size;
float mix = 0.05; // 0.3 is default
boolean moving = false;
int numPairs = 0;
float tempX,tempY;