/*
 * Driver for a little analog distance sensor to i2c
 */

#include <Wire.h>

// Command defintions
byte ENABLE_INTERRUPT=1;
byte SET_INTERRUPT_DISTANCE=2;
byte READ_INTERRUPT_DISTANCE=4;
byte READ_MAX_MIN=8;

void setup(){
  Wire.begin();        // join i2c bus (address optional for master)
  Wire.onReceive(receiveEvent); // register event
  Serial.begin(9600);           // start serial for output
}

void loop()
{
  delay(100);
}

// function that executes whenever data is received from master
// this function is registered as an event, see setup()
void receiveEvent(int howMany)
{
  while(1 < Wire.available()) // loop through all but the last
  {
    char c = Wire.read(); // receive byte as a character
    Serial.print(c);         // print the character
  }
  int x = Wire.read();    // receive byte as an integer
  Serial.println(x);         // print the integer
}
