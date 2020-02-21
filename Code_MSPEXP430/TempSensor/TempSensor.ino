#include <Wire.h>

int data = 0;


void setup()
{
  Wire.begin();
  Serial.begin(9600);  
  Serial.println("Setup done");
}

void loop()
{
  Wire.requestFrom(0x48, 2);

  //Precision de 0.5°C
//  data = Wire.read()<<1; // MSB
//  data |= Wire.read()>>7;// LSB
//  Serial.println(data*0.5);
  
  //Precision de 0.125°C
  data = Wire.read()<<3; // MSB
  data |= Wire.read()>>5;// LSB
  Serial.println(data*0.125);

  delay(500);
}
