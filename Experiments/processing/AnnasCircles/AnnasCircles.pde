float size;

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
    fill(random(100,250),255,255);
    ellipse(random(900),random(900),size,size);
  }
  if(key == 'b')
  {
    fill(255,random(100,250),255);
    ellipse(random(900),random(900),size,size);
  }
  if(key == 'c')
  {
    fill(255,255,random(100,250));
    ellipse(random(900),random(900),size,size);
  }
  if(key == 'd')
  {
    fill(random(180,240),random(200,240),255);
    ellipse(random(900),random(900),size,size);
  }
  if(key == 'e')
  {
    fill(200,random(100,200),random(200,240));
    ellipse(random(900),random(900),size,size);
  }
  if(key == 'f')
  {
    fill(100,230,random(150,230));
    ellipse(random(900),random(900),size,size);
  }
}