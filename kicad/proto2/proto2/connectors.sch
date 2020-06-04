EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 11
Title "Prototype 2 Schematic"
Date "2020-05-23"
Rev "V1"
Comp "Polytech Nice"
Comment1 "Author: Romain Cocogne"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 6050 4200 0    50   Input ~ 0
JTAG_TDO
Text GLabel 6050 4300 0    50   Input ~ 0
JTAG_TDI
Text GLabel 6050 4400 0    50   Input ~ 0
JTAG_TMS
Text GLabel 6050 4500 0    50   Input ~ 0
JTAG_TCK
Text GLabel 6050 4650 0    50   Input ~ 0
JTAG_RST
$Comp
L panneaux_solaires:HEADER_2x7_2.54MM J5
U 1 1 5EB49A7C
P 6350 4200
F 0 "J5" H 6450 4331 35  0000 C CNN
F 1 "HEADER_2x7_2.54MM" H 6450 4262 35  0000 C CNN
F 2 "panneaux_solaires:TE_5104338-2" H 6350 4410 35  0001 C BNN
F 3 "" H 6350 4200 35  0001 L TNN
F 4 "ODE0184" H 6350 4260 35  0001 R BNN "a_CODE_ODY"
	1    6350 4200
	1    0    0    -1  
$EndComp
Text GLabel 6800 4450 2    50   Input ~ 0
JTAG_TEST
Text GLabel 6800 4300 2    50   Input ~ 0
JTAG_VCC-TARGET
$Comp
L power:GND #PWR0100
U 1 1 5EB4F27F
P 6200 4850
F 0 "#PWR0100" H 6200 4600 50  0001 C CNN
F 1 "GND" H 6205 4677 50  0000 C CNN
F 2 "" H 6200 4850 50  0001 C CNN
F 3 "" H 6200 4850 50  0001 C CNN
	1    6200 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4200 6300 4200
Wire Wire Line
	6300 4200 6300 4250
Wire Wire Line
	6050 4300 6300 4300
Wire Wire Line
	6050 4400 6050 4350
Wire Wire Line
	6050 4350 6300 4350
Wire Wire Line
	6050 4500 6100 4500
Wire Wire Line
	6100 4500 6100 4400
Wire Wire Line
	6100 4400 6300 4400
Wire Wire Line
	6200 4850 6200 4450
Wire Wire Line
	6200 4450 6300 4450
Wire Wire Line
	6050 4650 6150 4650
Wire Wire Line
	6150 4650 6150 4500
Wire Wire Line
	6150 4500 6300 4500
Wire Wire Line
	6800 4300 6600 4300
Wire Wire Line
	6700 4450 6700 4400
Wire Wire Line
	6700 4400 6600 4400
Wire Wire Line
	6700 4450 6800 4450
Text GLabel 6650 3650 2    50   Input ~ 0
JTAG_VCC-TARGET
Wire Wire Line
	6500 3650 6650 3650
$Comp
L power:+3.3V #PWR0103
U 1 1 5EB54CA2
P 6500 3400
F 0 "#PWR0103" H 6500 3250 50  0001 C CNN
F 1 "+3.3V" H 6515 3573 50  0000 C CNN
F 2 "" H 6500 3400 50  0001 C CNN
F 3 "" H 6500 3400 50  0001 C CNN
	1    6500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3400 6500 3650
$Comp
L panneaux_solaires:Vsolar #PWR0101
U 1 1 5EAF9B01
P 3600 3450
F 0 "#PWR0101" H 3600 3300 50  0001 C CNN
F 1 "Vsolar" H 3615 3623 50  0000 C CNN
F 2 "" H 3600 3450 50  0001 C CNN
F 3 "" H 3600 3450 50  0001 C CNN
	1    3600 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EAF9F73
P 3600 4700
F 0 "#PWR0102" H 3600 4450 50  0001 C CNN
F 1 "GND" H 3605 4527 50  0000 C CNN
F 2 "" H 3600 4700 50  0001 C CNN
F 3 "" H 3600 4700 50  0001 C CNN
	1    3600 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4500 3600 4500
Wire Wire Line
	3600 4500 3600 4700
Wire Wire Line
	3800 3600 3600 3600
Wire Wire Line
	3600 3600 3600 3450
Text GLabel 3800 4000 0    50   Input ~ 0
SDA
Text GLabel 3800 3900 0    50   Input ~ 0
SCL
$Comp
L panneaux_solaires:0532610871 J6
U 1 1 5ED51DB1
P 4200 4100
F 0 "J6" H 4430 4196 50  0000 L CNN
F 1 "0532610871" H 4430 4105 50  0000 L CNN
F 2 "MOLEX_0532610871" H 4200 4100 50  0001 L BNN
F 3 "3.4mm" H 4200 4100 50  0001 L BNN
F 4 "Molex" H 4200 4100 50  0001 L BNN "Champ4"
F 5 "J" H 4200 4100 50  0001 L BNN "Champ5"
F 6 "Manufacturer Recommendations" H 4200 4100 50  0001 L BNN "Champ6"
	1    4200 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4300 3600 4300
Wire Wire Line
	3600 4300 3600 4500
Connection ~ 3600 4500
Wire Wire Line
	3800 4200 3600 4200
Wire Wire Line
	3600 4200 3600 4300
Connection ~ 3600 4300
Wire Wire Line
	3800 4000 3800 4100
Wire Wire Line
	3800 3800 3800 3900
Wire Wire Line
	3800 3600 3800 3700
Connection ~ 3800 3600
Text Notes 4100 2300 0    118  ~ 0
Connectors
$EndSCHEMATC
