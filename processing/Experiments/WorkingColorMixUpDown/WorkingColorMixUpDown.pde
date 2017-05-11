color[] pastels = {
  //color(246, 235, 170), 
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

float j(float input) {
   return 0.7639*input;
}

float x = 0;
float delta = 0.01;
float limit = (5*PI)/12;
color c1,c2,mix,temp;
int i = 1;
int indexDelta = 1;

void setup() {
  size(400,400);
  background(pastels[0]);
}


void draw() {
  x += delta;
  if(x > limit) {
    x = 0;
    if(i == 13) {
      indexDelta = -1;
    }
    if(i == 0) {
      indexDelta = 1; 
    }
    if(indexDelta == 1) {
     c1 = pastels[i];
     c2 = pastels[i+1];
    }
    if(indexDelta == -1) {
      c1 = pastels[i+1];
      c2 = pastels[i];
    }
    i += indexDelta;
  }
  background(lerpColor(c1,c2,j(x)));
  //background(pastels[0]);
}