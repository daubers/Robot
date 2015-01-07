/*
 * Simple Motor Test sketch
 * Author: Matt Daubney
 * 01/01/2015
 */

//Include the pololu encoder library
#include <PololuWheelEncoders.h>
 
//Pin definitions
int MTR_STDBY=6;
int MTR_A1=4;
int MTR_A2=5;
int MTR_B2=3;
int MTR_B1=2;
int MTR_A_PWM=8;
int MTR_B_PWM=7;

int ENC_A_A=9;
int ENC_A_B=10;
int ENC_B_A=11;
int ENC_B_B=12;
PololuWheelEncoders encoder;

void setup(){
  pinMode(MTR_STDBY, OUTPUT);
  pinMode(MTR_A1, OUTPUT);
  pinMode(MTR_A2, OUTPUT);
  pinMode(MTR_B1, OUTPUT);
  pinMode(MTR_B2, OUTPUT);
  pinMode(MTR_A_PWM, OUTPUT);
  pinMode(MTR_B_PWM, OUTPUT);
  Serial.begin(9600);
  digitalWrite(MTR_STDBY, true);
  digitalWrite(MTR_A1,false);
  digitalWrite(MTR_A2,true);
  digitalWrite(MTR_B1,true);
  digitalWrite(MTR_B2,false);
  Serial.write("Setting A and B PWM to 50%");
  analogWrite(MTR_A_PWM, 128);
  analogWrite(MTR_B_PWM, 128);
  encoder.init(ENC_A_A,ENC_A_B,ENC_B_A,ENC_B_B);
}



void loop(){
   llegirPos();
 }
 
void llegirPos() {
//  Serial.print( RightEncoder.read(), DEC );
 Serial.print( encoder.getCountsAndResetM1(), DEC );
 Serial.print(", ");
 Serial.print( encoder.getCountsAndResetM2(), DEC );
 Serial.println();
}
