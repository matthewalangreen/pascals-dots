#include <Bounce.h>

Bounce button0 = Bounce(0,10);
Bounce button15 = Bounce(15,10);
Bounce button20 = Bounce(20,10);


void setup()
{
  pinMode(0, INPUT_PULLUP);
  pinMode(15,INPUT_PULLUP);
  pinMode(20,INPUT_PULLUP);

  
}

void loop()
{
  button0.update();
  button15.update();
  button20.update();

  if(button0.fallingEdge() && button15.fallingEdge() && button20.fallingEdge()) {
   Keyboard.set_key1(KEY_A);
   Keyboard.set_key2(KEY_P);
   Keyboard.set_key3(KEY_U);
   Keyboard.set_key4(0);
   Keyboard.set_key5(0);
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
  

  
}


