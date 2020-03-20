 /*
 Desactivation de l'aceleromètre/gyroscope : CTRL_REG3_m = 1

 Registres (p. 63)
 Offset regiters --> pour compenser un offset eventuel dû à l'environement
 CTRL_REG1_M (p.63) : 
  Configration du power mode des axes X et Y (low power par defaut)
  Output data rate : 10Hz par defaut

 CTRL_REG2_M (p.64)
  Scaling : defaut +-4Gauss

 CTRL_REG3_M (p.64)
  I2C_Disable par defaut à 0
  LOW POWER MODE, désactivé par defaut
  Selection du mode d'opération, mode définis p.19.
  Par defaut le mode est "power-down", mettre en route avec 00 ou 01

 CTRL_REG4_M (p.64)
 power mode de l'axe Z (low power par defaut)

 CTRL_REG5_M (p.64)
 Fast read enable (0 par defaut)
 Block data update enable (0 par defaut)

 OUT_X/Y/Z_L/H_M : output registers p.66
 */

/*
 * Valeurs d'offset calculées pour le LSM9DS1 d'adafruit :
 * OFFSET X : 122.50mgauss 
 * OFFSET Y : 143.36mgauss
 * OFFSET Z : 56.35 mgauss
 */

#include <Wire.h>

//TODO : re calculer les valeurs d'offset en int brut non converti
const float OFFSET_X = 122.50;
const float OFFSET_Y = 143.36;
const float OFFSET_Z = 56.35; 

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

void setup() {
  // Init port serie pour le debug
  Serial.begin(9600);
  //Init I2C connection as master
//  P2REN = 0;
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

//    // CTRL_REG_1 
//    Wire.write(CTRL_REG_1);
//    val = 0x70; // x and y axis ultra high performance mode
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
    
    delay(50);
    
    if (errors){
      Serial.println("Setup failed, trying again");
    }
  }
  Serial.println("Setup done");
}

void loop() {
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
  Serial.print("x : ");Serial.print(B_x);Serial.print(" mGauss  ");
  Serial.print(";   y : ");Serial.print(B_y);Serial.print(" mGauss  ");
  Serial.print(";   z : ");Serial.print(B_z);Serial.println(" mGauss  ");
  delay(100);
}
