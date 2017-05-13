ArrayList<Dot> dots = new ArrayList<Dot>();

float size;
float temp;
boolean falling = false;
boolean fallingUp = false;
Dot cDot;

void setup()
{
  background(240,255,240);
  ellipseMode(CENTER);
  noStroke();
  size(900,900);
}

void draw()
{
  size = random(10,60);
  background(240,255,250,10);
  for(int i = 0; i<dots.size(); i++) {
   dots.get(i).show(); 
   if(falling) {
    
    dots.get(i).fall(); 
   }
   if(fallingUp) {
    dots.get(i).fallUp(); 
   }
  }
}

void keyPressed()
{
  if(key == 'q')
  {
   background(240,255,240); 
   println("q pressed");
  }
  if(key == 't') {
   for(int i = 0; i<dots.size(); i++) {
     dots.get(i).show();
   }
  }
  
  if(key == 'm') {
    falling = !falling;
  }
  
  if(key == 'u') {
    fallingUp = !fallingUp;
  }



  if(key == 'o') {
    background(240,255,240);
   for(int i = 0; i<dots.size(); i++) {
    dots.get(i).resetPosition(); 
   }
  }
  
   
  

//*********************************************************************************
  
  if(key == 'a') // 1 dot
  {
    //fill(random(100,250),255,255);
    //ellipse(random(900),random(900),size,size);
    dots.add(new Dot(random(900),random(900),size,color(random(100,250),255,255)));
    dots.get(dots.size()-1).show();
  }
  if(key == 'b') // 2 dots
  {
    //fill(255,random(100,250),255);
    //ellipse(random(900),random(900),size,size);
    for(int i = 0; i<2; i++) {
      dots.add(new Dot(random(900),random(900),size,color(255,random(100,250),255)));
      dots.get(dots.size()-1).show();
    }
  } 
  if(key == 'c') // 3 dots
  {
    //fill(255,255,random(100,250));
    //ellipse(random(900),random(900),size,size);
    for(int i = 0; i<3; i++) {
      dots.add(new Dot(random(900),random(900),size,color(255,255,random(100,250))));
      dots.get(dots.size()-1).show();
    }
  }
  if(key == 'd') // 4 dots
  {
   // fill(random(180,240),random(200,240),255);
   // ellipse(random(900),random(900),size,size);
   for(int i = 0; i<4; i++) {
      dots.add(new Dot(random(900),random(900),size,color(random(180,240),random(200,240),255)));
      dots.get(dots.size()-1).show();
   }
  }
  if(key == 'e') // 5 dots
  {
    //fill(200,random(100,200),random(200,240));
    //ellipse(random(900),random(900),size,size);
    for(int i = 0; i<5; i++) {
      dots.add(new Dot(random(900),random(900),size,color(200,random(100,200),random(200,240))));
      dots.get(dots.size()-1).show();
    }
  }
  if(key == 'f') // 6 dots
  {
   // fill(100,230,random(150,230));
    //ellipse(random(900),random(900),size,size);
    for(int i = 0; i<6; i++) {
      dots.add(new Dot(random(900),random(900),size,color(100,230,random(150,230))));
      dots.get(dots.size()-1).show();
    }
  }
}


class Dot
{
  // data
  float xPos, yPos, radius, firstX,firstY,velocity;
  color dotColor;
  
  // constructor
  Dot(float _xPos, float _yPos, float _radius, color _dotColor) {
    xPos = _xPos;
    yPos = _yPos;
    firstX = _xPos;
    firstY = yPos;
    radius = _radius;
    dotColor = _dotColor;
    velocity = random(10,20);
  }
  // methods
  float getYPos() {
   return yPos; 
  }
  void show() {
   fill(dotColor);
   ellipse(xPos,yPos,radius,radius);
  }
  
  void fall() {
    if(yPos < 900) {
      yPos += velocity;
    }
  }
  
  void fallUp() {
    while(yPos > firstY) {
     yPos -= velocity; 
    }
  }
  
  void resetPosition() {
    xPos = firstX;
    yPos = firstY;
  }
  
 
  
}