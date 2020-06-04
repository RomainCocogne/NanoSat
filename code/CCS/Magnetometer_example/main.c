#include <msp430.h> 
#include "TI_USCI_I2C_master.h"

/**
 * main.c
 */

// Offsets calculés avec le programme de calibration
const float OFFSET_X = 122.50;
const float OFFSET_Y = 143.36;
const float OFFSET_Z = 56.35;

// Addrese du capteur
const char ADDR = 0x1E; // 0x1E pour le magnetometre, 0x6B pour le acc/gyro

// Prescaler pour SCL
const char SCL_PRESCALER = 0x12;

// Adresses des registres du capteur
const char CTRL_REG_3 = 0x22; // valeur par defaut 0000 0011
const char OUT_X_L = 0x28;
//const char OUT_X_H = 0x29;
//const char OUT_Y_L = 0x2a;
//const char OUT_Y_H = 0x2b;
//const char OUT_Z_L = 0x2c;
//const char OUT_Z_H = 0x2d;

// Valeur à charger pour demarrer le capteur
const char CTRL_REG_3_VAL = 0x00;

// Message buffers
unsigned char send[2];
unsigned char receive[40];

// Data and result variables
int data = 0;
float B_z,B_y,B_x;

void initMagSensor(){
    TI_USCI_I2C_transmitinit(ADDR, SCL_PRESCALER);
    while ( TI_USCI_I2C_notready() ); // wait for bus to be free
    // Ask for OUT_X_L register
    send[0] = CTRL_REG_3;
    send[1] = CTRL_REG_3_VAL;
    TI_USCI_I2C_transmit(2, send);
    while ( TI_USCI_I2C_notready() ); // wait for bus to be free
}

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
    BCSCTL1 = CALBC1_8MHZ;
    DCOCTL = CALDCO_8MHZ;

    _EINT();
    TI_USCI_I2C_transmitinit(ADDR,SCL_PRESCALER);  // init transmitting with USCI
    while ( TI_USCI_I2C_notready() );         // wait for bus to be free
    if ( TI_USCI_I2C_slave_present(ADDR) )    // slave address may differ from
    {                                         // initialization

      initMagSensor();

      TI_USCI_I2C_transmitinit(ADDR, SCL_PRESCALER);
      while ( TI_USCI_I2C_notready() );
      // Ask for OUT_X_L register
      send[0] = OUT_X_L;
      TI_USCI_I2C_transmit(1, send);
      while ( TI_USCI_I2C_notready() );
      TI_USCI_I2C_receiveinit(ADDR,SCL_PRESCALER);   // init receiving with USCI
      while ( TI_USCI_I2C_notready() );         // wait for bus to be free
      // Ask for 6 bytes of data
      TI_USCI_I2C_receive(6,receive);

      data = receive[0];   // LSB
      data |= receive[1] << 8; // MSB
      B_x =  data*0.14;
      data = receive[2];   // LSB
      data |= receive[3] << 8; // MSB
      B_y = data*0.14;
      data =receive[4];   // LSB
      data |= receive[5] << 8;  // MSB
      B_z = data*0.14;
    }
	return 0;
}
