// Wire Master Writer
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Writes data to an I2C/TWI slave device
// Refer to the "Wire Slave Receiver" example for use with this

// Created 29 March 2006

// This example code is in the public domain.


#include <Wire.h>

#define SLAVE_ADDR  0x40
#define SENSOR1     0x01
#define SENSOR2     0x02
#define SENSOR3     0x03

void setup() {
  Serial.begin(9600);
  Serial.println("Begin setup");
  Wire.begin(); // join i2c bus (address optional for master)
  Serial.println("Setup done");
}

byte x = 0;

void loop() {
  Serial.println("Sending message");
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(0x01);              // sends command
  Wire.endTransmission();    // stop transmitting
  Wire.requestFrom(SLAVE_ADDR,1); // read the returned value
  if (Wire.available()){
    Serial.println("Data received");
    x = Wire.read();
    Serial.print("Received : ");
    Serial.println(x);
  }

  delay(500);
}

