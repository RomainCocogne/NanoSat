<<<<<<< HEAD
/*** USCI master library ************************************************************

In this file the usage of the USCI I2C master library without DMA support is 
shown. This library uses pointers to specify what data is to be sent. 

When calling the TI_USCI_I2C_receive or TI_USCI_I2C_transmit routines 
the number of bytes, which are to be transmitted or received have to be passed as 
well as a pointer to a data field, that contains(or stores) the data.
*******************************************************************************
Modified by Quentin Combal to work with the LM75A temperature sensor
as part of the NanoSat project

This program is used to communicate with the LM75A thermometer using I2C

*******************************************************************************/

#include "msp430x26x.h"
#include "TI_USCI_I2C_master.h"

#define ADDR 0x48

unsigned char timercounter;
//unsigned char array[40] = { 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xa, 0xb };
unsigned char store[40] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int data;
float value;
const float offset = 0.25;

void main(void)
{
  WDTCTL = WDTPW + WDTHOLD;                 // Stop WDT

  BCSCTL1 = CALBC1_8MHZ; 
  DCOCTL = CALDCO_8MHZ;

  _EINT();

  TI_USCI_I2C_transmitinit(ADDR,0x12);  // init transmitting with USCI
  while ( TI_USCI_I2C_notready() );         // wait for bus to be free
  if ( TI_USCI_I2C_slave_present(ADDR) )    // slave address may differ from
  {                                         // initialization
    TI_USCI_I2C_receiveinit(ADDR,0x12);   // init receiving with USCI
    while ( TI_USCI_I2C_notready() );         // wait for bus to be free
    TI_USCI_I2C_receive(2,store);
    while ( TI_USCI_I2C_notready() );         // wait for bus to be free
    //TODO: Tester que �a fonctionne avec des temp�ratures n�gatives
    data = (store[0] << 3) | (store[1] >> 5);
    if (data & (1 << 10))
        data = -data;
    value = data*0.125-offset;

//    TI_USCI_I2C_transmitinit(ADDR,0x12);  // init transmitting with
//    while ( TI_USCI_I2C_notready() );         // wait for bus to be free
//    TI_USCI_I2C_transmit(4,array);       // start transmitting
  }
  
  LPM3;
 
}

=======
/*** USCI master library ************************************************************

In this file the usage of the USCI I2C master library without DMA support is 
shown. This library uses pointers to specify what data is to be sent. 

When calling the TI_USCI_I2C_receive or TI_USCI_I2C_transmit routines 
the number of bytes, which are to be transmitted or received have to be passed as 
well as a pointer to a data field, that contains(or stores) the data.

This code checks if there is a slave with address 0x48 is connected to the I2C
bus and if the slave device is present, bytes are received and transmitted.

Uli Kretzschmar
MSP430 Systems
Freising
*******************************************************************************/
#include "msp430x26x.h"
#include "TI_USCI_I2C_master.h"

#define ADDR 0x48

unsigned char timercounter;
//unsigned char array[40] = { 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xa, 0xb };
unsigned char store[40] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int data;
float value;
const float offset = 0.25;

void main(void)
{
  WDTCTL = WDTPW + WDTHOLD;                 // Stop WDT

  BCSCTL1 = CALBC1_8MHZ; 
  DCOCTL = CALDCO_8MHZ;

  _EINT();

  TI_USCI_I2C_transmitinit(ADDR,0x12);  // init transmitting with USCI
  while ( TI_USCI_I2C_notready() );         // wait for bus to be free
  if ( TI_USCI_I2C_slave_present(ADDR) )    // slave address may differ from
  {                                         // initialization
    TI_USCI_I2C_receiveinit(ADDR,0x12);   // init receiving with USCI
    while ( TI_USCI_I2C_notready() );         // wait for bus to be free
    TI_USCI_I2C_receive(2,store);
    while ( TI_USCI_I2C_notready() );         // wait for bus to be free
    //Tester que �a fonctionne avec des temp�ratures n�gatives
    data = (store[0] << 3) | (store[1] >> 5);
    if (data & (1 << 10))
        data = -data;
    value = data*0.125-offset;

//    TI_USCI_I2C_transmitinit(ADDR,0x12);  // init transmitting with
//    while ( TI_USCI_I2C_notready() );         // wait for bus to be free
//    TI_USCI_I2C_transmit(4,array);       // start transmitting
  }
  
  LPM3;
 
}

>>>>>>> master
