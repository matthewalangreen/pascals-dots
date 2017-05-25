

float size;
float mix = 0.3;
boolean moving = false;
int numPairs = 0;
float randX,randY;
//Dot cDot;

void setup()
{
  background(246);
  ellipseMode(CENTER);
  size(900, 900);
  noStroke();
  frameRate(100);
  myGraph.calculateValuePairs();
}

void draw()
{
  numPairs = myGraph.valuePairsSize();
    //if(numPairs > 0) {
    //  float[] t =  myGraph.getValuePair((int)random(0,numPairs));
    //  randX = t[0];
    //  randY = t[1];
    //}
  

  background(246);
  for (int i = 0; i< dots.size(); i++ ) {
    cDot = dots.get(i);
    if(moving) {
    // will follow mouse:
    // PVector mouse = new PVector(mouseX,mouseY);
    // cDot.arrive(mouse); 
    
    // will follow polar curve:
    //PVector polar = new PVector(myGraph.x(),myGraph.y());s
    //cDot.arrive(polar);
    
    // will follow polar curve differently
    //PVector uniquePolar = new PVector(myGraph.x(),myGraph.y());
    //cDot.arrive(uniquePolar);
    if(numPairs > i) {
      float[] t =  myGraph.getValuePair(i);
      randX = t[0];
      randY = t[1];
      PVector preAllocPolar = new PVector(randX,randY);
      cDot.arrive(preAllocPolar);
    }

    } else {
     PVector home = new PVector(cDot.x(),cDot.y());
     cDot.arrive(home);
    }
    cDot.update();
    cDot.display();
    myGraph.update();
    fill(myMixer.randomColor());
    //ellipse(myGraph.x(),myGraph.y(),20,20);

  }
 // myGraph.update();
   // fill(myMixer.randomColor());
   // ellipse(myGraph.x(),myGraph.y(),20,20);

  Iterator<Dot> it = dots.iterator();

  while (it.hasNext()) {
    Dot p = it.next();
    p.update();
    if (p.isDead()) {
      it.remove();
    }
  }
  //println(dots.size() + " Items in the dots ArrayList.");
 
  
  //println("my x: "+myGraph.x()+ " my y: "+myGraph.y());
  if(dots.size()>=1) {
   println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce()+ " Items: "+dots.size());
  } else {
     println("Max Speed: "+"###"+" Max Force: "+"###"+ " Items: "+dots.size());
  }
}

void mousePressed() {
  moving = !moving; 
 
}

void keyPressed()
{

  //*********************************************************************************

  if (key == 'a') { // 1 dot
    dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
  } else if (key == 'b') { // 2 dots
    for (int i = 0; i<2; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'c') { // 3 dots
    for (int i = 0; i<3; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'd') { // 4 dots
    for (int i = 0; i<4; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'e') { // 5 dots
    for (int i = 0; i<5; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'f') { // 6 dots
    for (int i = 0; i<6; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    } 
  } else if (key == 'p') { // 50 dots
    for (int i = 0; i<200; i++) {
      dots.add(new Dot(random(900), random(900), random(10, 50), myMixer.mixColors(mix)));
    }
  }
  //} else if (key == CODED) {
  //  if(keyCode == UP) {
  //   // println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce());
  //    for(int m = 0; m<dots.size(); m++) {
  //      dots.get(m).increaseMaxSpeed();
  //    }
  //  } else if(keyCode == DOWN) {
  //   // println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce());
  //    for(int m = 0; m<dots.size(); m++) {
  //      dots.get(m).decreaseMaxSpeed();
  //    }
  //  } else if(keyCode == LEFT) {
  //   // println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce());
  //    for(int m = 0; m<dots.size(); m++) {
  //      dots.get(m).decreaseMaxForce();
  //    }
  //  } else if(keyCode == RIGHT) {
  //   // println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce());
  //    for(int m = 0; m<dots.size(); m++) {
  //      dots.get(m).increaseMaxForce();
  //    }
  //  }

} // end keyPressed()






//void setup() {
//  background(246);
//  ellipseMode(CENTER);
//  size(500,500);
//  noStroke();
//  frameRate(100);
//  myGraph.calculateValuePairs();
//}

//int i = 0;
//void draw() {
//  //background(246);
//  myGraph.update();
//  fill(255,0,0);
//  //ellipse(myGraph.x(),myGraph.y(),40,40);
//  float[] t = myGraph.getValuePair(i);
//  ellipse(t[0],t[1],40,40);
//  //println(myGraph.getValue(i));
//  println(myGraph.getValuePair(i)[0]);
//  i++;
  
//}