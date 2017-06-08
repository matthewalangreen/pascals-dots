boolean[] keys;
 
 void setup()
 {
   size(600, 600);
   background(246);
   keys=new boolean[6];
   for(int i = 0;i<keys.length;i++) {
     keys[i] = false;
   }
 }
 void draw() 
 {
   background(246);
   if (keys[0] && keys[1] && keys[2]) 
   {
     background(0);
   }
 }
 
 void clearKeys() {
   for(int i=0;i<keys.length;i++) {
     keys[i] = false;
   }
 }
 
 void keyPressed()
 {
   if (key=='a') {
     keys[0]=true;
   }
   if (key=='b') {
     keys[1]=true;
   }
   if (key=='c') {
     keys[2]=true;
   }
   if (key=='d') {
     keys[3]=true;
   }
   if (key=='e') {
     keys[4]=true;
   }
   if (key=='f') {
     keys[5]=true;
   }
   
   if (key == 'q') {
     clearKeys();
   }
 }
 void keyReleased()
 {
   if (key=='a') {
     keys[0]=false;
   }
   if (key=='b') {
     keys[1]=false;
   }
   if (key=='c') {
     keys[2]=false;
   }
   if (key=='d') {
     keys[3]=false;
   }
   if (key=='e') {
     keys[4]=false;
   }
   if (key=='f') {
     keys[5]=false;
   }
} 