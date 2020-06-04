#ifndef USCI_LIB
#define USCI_LIB

#define SDA_PIN (1 << 7)                                  // msp430g2553 UCB0SDA pin
#define SCL_PIN (1 << 6)                                  // msp430g2553 UCB0SCL pin

void TI_USCI_I2C_receiveinit(unsigned char slave_address, unsigned char prescale);
void TI_USCI_I2C_transmitinit(unsigned char slave_address, unsigned char prescale);


void TI_USCI_I2C_receive(unsigned char byteCount, unsigned char *field);
void TI_USCI_I2C_transmit(unsigned char byteCount, unsigned char *field);


unsigned char TI_USCI_I2C_slave_present(unsigned char slave_address);
unsigned char TI_USCI_I2C_notready();


#endif
