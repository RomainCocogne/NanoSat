/*
 * Author : Quentin Combal
 *
 * Part of the NiceCube project
 *
 * Based off the MSP430 USCI I2C slave example by Stefan Wendler
 * <https://github.com/wendlers/msp430-i2cslave>
 *
 * This program can be tested with master_writer_nano_sat
 * demo program running on an Arduino board acting as the
 * i2c master.
 *
 * This program makes the MSP430 act as an i2c slave. It receives
 * commands from the master with eventual parameters and sends back
 * the requested data
 *
 */

#include <msp430.h>
#include <string.h>
#include "TI_USCI_I2C_slave.h"

/* callback for start condition */
void start_cb();

/* callback for bytes received */
void receive_cb(unsigned char receive);

/* callback to transmit bytes */
void transmit_cb(unsigned char volatile *receive);

/* Commands */
#define CMD_READ_SENSOR         0x01
#define CMD_LIST_SENSORS        0x02
#define CMD_CONTROLLER_STATUS   0x03
#define CMD_CELLS_STATUS        0x04
#define CMD_UNKNOWN             0x99

/* Parameters */
#define PAR_SENSOR1         0x01
#define PAR_SENSOR2         0x02
#define PAR_SENSOR3         0x03
#define PAR_ALL_SENSORS     0x04
#define PAR_UNKNOWN         0xFF

/* Responses */
#define RES_ERROR   0xFF

/* Buffer size */
#define MAX_BUFF_SIZE 128

/* last command */
unsigned char cmd = CMD_UNKNOWN;

/* last parameter */
unsigned char par = PAR_UNKNOWN;

/* response to send out on read req. */
char message_buffer[MAX_BUFF_SIZE];
unsigned int buffer_index = 0;


/*
 * Valeurs des capteurs. Buffers de tailles différentes pour représenter
 * différents types de capteurs
 */

char sensor1_data[2] = {0x88, 0xFF};             // Valeur -120
char sensor2_data[4] = {0x76, 0xFD, 0xFF, 0xFF}; // Valeur -650
char sensor3_data[1] = {0x03};                   // Valeur 3

/*Fonctions qui émulent l'acquisition d'une donnée depuis un capteur*/
void get_sensor1_data(){
    // Boucle de délai pour simuler le temps d'acquisition
    // et de traitment des capteurs
    unsigned long int i;
    unsigned long int delay = 1<<5;
    for(i=0; i<delay; i++);

    //Lecture des valeurs
    message_buffer[buffer_index++] = sensor1_data[0];
    message_buffer[buffer_index++] = sensor1_data[1];
}

void get_sensor2_data(){
    unsigned long int i;
    unsigned long int delay = 1;
    delay = delay<<10;
    for(i=0; i<delay; i++);
    message_buffer[buffer_index++] = sensor2_data[0];
    message_buffer[buffer_index++] = sensor2_data[1];
    message_buffer[buffer_index++] = sensor2_data[2];
    message_buffer[buffer_index++] = sensor2_data[3];
}

void get_sensor3_data(){
    unsigned long int i;
    unsigned long int delay = 1;
    delay = delay<<15;
    for(i=0; i<delay; i++);
    message_buffer[buffer_index++] = sensor3_data[0];
}

void get_sensors_list(){
    // Clear buffer
    memset(message_buffer, 0, 128);
    // Basic test message of 96 characters
    strcpy(message_buffer, "Sensor 1: LM75A Thermometer\n"
                           "Sensor 2: LSM9DS1 Magnetic sensor\n"
                           "Sensor 3: MLX90641 Thermal Camera\n");
}

void get_controller_status(){
    // Clear buffer
    memset(message_buffer, 0, 128);
    //Basic test message
    strcpy(message_buffer, "Controller OK");
}

void get_cells_status(){
    // Clear buffer
    memset(message_buffer, 0, 128);
    //Basic test message
    strcpy(message_buffer, "All cells OK");
}

/*Place 0xFFFFFFFF dans le buffer pour signaler une erreur*/
void error_message(){
    message_buffer[buffer_index++] = RES_ERROR;
    message_buffer[buffer_index++] = RES_ERROR;
    message_buffer[buffer_index++] = RES_ERROR;
    message_buffer[buffer_index++] = RES_ERROR;
}

/* Determine l'action a effectuer selon la commande*/
void process_cmd(unsigned char cmd, unsigned char par)
{
    // Reset buffer index for writing
    buffer_index = 0;

    switch (cmd){
        case CMD_READ_SENSOR:
                if ((par == PAR_SENSOR1) || (par == PAR_ALL_SENSORS))
                    get_sensor1_data();
                if ((par == PAR_SENSOR2) || (par == PAR_ALL_SENSORS))
                    get_sensor2_data();
                if ((par == PAR_SENSOR3) || (par == PAR_ALL_SENSORS))
                    get_sensor3_data();
            break;
        case CMD_LIST_SENSORS:
            get_sensors_list();
            break;
        case CMD_CONTROLLER_STATUS:
            get_controller_status();
            break;
        case CMD_CELLS_STATUS:
            get_cells_status();
            break;
        default:
            error_message();
    }

    // Reset buffer index for the next transmit request
        buffer_index = 0;
}

void start_cb()
{
    cmd = CMD_UNKNOWN;
    par = PAR_UNKNOWN;
}

void receive_cb(unsigned char receive)
{
    if(cmd == CMD_UNKNOWN) {

        cmd = receive;

        if(cmd == CMD_LIST_SENSORS || cmd == CMD_CONTROLLER_STATUS || cmd == CMD_CELLS_STATUS) {
            // Commande sans paramètre
            process_cmd(cmd, PAR_UNKNOWN);
        }
    } else {
        par = receive;
        process_cmd(cmd, par);
    }
}

void transmit_cb(unsigned char volatile *byte)
{
    *byte = message_buffer[buffer_index];
    if (buffer_index < MAX_BUFF_SIZE - 1)
        buffer_index++;
}

int main(void)
{
    // TODO : Changer le header comment dans tous les fichiers
    //        Suivre le conseils d'optimisation dans tous les codes

    WDTCTL = WDTPW + WDTHOLD;                      // Stop WDT

    TI_USCI_I2C_slaveinit(start_cb, transmit_cb, receive_cb, 0x40);

    // Met le microcontrolleur en mode low power
    // et active les interruptions
    __bis_SR_register(CPUOFF + GIE);


    // Le reste du programme boucle dans le vide. Les fonctions de callback
    // sont appellées quand leurs interruptions sont déclenchées.
    while(1);

}
