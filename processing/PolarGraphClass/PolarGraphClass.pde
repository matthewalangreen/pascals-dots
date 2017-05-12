ArrayList<PolarGraph> graphs = new ArrayList<PolarGraph>();
PolarGraph temp;

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
  color(100, 170, 154), 
  color(105, 166, 142), 
  color(106, 166, 130)
};


void setup()
{
  size(350, 350);
  background(255);
  frameRate(1000); 
  noStroke();
}


void draw()
{
  for(int i = 0; i < graphs.size(); i++) {
    temp = graphs.get(i);
    //println("("+temp.getX()+","+temp.getY()+")");
    translate(temp.getX(),temp.getY());
    graphs.get(i).display(); 
  }
  
}
float d = 0.2;
float start = 200.2;
void mousePressed()
{
  background(255);
  start += d;
  graphs.add(new PolarGraph(mouseX,mouseY,start));
  println("Graphs in Array: "+graphs.size());
}