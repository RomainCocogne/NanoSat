// Wire Master Writer
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Writes data to an I2C/TWI slave device
// Refer to the "Wire Slave Receiver" example for use with this

// Created 29 March 2006

// This example code is in the public domain.

////////////////////////////////////////////////////////////////////////
// Modified 01/05/2020 by Quentin Combal as part of the Nano Sat Project
// Meant to be use with the test_i2c_slave program on a MSP430
////////////////////////////////////////////////////////////////////////

#include <Wire.h>

#define SLAVE_ADDR    0x40
#define READ_SENSOR1  0x01
#define READ_SENSOR2  0x02
#define READ_SENSOR3  0x03

void setup() {
  Serial.begin(9600);
  Serial.println("Begin setup");
  Wire.begin(); // join i2c bus (address optional for master)
  Serial.println("Setup done");
}

int16_t sensor1_data = 0;
int32_t sensor2_data = 0;
int8_t  sensor3_data = 0;

void loop() {
  Serial.println("Sending message");

  //Get sensor 1 data
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(READ_SENSOR1);              // sends command
  Wire.endTransmission();    // stop transmitting
  Wire.requestFrom(SLAVE_ADDR,2); // read the returned value
  while (Wire.available()){
    Serial.print("Data from sensor 1 : ");
    sensor1_data = Wire.read();
    sensor1_data |= Wire.read()<<8;
    Serial.println(sensor1_data*0.125);
  }
  
  //Get sensor 2 data
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(READ_SENSOR2);              // sends command
  Wire.endTransmission();    // stop transmitting
  Wire.requestFrom(SLAVE_ADDR,4); // read the returned value
  while (Wire.available()){
    Serial.print("Data from sensor 2 : ");
    sensor2_data = Wire.read();
    sensor2_data |= Wire.read()<<8;
    sensor2_data |= Wire.read()<<16;
    sensor2_data |= Wire.read()<<24;
    Serial.println(sensor2_data);
  }

  //Get sensor 3 data
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(READ_SENSOR3);              // sends command
  Wire.endTransmission();    // stop transmitting
  Wire.requestFrom(SLAVE_ADDR,1); // read the returned value
  while (Wire.available()){
    Serial.print("Data from sensor 3 : ");
    sensor3_data = Wire.read();
    Serial.println(sensor3_data);
  }
  Serial.println("Done receiving");

  delay(5000);
}

