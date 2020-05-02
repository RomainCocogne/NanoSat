/*
 * This file is part of the MSP430 USCI I2C slave example.
 *
 * Copyright (C) 2012 Stefan Wendler <sw@kaltpost.de>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * This firmware acts as an I2C slave on address 0x90(W)/0x91(R).
 * It receives a command / parameter pair from the I2C master and
 * sends out a response on a masters read request.
 *
 * The firmware knows two commands:
 *
 * CMD_SETLED: sets the build in LED (P1.0) of the launchpad depending
 * on the given parameter to HIGH (0x01) or LOW (0x00).
 *
 * CMD_GETBTN: copies the state of the build in push-button (P1.3) to
 * the response buffer and transmits it to the master on the next read
 * request.
 *
 * As a I2C master, the bus pirate could be used. To set the BP into
 * I2C mode use:
 *
 *    m4 3
 *
 * Bus-Piret I2C commands to
 *
 * - set LED HIGH (P1.0)
 *    [0x90 0x00 0x01
 *
 * - set LED LOW  (P1.0)
 *    [0x90 0x00 0x00
 *
 * - get BUTTON state (P1.3)
 *    [0x90 0x01 [0x91 r
 *
 * For a quick start to setup the I2C slave, the TI USCI I2C slave
 * code from slaa383 was used and slightly modified to work on
 * the MSP430G2553 and the MSP-GCC. For detail on leagal issues
 * regarding the TI_USCI_I2C_slave code see "ti-usci-i2c-slave-legal.txt".
 *
 * NOTE: 100k extrnal pull-ups are needed on SDA/SDC.
 */

#include <msp430.h>
//#include <legacymsp430.h>

#include "TI_USCI_I2C_slave.h"

/* callback for start condition */
void start_cb();

/* callback for bytes received */
void receive_cb(unsigned char receive);

/* callback to transmit bytes */
void transmit_cb(unsigned char volatile *receive);

/* Commands */
#define CMD_READ_SENSOR1  0x01
#define CMD_READ_SENSOR2  0x02
#define CMD_READ_SENSOR3  0x03


/* Responses */
#define RES_ERROR   0xFF

/* Buffer size */
#define MAX_BUFF_SIZE 32


/* response to send out on read req. */
char message_buffer[MAX_BUFF_SIZE];
unsigned int buffer_index;

// Valeurs des capteurs. Buffers de tailles différentes pour représenter
// différents types de capteurs
char sensor1_data[2] = {0x88, 0xFF};  //Valeur -120. Semblable a ce qui est renvoyé par
                                      //le capteur de température (correpondrait à -15 degrés C)
char sensor2_data[4] = {0x76, 0xFD, 0xFF, 0xFF}; //Valeur -650
char sensor3_data[1] = {0x03}; //Valeur 3

// Fonctions qui émulent l'acquisition d'une donnée depuis un capteur
void get_sensor1_data(){
    // Boucle de délai pour simuler le temps d'acquisition
    // et de traitment des capteurs
    unsigned long int i;
    unsigned long int reach = 1<<5;
    for(i=0; i<reach; i++);

    //Lecture des valeurs
    message_buffer[buffer_index++] = sensor1_data[0];
    message_buffer[buffer_index++] = sensor1_data[1];
}

void get_sensor2_data(){
    unsigned long int i;
    unsigned long int reach = 1;
    reach = reach<<10;
    for(i=0; i<reach; i++);
    message_buffer[buffer_index++] = sensor2_data[0];
    message_buffer[buffer_index++] = sensor2_data[1];
    message_buffer[buffer_index++] = sensor2_data[2];
    message_buffer[buffer_index++] = sensor2_data[3];
}

void get_sensor3_data(){
    unsigned long int i;
    unsigned long int reach = 1;
    reach = reach<<15;
    for(i=0; i<reach; i++);
    message_buffer[buffer_index++] = sensor3_data[0];
}

// Function qui place 0xFFFFFFFF dans le buffer pour signaler une erreur
void error_message(){
    message_buffer[buffer_index++] = RES_ERROR;
    message_buffer[buffer_index++] = RES_ERROR;
    message_buffer[buffer_index++] = RES_ERROR;
    message_buffer[buffer_index++] = RES_ERROR;
}

void start_cb()
{
    buffer_index = 0;
}

void receive_cb(unsigned char receive)
{
    // Lit la commande reçue
    switch (receive){
        case CMD_READ_SENSOR1:
            get_sensor1_data();
            break;
        case CMD_READ_SENSOR2:
            get_sensor2_data();
            break;
        case CMD_READ_SENSOR3:
            get_sensor3_data();
            break;
        default:
            error_message();
    }
}

void transmit_cb(unsigned char volatile *byte)
{
    //*byte = res;
    *byte = message_buffer[buffer_index++];
}

int main(void)
{
    // TODO : Adapter le programme pour pouvoir lire n fois d'affilée le même sensor
    //        Changer le header comment dans tous les fichiers
    //        Suivre le conseils d'optimisation dans tous les codes
    WDTCTL = WDTPW + WDTHOLD;                      // Stop WDT

    TI_USCI_I2C_slaveinit(start_cb, transmit_cb, receive_cb, 0x40);

    // Commandes de calibration dans le programme original.
    // Aucune utilité  à priori donc enlenvé
    //BCSCTL1 = CALBC1_16MHZ;
    //DCOCTL  = CALDCO_16MHZ;

    // Met le microcontrolleur en mode low power
    // et active les interruptions
    __bis_SR_register(CPUOFF + GIE);


    // Le reste du programme boucle dans le vide. Les fonctions de callback
    // sont appellées quand leurs interruptions respectives sont déclenchées.
    while(1);

    return 0;
}
