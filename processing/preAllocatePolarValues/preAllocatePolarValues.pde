

//float a = 0.4;  // 0.2, 0.4, 0.6, 0.8
float a = 0;
int timeLimit = 8000;
int index = 0;
float[] aVals = {0.2,0.4,0.5,0.6,1.4,1.5,2,3,5,9,11};  // 0.8 is RAD!!!  1.6 is rad too
//Dot cDot;

void setup()
{
  fullScreen();
  background(246);
  ellipseMode(CENTER);
  //size(1024, 768);
  noStroke();
  frameRate(100);
  myGraph.calculateValuePairs(aVals[0]);
  
}

void draw()
{
  //println("Seconds since launch: "+millis());
  if(millis() > timeLimit ) {
    timeLimit += 8000;
    index++;
    if(index > aVals.length-1) {
     index = 0;
    }
    myGraph.calculateValuePairs(aVals[index]);
  }
  numPairs = myGraph.valuePairsSize();
 
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
 
  Iterator<Dot> it = dots.iterator();

  while (it.hasNext()) {
    Dot p = it.next();
    p.update();
    if (p.isDead()) {
      it.remove();
    }
  }
  println("Items: "+dots.size()+" Millis: "+timeLimit+ " index: "+index+ " a-value: "+aVals[index]);
 
  
  //println("my x: "+myGraph.x()+ " my y: "+myGraph.y());
  if(dots.size()>=1) {
  // println("Max Speed: "+dots.get(0).getMaxSpeed()+" Max Force: "+dots.get(0).getMaxForce()+ " Items: "+dots.size());
  } else {
     //println("Max Speed: "+"###"+" Max Force: "+"###"+ " Items: "+dots.size());
  }
}

void mousePressed() {
  moving = !moving; 
 
}

void keyPressed()
{

  //*********************************************************************************

  if (key == 'a') { // 1 dot
    dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
  } else if (key == 'b') { // 2 dots
    for (int i = 0; i<2; i++) {
      dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'c') { // 3 dots
    for (int i = 0; i<3; i++) {
      dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'd') { // 4 dots
    for (int i = 0; i<4; i++) {
      dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'e') { // 5 dots
    for (int i = 0; i<5; i++) {
      dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'f') { // 6 dots
    for (int i = 0; i<6; i++) {
      dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
    } 
  } else if (key == 'p') { // 50 dots
    for (int i = 0; i<100; i++) {
      dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
    }
  } else if (key == 'q') {
    myGraph.calculateValuePairs(aVals[1]);
    println("a: "+aVals[0]);
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