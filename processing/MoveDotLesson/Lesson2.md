# Processing Lesson #2 - Make stuff move

* Make `Dot` class
class Dot {
  data
 float x,y,radius;
 
  constructor
 Dot(float x_, float y_, float radius_) {
  x = x_;
  y = y_;
  radius = radius_;
 }
 
  methods
 void display() {
  noStroke();
  ellipse(x,y,radius,radius); 
 }
 
}  end of Dot class definition
```

* Declare new `myDot` object
`Dot myDot;`

* Set fill color and call `display()`  in  `void draw()`
```
fill(255,0,0);
myDot.display();
```

* Teach Dot to move up by adding new method to class definition
```
 put in methods section of Dot class
void moveUp() {
	y = y - speed;
}

 put in data section of Dot class
float speed;

 update Dot class constructor
speed = 5;
```

* Call myDot.moveUp() method in draw()
```
void draw() {
	myDot.moveUp();
	myDot.display();

	 you may want to add a background(255); to make it
	 look like you've got a single dot moving...
}
```

* Add if(keyPressed) into draw and connect movement to key
```
void draw() {
	background(255);
	myDot.moveUp();
	myDot.display();

	if(keyPressed) {
	  if(key == 'w') {
	   myDot.moveUp();
	  }
	}
	myDot.display();
}
```

* Add down, right, left and corresponding keys to movement
```
 Add to methods in Dot class
 ...

 void moveDown() {
   y = y + speed;
 }
 
  void moveRight() {
   x = x + speed;
 }
 
  void moveLeft() {
   x = x - speed;
 }

 update void draw() {
 ...

if(keyPressed) {
	  if(key == 'w') {
	   myDot.moveUp();
	  } else if(key == 's') {
	    myDot.moveDown();
	  } else if(key == 'a') {
	    myDot.moveLeft();
	  } else if(key == 'd') {
		myDot.moveRight();
	  }
	}
myDot.display();
}
```

* Show how to add a new dot by clicking down
```
 Declar an ArrayList to hold dots
ArrayList<Dot> dots;

 instantiate dots ArrayList in void setup()
dots = new ArrayList<Dot>();

 create new function
void mousePressed() {
	dots.add(new Dot(mouseX,mouseY,random(5,20)));
}

 update the if(key == 'w') function to move all dots
if(key == 'w') {
	for(int i = 0; i<dots.size(); i++) {
    dots.get(i).moveUp();
  }
}

 add to the end of the void draw() loop
for(int i = 0; i<dots.size(); i++) {
  dots.get(i).display();
}
```

* Show how to make all dots move on key press
```
 update void draw method

if(key == 'w') {
    for(int i = 0; i<dots.size(); i++) {
     dots.get(i).moveUp(); 
    }
   } else if(key == 's') {
     for(int i = 0; i<dots.size(); i++) {
     dots.get(i).moveDown(); 
    }
   } else if(key == 'd') {
     for(int i = 0; i<dots.size(); i++) {
     dots.get(i).moveRight(); 
    }
   } else if(key == 'a') {
     for(int i = 0; i<dots.size(); i++) {
     dots.get(i).moveLeft(); 
    }
   }
```



#processing #nerd