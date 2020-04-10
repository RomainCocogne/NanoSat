EESchema Schematic File Version 4
LIBS:proto2-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	1950 4150 1350 4150
Wire Wire Line
	1950 4250 1350 4250
$Comp
L panneaux_solaires:10k R?
U 1 1 5E7F52DD
P 900 3700
F 0 "R?" H 968 3746 50  0000 L CNN
F 1 "10k" H 968 3655 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 940 3690 50  0001 C CNN
F 3 "" H 900 3700 50  0001 C CNN
	1    900  3700
	0    -1   -1   0   
$EndComp
$Comp
L panneaux_solaires:10k R?
U 1 1 5E7F8C18
P 900 3800
F 0 "R?" H 1000 3750 50  0000 C CNN
F 1 "10k" H 1000 3850 50  0000 C CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 940 3790 50  0001 C CNN
F 3 "" H 900 3800 50  0001 C CNN
	1    900  3800
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 3800 1050 3700
Connection ~ 1050 3700
Wire Wire Line
	1050 3700 1050 3600
$Comp
L power:+3.3V #PWR?
U 1 1 5E7FD444
P 1050 3600
F 0 "#PWR?" H 1050 3450 50  0001 C CNN
F 1 "+3.3V" H 1065 3773 50  0000 C CNN
F 2 "" H 1050 3600 50  0001 C CNN
F 3 "" H 1050 3600 50  0001 C CNN
	1    1050 3600
	1    0    0    -1  
$EndComp
Text GLabel 750  3800 0    50   Input ~ 0
SCL
Text GLabel 750  3700 0    50   Input ~ 0
SDA
Text GLabel 1350 4150 0    50   Input ~ 0
SDA
Text GLabel 1350 4250 0    50   Input ~ 0
SCL
Wire Wire Line
	1950 2950 1450 2950
Wire Wire Line
	1450 2950 1450 3050
$Comp
L power:GND #PWR?
U 1 1 5E873381
P 1450 3050
F 0 "#PWR?" H 1450 2800 50  0001 C CNN
F 1 "GND" H 1455 2877 50  0000 C CNN
F 2 "" H 1450 3050 50  0001 C CNN
F 3 "" H 1450 3050 50  0001 C CNN
	1    1450 3050
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:MSP430FR5964IPNR IC?
U 1 1 5E7EC3D6
P 1950 2950
F 0 "IC?" H 6794 1996 50  0000 L CNN
F 1 "MSP430FR5964IPNR" H 6794 1905 50  0000 L CNN
F 2 "QFP50P1400X1400X160-80N" H 6600 4650 50  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fmsp430fr5962" H 6600 4550 50  0001 L CNN
F 4 "16 MHz Ultra-Low-Power MCU With 256 KB FRAM, 8 KB SRAM, AES, 12-bit ADC" H 6600 4450 50  0001 L CNN "Description"
F 5 "1.6" H 6600 4350 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 6600 4250 50  0001 L CNN "Manufacturer_Name"
F 7 "MSP430FR5964IPNR" H 6600 4150 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "595-MSP430FR5964IPNR" H 6600 4050 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=595-MSP430FR5964IPNR" H 6600 3950 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6600 3850 50  0001 L CNN "RS Part Number"
F 11 "" H 6600 3750 50  0001 L CNN "RS Price/Stock"
	1    1950 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3050 1750 3050
Wire Wire Line
	1750 3050 1750 2750
$Comp
L panneaux_solaires:Vref #PWR?
U 1 1 5E874011
P 1750 2750
F 0 "#PWR?" H 1750 2600 50  0001 C CNN
F 1 "Vref" H 1767 2923 50  0000 C CNN
F 2 "" H 1750 2750 50  0001 C CNN
F 3 "" H 1750 2750 50  0001 C CNN
	1    1750 2750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
