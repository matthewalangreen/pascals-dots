#include <Bounce.h>


Bounce button0 = Bounce(0,10);
Bounce button1 = Bounce(1,10);
Bounce button2 = Bounce(2,10);
Bounce button3 = Bounce(3,10);
Bounce button4 = Bounce(4,10);
Bounce button5 = Bounce(5,10);
Bounce button6 = Bounce(6,10);
Bounce button7 = Bounce(7,10);
Bounce button8 = Bounce(8,10);
Bounce button9 = Bounce(9,10);
Bounce button10 = Bounce(10,10);
Bounce button11 = Bounce(11,10);
Bounce button12 = Bounce(12,10);
Bounce button13 = Bounce(13,10);
Bounce button14 = Bounce(14,10);
Bounce button15 = Bounce(15,10);
Bounce button16 = Bounce(16,10);
Bounce button17 = Bounce(17,10);
Bounce button18 = Bounce(18,10);
Bounce button19 = Bounce(19,10);
Bounce button20 = Bounce(20,10);
Bounce button21 = Bounce(34,10);


void setup()
{
  pinMode(0, INPUT_PULLUP);
  pinMode(1,INPUT_PULLUP);
  pinMode(2,INPUT_PULLUP);
  pinMode(3,INPUT_PULLUP);
  pinMode(4,INPUT_PULLUP);
  pinMode(5,INPUT_PULLUP);
  pinMode(6,INPUT_PULLUP);
  pinMode(7,INPUT_PULLUP);
  pinMode(8,INPUT_PULLUP);
  pinMode(9,INPUT_PULLUP);
  pinMode(10,INPUT_PULLUP);
  pinMode(11,INPUT_PULLUP);
  pinMode(12,INPUT_PULLUP);
  pinMode(13,INPUT_PULLUP);
  pinMode(14,INPUT_PULLUP);
  pinMode(15,INPUT_PULLUP);
  pinMode(16,INPUT_PULLUP);
  pinMode(17,INPUT_PULLUP);
  pinMode(18,INPUT_PULLUP);
  pinMode(19,INPUT_PULLUP);
  pinMode(20,INPUT_PULLUP);
  pinMode(34,INPUT_PULLUP);
  
}

void loop()
{
  button0.update();
  button1.update();
  button2.update();
  button3.update();
  button4.update();
  button5.update();
  button6.update();
  button7.update();
  button8.update();
  button9.update();
  button10.update();
  button11.update();
  button12.update();
  button13.update();
  button14.update();
  button15.update();
  button16.update();
  button17.update();
  button18.update();
  button19.update();
  button20.update();
  button21.update();

  if(button0.fallingEdge() && button15.fallingEdge() && button20.fallingEdge()) {
   Keyboard.set_key1(KEY_A);
   Keyboard.send_now();
   Keyboard.set_key2(KEY_P);
   Keyboard.send_now();
   Keyboard.set_key3(KEY_U);
   Keyboard.send_now();
   Keyboard.set_key4(0);
   Keyboard.send_now();
   Keyboard.set_key5(0);
   Keyboard.send_now();
   Keyboard.set_key6(0);
   Keyboard.send_now();

   
   Keyboard.set_key1(0);
   Keyboard.set_key2(0);
   Keyboard.set_key3(0);
   Keyboard.set_key4(0);
   Keyboard.set_key5(0);
   Keyboard.set_key6(0);
   Keyboard.send_now();
  }
  
  else if(button0.fallingEdge())
  {
    Keyboard.println("a");
   
  }
  else if(button1.fallingEdge())
  {
    Keyboard.println("b");
   
  }
  else if(button2.fallingEdge())
  {
    Keyboard.println("c");
    
  }
  else if(button3.fallingEdge())
  {
    Keyboard.println("d");
   
  }
  else if(button4.fallingEdge())
  {
    Keyboard.println("e");
   
  }
  else if(button5.fallingEdge())
  {
    Keyboard.println("f");
    
  }
  else if(button6.fallingEdge())
  {
    Keyboard.println("g");
    
  }
  else if(button7.fallingEdge())
  {
    Keyboard.println("h");
  }
  else if(button8.fallingEdge())
  {
    Keyboard.println("i");
  }
   else if(button9.fallingEdge())
  {
    Keyboard.println("j");
  }
  else if(button10.fallingEdge())
  {
    Keyboard.println("k");
  }
  else if(button11.fallingEdge())
  {
    Keyboard.println("l");
  }
  else if(button12.fallingEdge())
  {
    Keyboard.println("m");
  }
  else if(button13.fallingEdge())
  {
    Keyboard.println("n");
  }
 else  if(button14.fallingEdge())
  {
    Keyboard.println("o");
  }
  else if(button15.fallingEdge())
  {
    Keyboard.println("p");
  }
  else if(button16.fallingEdge())
  {
    Keyboard.println("q");
  }
  else if(button17.fallingEdge())
  {
    Keyboard.println("r");
  }
  else if(button18.fallingEdge())
  {
    Keyboard.println("s");
  }
  else if(button19.fallingEdge())
  {
    Keyboard.println("t");
  }
   else if(button20.fallingEdge())
  {
    Keyboard.println("u");
  }
   else if(button21.fallingEdge()) {
    Keyboard.println('z');
   }
}


