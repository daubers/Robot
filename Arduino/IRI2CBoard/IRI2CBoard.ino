/*
 * Driver for a little analog distance sensor to i2c
 */

#include <Wire.h>

// Command defintions
byte ENABLE_INTERRUPT=1;
byte SET_INTERRUPT_DISTANCE=2;
byte READ_INTERRUPT_DISTANCE=3;
byte SENSOR_DATA=4;

#define REG_MAP_SIZE 4
#define SLAVE_ADDRESS  0x01
//data
byte data[8];


void setup(){
  Wire.begin(SLAVE_ADDRESS);        // join i2c bus 
  
  Wire.onReceive(receiveEvent); // register event
  Wire.onRequest(requestEvent);
  
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

void requestEvent(){
  Wire.write(data, REG_MAP_SIZE);  //Set the buffer up to send all 14 bytes of dat
}
