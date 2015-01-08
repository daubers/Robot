/*
 * Simple Motor Test sketch
 * Author: Matt Daubney
 * 01/01/2015
 */

//Include the pololu encoder library
#include <PololuWheelEncoders.h>
//Encoder measures 24 steps per revolution so
//each step is (pi*48)/24 mm in length
//which is 6.28mm in rotation of the wheel
//which means that the robot turns roughly 0.084 radians
//per step which is 4.8 degrees!
 
//Pin definitions
int MTR_STDBY=6;
int MTR_A1=2;
int MTR_A2=3;
int MTR_B2=4;
int MTR_B1=5;
int MTR_A_PWM=10;
int MTR_B_PWM=11;

int ENC_A_A=8;
int ENC_A_B=9;
int ENC_B_A=255;
int ENC_B_B=255;

PololuWheelEncoders enc;

void setup(){
  pinMode(MTR_STDBY, OUTPUT);
  pinMode(MTR_A1, OUTPUT);
  pinMode(MTR_A2, OUTPUT);
  pinMode(MTR_B1, OUTPUT);
  pinMode(MTR_B2, OUTPUT);
  pinMode(MTR_A_PWM, OUTPUT);
  pinMode(MTR_B_PWM, OUTPUT);
  Serial.begin(115200);
  digitalWrite(MTR_STDBY, true);
  digitalWrite(MTR_A1,true);
  digitalWrite(MTR_A2,false);
  digitalWrite(MTR_B1,true);
  digitalWrite(MTR_B2,false);
  Serial.write("Setting A and B PWM to 50%");
  //analogWrite(MTR_A_PWM, 0);
  //analogWrite(MTR_B_PWM, 0);
  enc.init(7,8,12,13);
}



void loop(){
   llegirPos();
 }
 
void llegirPos() {
//  Serial.print( RightEncoder.read(), DEC );
  Serial.println(enc.getCountsM1()*(360.0/24.0));
  Serial.println(enc.checkErrorM1());
  //Serial.println(PololuWheelEncoders::getCountsM2());
  delay(1000);
}
