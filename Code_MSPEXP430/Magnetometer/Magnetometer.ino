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

 OUT_X/Y/Z_L/H_M : output registers p.66*/

#include <Wire.h>

const byte SLAVE_ADDR = 0x1E; // 0x1E pour le magnetomètre, 0x6B pour le acc/gyro 
const byte CTRL_REG_1 = 0x20; // valeur par defaut 0001 1000
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
float B_z; 

void setup() {
  // Init port serie pour le debug
  Serial.begin(9600);
  //Init la conection i2c en tant que master (pas besoin de specifier d'addresse)
  Wire.begin();
  
  int8_t errors = 1;
  int8_t val;
  while( errors != 0){
    errors = 0;
    // Begin transmission with this slave device
    Wire.beginTransmission(SLAVE_ADDR);
    // Ask to access the CTRL_REG_1 register
    Wire.write(CTRL_REG_3);
    val = 0x00; // continuous conversion
    Wire.write(val);
    errors += Wire.endTransmission();

    Wire.write(CTRL_REG_4);
    val = 0x01; // medium performance mode
    Wire.write(val);
    errors += Wire.endTransmission();
    
    delay(50);
    
    if (errors){
      Serial.println("Setup failed, trying again");
    }
  }
  Serial.println("Setup done");
}

void loop() {
  //Sum of 50 values
  int sum10 = 0;
  for (int i=0; i<10; ++i){
    // Begin transmission with this slave device
    Wire.beginTransmission(SLAVE_ADDR);
    // Ask to access the CTRL_REG_1 register
    Wire.write(OUT_Z_L); //Write value in Tx buffer
    if ( Wire.endTransmission() == 0){ //Send value and check for success
      // Get the value of the register we asked for
      Wire.requestFrom(SLAVE_ADDR, (uint8_t) 2);
      data = Wire.read() << 8;   // MSB
      data |= Wire.read();      // LSB
      sum10 += data;
    }
    delay(1);
  }
  B_z = sum10*0.14*0.001/10;
  Serial.println(B_z);
  delay(100);
}
