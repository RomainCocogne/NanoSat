#include <Wire.h>

const byte SLAVE_ADDR = 0x1E; // 0x1E pour le magnetomètre, 0x6B pour le acc/gyro 
const byte CTRL_REG_1 = 0x20; // valeur par defaut 0001 0000
const byte CTRL_REG_2 = 0x21; // valeur par defaut 0000 0000
const byte CTRL_REG_3 = 0x22; // valeur par defaut 0000 0011
const byte CTRL_REG_4 = 0x23; // valeur par defaut 0000 0000
const byte CTRL_REG_5 = 0x24; // valeur par defaut 0000 0000
const byte WHO_AM_I = 0x0f; //Registre d'indentification, pour verifier la connection
const byte OUT_X_L = 0x28;
const byte OUT_X_H = 0x29;
const byte OUT_Y_L = 0x2a;
const byte OUT_Y_H = 0x2b;
const byte OUT_Z_L = 0x2c;
const byte OUT_Z_H = 0x2d; 
int16_t data = 0;
float B_z,B_y,B_x;
float B_zmax, B_zmin, B_ymax, B_ymin, B_xmax, B_xmin;
float off_x, off_y, off_z;

void setup() {
  B_zmax = 0.0; B_ymax = 0.0; B_xmax = 0.0;
  B_zmin = 0.0; B_ymin = 0.0; B_xmin = 0.0;
  // Init port serie pour le debug
  Serial.begin(9600);
  //Init I2C connection as master
  Wire.begin();

  //Setup the magnetometer 
  // - Use high performance mode for x,y, and z axes
  // - Output data rate 10Hz 
  // - -+4gauss scale (default)
  // - Continuous conversion
  int8_t errors = 1;
  int8_t val;
  while( errors != 0){
    errors = 0;
    Wire.beginTransmission(SLAVE_ADDR);

    // CTRL_REG_1 
//    Wire.write(CTRL_REG_1);
//    val = (3<<5)|(4<<2); // x and y axis ultra high performance mode
//    Wire.write(val);
//    errors += Wire.endTransmission();

    // CTRL_REG_3
    Wire.write(CTRL_REG_3);
    val = 0x00; // continuous conversion
    Wire.write(val);
    errors += Wire.endTransmission();

    // CTRL_REG_4
//    Wire.write(CTRL_REG_4);
////    val = 0x0C; // z axis ultra high performance mode
//    Wire.write(val);
//    errors += Wire.endTransmission();
    
    delay(1000);
    
    if (errors){
      Serial.println("Setup failed, trying again");
    }
  }
  Serial.println("Setup done");
}

void loop() {
  for (int i=0; i<10; ++i){
    // Begin transmission with this slave device
    Wire.beginTransmission(SLAVE_ADDR);
    // Ask to access the values registers
    Wire.write(OUT_X_L); //Write value in Tx buffer
    if ( Wire.endTransmission() == 0){ //Send value and check for success
      // Get the value of the registers we asked for
      Wire.requestFrom(SLAVE_ADDR, (uint8_t) 6);
      data = Wire.read();   // LSB
      data |= Wire.read() << 8; // MSB
      B_x =  data*0.14;
      data = Wire.read();   // LSB
      data |= Wire.read() << 8; // MSB
      B_y = data*0.14;
      data = Wire.read();   // LSB
      data |= Wire.read() << 8;  // MSB
      B_z = data*0.14;
    }
    
    //Update max for each coordinate
    if (B_z > B_zmax)
      B_zmax = B_z;
    if (B_y > B_ymax)
      B_ymax = B_y;
    if (B_x > B_xmax)
      B_xmax = B_x;

    //Update min for each coordinate 
    if (B_z < B_zmin)
      B_zmin = B_z;
    if (B_y < B_ymin)
      B_ymin = B_y;
    if (B_x < B_xmin)
      B_xmin = B_x;
     
    delay(10);
  }
  
  //Calculate offset 
  off_x = (B_xmax + B_xmin)*0.5;
  off_y = (B_ymax + B_ymin)*0.5;
  off_z = (B_zmax + B_zmin)*0.5;
   
//  Serial.println("------------------------------------------------------");
//  Serial.print("Bxmax : ");Serial.print(B_xmax);Serial.print(" mGauss  ");
//  Serial.print("Bxmin : ");Serial.print(B_xmin);Serial.println(" mGauss  ");
  Serial.print("Offset sur x : "); Serial.print(off_x);
//  Serial.println();
//  Serial.print("Bymax : ");Serial.print(B_ymax);Serial.print(" mGauss  ");
//  Serial.print("Bymin : ");Serial.print(B_ymin);Serial.println(" mGauss  ");
  Serial.print("  Offset sur y : "); Serial.print(off_y);
//  Serial.println();
//  Serial.print("Bzmax : ");Serial.print(B_zmax);Serial.print(" mGauss  ");
//  Serial.print("Bzmin : ");Serial.print(B_zmin);Serial.println(" mGauss  "); 
  Serial.print("  Offset sur z : "); Serial.println(off_z);
//  Serial.println(); 
//  Serial.println("------------------------------------------------------");
}
