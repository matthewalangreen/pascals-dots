
void setup() {
  background(246);
  ellipseMode(CENTER);
  size(500,500);
  noStroke();
  frameRate(100);
  myGraph.calculateValuePairs();
}

int i = 0;
void draw() {
  //background(246);
  myGraph.update();
  fill(255,0,0);
  //ellipse(myGraph.x(),myGraph.y(),40,40);
  float[] t = myGraph.getValuePair(i);
  ellipse(t[0],t[1],40,40);
  //println(myGraph.getValue(i));
  println(myGraph.getValuePair(i)[0]);
  i++;
  
}