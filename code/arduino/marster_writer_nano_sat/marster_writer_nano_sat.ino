// Master writer for the NiceCube project
// by Quentin Combal

// Based on the Wire Master Writer example 
// by Nicholas Zambetti <http://www.zambetti.com>

// This program was made as a demo of the test_i2c_slave program
// running on an MSP430 microcontroller

// Demonstrates the communication protocol used between the MSP430
// microcontroller and the central unit of the nano satellite

// The arduno board acts as the central unit and is the master on 
// the i2c bus. It emmits commands to the slave to read values from
// different sensors attached to the slave, or to perform status checks

// The possible commands are :
//    -READ_SENSOR : ask for a sensor's value. Sensor is specified
//                   with a parameter (ex : PARAM_SENSOR1)
//    -LIST_SENSOR : ask for a list of avaiable sensors
//    -CONROLLER_STATUS: ask for a controller status check
//    -CELLS_StATUS: ask for a status check of the solar cells
   
// The micro controller acts as the slave. It receives commands from 
// the arduino and send back the desired data. Code for the slave can
// be found in the test_i2c_slave CCS project 

////////////////////////////////////////////////////////////////////////

#include <Wire.h>

#define SLAVE_ADDR          0x40
#define READ_SENSOR         0x01
#define LIST_SENSORS        0x02
#define CONTROLLER_STATUS   0x03
#define CELLS_STATUS        0x04

#define PARAM_SENSOR1       0x01
#define PARAM_SENSOR2       0x02
#define PARAM_SENSOR3       0x03
#define PARAM_ALL_SENSORS   0x04

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
  Serial.println("Start communication");

  // Get sensor 2 data
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(READ_SENSOR);              // sends command
  Wire.write(PARAM_SENSOR1);
  Wire.endTransmission();
  Wire.requestFrom(SLAVE_ADDR,2); // read the returned value
  while (Wire.available()){
    Serial.print("Data from sensor 1 : ");
    sensor1_data = Wire.read();
    sensor1_data |= Wire.read()<<8;
    Serial.println(sensor1_data*0.125);
  }
  
  // Get sensor 2 data
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(READ_SENSOR);              // sends command
  Wire.write(PARAM_SENSOR2);
  Wire.endTransmission();
  Wire.requestFrom(SLAVE_ADDR,4); // read the returned value
  while (Wire.available()){
    Serial.print("Data from sensor 2 : ");
    sensor2_data = Wire.read();
    sensor2_data |= Wire.read()<<8;
    sensor2_data |= Wire.read()<<16;
    sensor2_data |= Wire.read()<<24;
    Serial.println(sensor2_data);
  }

  // Get sensor 3 data
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(READ_SENSOR);              // sends command
  Wire.write(PARAM_SENSOR3);
  Wire.endTransmission();
  Wire.requestFrom(SLAVE_ADDR,1); // read the returned value
  while (Wire.available()){
    Serial.print("Data from sensor 3 : ");
    sensor3_data = Wire.read();
    Serial.println(sensor3_data);
  }

  // Get data from every sensor at once
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(READ_SENSOR);              // sends command
  Wire.write(PARAM_ALL_SENSORS);
  Wire.endTransmission();
  Wire.requestFrom(SLAVE_ADDR,7); // read the returned value
  Serial.println("All sensors in one message : ");
  while (Wire.available()){
    Serial.print("  Sensor 1 : ");
    sensor1_data = Wire.read();
    sensor1_data |= Wire.read()<<8;
    Serial.println(sensor1_data*0.125);
    Serial.print("  Sensor 2 : ");
    sensor2_data = Wire.read();
    sensor2_data |= Wire.read()<<8;
    sensor2_data |= Wire.read()<<16;
    sensor2_data |= Wire.read()<<24;
    Serial.println(sensor2_data);
    Serial.print("  Sensor 3 : ");
    sensor3_data = Wire.read();
    Serial.println(sensor3_data);
  }
  
  // Get sensors list
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(LIST_SENSORS);              // sends command
  Wire.endTransmission();
  Serial.println("List of sensors :");
  // 96 characters to be received
  // The Wire library buffer has a size of 32 bytes 
  // Read the returned value in packets of 32 bits
  for (int i=0; i<3; i++){  
    Wire.requestFrom(SLAVE_ADDR,32); 
    while (Wire.available()){
      Serial.print((char)Wire.read());
    }
  }

  // Get controller status
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(CONTROLLER_STATUS);              // sends command
  Wire.endTransmission();
  Wire.requestFrom(SLAVE_ADDR,32); // read the returned value
  Serial.print("Controller status : ");
  while (Wire.available()){
    Serial.print((char)Wire.read());
  }
  Serial.println();

  // Get cells status
  Wire.beginTransmission(SLAVE_ADDR); // transmit to slave device
  Wire.write(CELLS_STATUS);              // sends command
  Wire.endTransmission();
  Wire.requestFrom(SLAVE_ADDR,32); // read the returned value
  Serial.print("Cells status : ");
  while (Wire.available()){
    Serial.print((char)Wire.read());
  }
  Serial.println();


  
  Serial.println("Done receiving");
  delay(5000);
}

