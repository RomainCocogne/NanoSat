#include <Wire.h>
const int WHO_AM_I = 0x28;

void setup() {
  // Init port serie pour le debug
  Serial.begin(9600);
  //Init la conection i2c en tant que master (pas besoin de specifier d'addresse)
  Wire.begin();
  
   for (byte i = 1; i < 120; i++)
  {
    // Begin transmission with this slave device
    Wire.beginTransmission(i);
    // Ask to access the WHO_AM_I register
    Wire.write(WHO_AM_I); //Write value in Tx buffer
    if ( Wire.endTransmission() == 0){ //Send value but don't kill the connection
      // Get the value of the register we asked for
      Wire.requestFrom(i, (uint8_t) 1);
      Serial.print("Ox");Serial.print(i,HEX);
      Serial.print("  ;  Value : ");Serial.println(Wire.read());
      delay(1);
    }
  }
}

void loop() {
  // put your main code here, to run repeatedly: 
  
}
