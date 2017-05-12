float size;
float temp;
Dot cDot;

void setup()
{
  background(240,255,240);
  noStroke();
  size(900,900);
}

void draw()
{
  size = random(10,60);
}

void keyPressed()
{
  if(key == 'a')
  {
    //fill(random(100,250),255,255);
    //ellipse(random(900),random(900),size,size);
    cDot = new Dot(random(900),random(900),size,color(random(100,250),255,255));
    cDot.show();
  }
  if(key == 'b')
  {
    //fill(255,random(100,250),255);
    //ellipse(random(900),random(900),size,size);
    cDot = new Dot(random(900),random(900),size,color(255,random(100,250),255));
    cDot.show();
  }
  if(key == 'c')
  {
    //fill(255,255,random(100,250));
    //ellipse(random(900),random(900),size,size);
    cDot = new Dot(random(900),random(900),size,color(255,255,random(100,250)));
    cDot.show();
  }
  if(key == 'd')
  {
   // fill(random(180,240),random(200,240),255);
   // ellipse(random(900),random(900),size,size);
    cDot = new Dot(random(900),random(900),size,color(random(180,240),random(200,240),255));
    cDot.show();
  }
  if(key == 'e')
  {
    //fill(200,random(100,200),random(200,240));
    //ellipse(random(900),random(900),size,size);
    cDot = new Dot(random(900),random(900),size,color(200,random(100,200),random(200,240)));
    cDot.show();
  }
  if(key == 'f')
  {
   // fill(100,230,random(150,230));
    //ellipse(random(900),random(900),size,size);
    cDot = new Dot(random(900),random(900),size,color(100,230,random(150,230)));
    cDot.show();
  }
}


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