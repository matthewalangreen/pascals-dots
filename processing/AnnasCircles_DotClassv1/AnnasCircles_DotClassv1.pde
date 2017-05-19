ArrayList<Dot> dots = new ArrayList<Dot>();

float size;
float temp;
boolean falling = false;
boolean fallingUp = false;
boolean moving = false;

float domain = 2*PI;
float r;
float theta = 0;
float delta = domain/100;
float tempX,tempY;

Dot cDot;

void setup()
{
  background(240,255,240);
  ellipseMode(CENTER);
  fill(255,50);
  stroke(2);
  size(900,900);
  //translate(width/2,height/2);
}

void draw()
{
  translate(width/2,height/2);
  r = 300*sin(.8*theta);
  
  theta += delta;
  fill(0,255,0,200);
  tempX = r*cos(theta);
  tempY = r*sin(theta);
  //ellipse(tempX,tempY,50,50);

  
  size = random(10,60);
  background(240,255,250,10);
  for(int i = 0; i<dots.size(); i++) {
    if(moving) {
      dots.get(i).show(tempX,tempY);
    } else {
      dots.get(i).show();
    }

   if(falling && !fallingUp) {
    dots.get(i).fall(); 
   } else if(fallingUp && !falling) {
    dots.get(i).fallUp(); 
   }
  }
}

void keyPressed()
{
  if(key == 'l') {
   if(dots.size() >=1) {
     moving = !moving;
    dots.get(dots.size()-1).move(tempX,tempY);
   }
  }
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
    fallingUp = false;
  }
  
  if(key == 'u') {
    fallingUp = !fallingUp;
    falling = false;
  }

  if(key == 'o') {
    falling = false;
    fallingUp = false;
    background(240,255,240);
   for(int i = 0; i<dots.size(); i++) {
    dots.get(i).resetXY(); 
   }
  }
  
  if(key == 'h') {
    if(dots.size() >=1) {
      for(int i = 0; i<dots.size(); i++) {
        dots.get(i).move(width/2,dots.get(i).yPos());
      }
    }
  }
  
   


//*********************************************************************************
  
  if(key == 'a') // 1 dot
  {
    //fill(random(100,250),255,255);
    //ellipse(random(900),random(900),size,size);
    dots.add(new Dot(random(-width/2,width/2),random(-height/2,height/2),size,color(random(100,250),255,255)));
    dots.get(dots.size()-1).show();
  }
  if(key == 'b') // 2 dots
  {
    //fill(255,random(100,250),255);
    //ellipse(random(900),random(900),size,size);
    for(int i = 0; i<2; i++) {
      dots.add(new Dot(random(-width/2,width/2),random(-height/2,height/2),size,color(255,random(100,250),255)));
      dots.get(dots.size()-1).show();
    }
  } 
  if(key == 'c') // 3 dots
  {
    //fill(255,255,random(100,250));
    //ellipse(random(900),random(900),size,size);
    for(int i = 0; i<3; i++) {
      dots.add(new Dot(random(-width/2,width/2),random(-height/2,height/2),size,color(255,255,random(100,250))));
      dots.get(dots.size()-1).show();
    }
  }
  if(key == 'd') // 4 dots
  {
   // fill(random(180,240),random(200,240),255);
   // ellipse(random(900),random(900),size,size);
   for(int i = 0; i<4; i++) {
      dots.add(new Dot(random(-width/2,width/2),random(-height/2,height/2),size,color(random(180,240),random(200,240),255)));
      dots.get(dots.size()-1).show();
   }
  }
  if(key == 'e') // 5 dots
  {
    //fill(200,random(100,200),random(200,240));
    //ellipse(random(900),random(900),size,size);
    for(int i = 0; i<5; i++) {
      dots.add(new Dot(random(-width/2,width/2),random(-height/2,height/2),size,color(200,random(100,200),random(200,240))));
      dots.get(dots.size()-1).show();
    }
  }
  if(key == 'f') // 6 dots
  {
   // fill(100,230,random(150,230));
    //ellipse(random(900),random(900),size,size);
    for(int i = 0; i<6; i++) {
      dots.add(new Dot(random(-width/2,width/2),random(-height/2,height/2),size,color(100,230,random(150,230))));
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
    firstY = _yPos;
    radius = _radius;
    dotColor = _dotColor;
    velocity = random(10,20);
  }
  // methods
  
  //------------ GETTERS -----------------
  float yPos() {
   return yPos; 
  }
  
  float xPos() {
   return yPos; 
  }
  
  float firstX() {
    return firstX;
  }
  
  float firstY() {
   return firstY; 
  } // end GETTERS -------------------------
  
  
  void show() {
   fill(dotColor,80);
   ellipse(xPos,yPos,radius,radius);
  }
  
  void show(float newX, float newY) {
    fill(dotColor,80);
    ellipse(newX,newY,radius,radius);
  }
  
  void move(float newX, float newY) {
   xPos = newX;
   yPos = newY;
  }
  
  void fall() {
    if(yPos < height/2) {
      yPos += velocity;
    }
  }
  
  void fallUp() {
    if(yPos > firstY) {
     yPos -= velocity; 
    }
  }
  
  void resetXY() {
    xPos = firstX;
    yPos = firstY;
  }
 
  
}