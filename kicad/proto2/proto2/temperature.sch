EESchema Schematic File Version 4
LIBS:proto2-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+3.3V #PWR?
U 1 1 5E8D3CCF
P 5800 3000
F 0 "#PWR?" H 5800 2850 50  0001 C CNN
F 1 "+3.3V" H 5815 3173 50  0000 C CNN
F 2 "" H 5800 3000 50  0001 C CNN
F 3 "" H 5800 3000 50  0001 C CNN
	1    5800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3200 5800 3000
$Comp
L power:GND #PWR?
U 1 1 5E8D3E8D
P 4800 3650
F 0 "#PWR?" H 4800 3400 50  0001 C CNN
F 1 "GND" H 4805 3477 50  0000 C CNN
F 2 "" H 4800 3650 50  0001 C CNN
F 3 "" H 4800 3650 50  0001 C CNN
	1    4800 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3650 4800 3500
Text HLabel 3900 3400 0    50   Input ~ 0
TEMP_INT
$Comp
L panneaux_solaires:100nF C?
U 1 1 5E8DEE84
P 3400 2950
F 0 "C?" H 3492 2996 50  0000 L CNN
F 1 "100nF" H 3492 2905 50  0000 L CNN
F 2 "" H 3400 2950 50  0001 C CNN
F 3 "~" H 3400 2950 50  0001 C CNN
	1    3400 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E8DF2AC
P 3400 2850
F 0 "#PWR?" H 3400 2700 50  0001 C CNN
F 1 "+3.3V" H 3415 3023 50  0000 C CNN
F 2 "" H 3400 2850 50  0001 C CNN
F 3 "" H 3400 2850 50  0001 C CNN
	1    3400 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E8DF5D2
P 3400 3050
F 0 "#PWR?" H 3400 2800 50  0001 C CNN
F 1 "GND" H 3405 2877 50  0000 C CNN
F 2 "" H 3400 3050 50  0001 C CNN
F 3 "" H 3400 3050 50  0001 C CNN
	1    3400 3050
	1    0    0    -1  
$EndComp
Text HLabel 6100 3300 2    50   Input ~ 0
TEMP-A0
Text HLabel 6100 3400 2    50   Input ~ 0
TEMP_A1
Text HLabel 6100 3500 2    50   Input ~ 0
TEMP_A2
Wire Wire Line
	5800 3500 6100 3500
Wire Wire Line
	6100 3400 5800 3400
Wire Wire Line
	5800 3300 6100 3300
Connection ~ 3950 3400
Wire Wire Line
	3900 3400 3950 3400
Connection ~ 4200 2800
Wire Wire Line
	4450 2800 4200 2800
Wire Wire Line
	4200 2800 3950 2800
Wire Wire Line
	4200 3100 4200 3300
$Comp
L panneaux_solaires:NR R?
U 1 1 5E8F89B6
P 4450 2950
F 0 "R?" H 4518 2996 50  0000 L CNN
F 1 "NR" H 4518 2905 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 4490 2940 50  0001 C CNN
F 3 "" H 4450 2950 50  0001 C CNN
	1    4450 2950
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:NR R?
U 1 1 5E8F8637
P 4200 2950
F 0 "R?" H 4268 2996 50  0000 L CNN
F 1 "NR" H 4268 2905 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 4240 2940 50  0001 C CNN
F 3 "" H 4200 2950 50  0001 C CNN
	1    4200 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3300 4200 3300
$Comp
L power:+3.3V #PWR?
U 1 1 5E8DE152
P 3950 2700
F 0 "#PWR?" H 3950 2550 50  0001 C CNN
F 1 "+3.3V" H 3965 2873 50  0000 C CNN
F 2 "" H 3950 2700 50  0001 C CNN
F 3 "" H 3950 2700 50  0001 C CNN
	1    3950 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2800 3950 2700
Wire Wire Line
	3950 3100 3950 3400
Text HLabel 3900 3200 0    50   Input ~ 0
SDA
Text HLabel 3900 3300 0    50   Input ~ 0
SCL
$Comp
L panneaux_solaires:PCT2075DP,118 IC?
U 1 1 5E8D3880
P 4800 3200
F 0 "IC?" H 5300 3465 50  0000 C CNN
F 1 "PCT2075DP,118" H 5300 3374 50  0000 C CNN
F 2 "SOP65P490X110-8N" H 5650 3300 50  0001 L CNN
F 3 "http://www.nxp.com/docs/en/data-sheet/PCT2075.pdf" H 5650 3200 50  0001 L CNN
F 4 "Board Mount Temperature Sensors I2C-bus Fm+, 1 degree C accuracy, digital temperature sensor and thermal watchdog" H 5650 3100 50  0001 L CNN "Description"
F 5 "1.1" H 5650 3000 50  0001 L CNN "Height"
F 6 "NXP" H 5650 2900 50  0001 L CNN "Manufacturer_Name"
F 7 "PCT2075DP,118" H 5650 2800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "771-PCT2075DP118" H 5650 2700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=771-PCT2075DP118" H 5650 2600 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 5650 2500 50  0001 L CNN "RS Part Number"
F 11 "" H 5650 2400 50  0001 L CNN "RS Price/Stock"
	1    4800 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3200 4450 3200
Wire Wire Line
	4450 3100 4450 3200
$Comp
L panneaux_solaires:330R R?
U 1 1 5E9106ED
P 4650 3200
F 0 "R?" V 4600 3100 50  0000 C CNN
F 1 "330R" V 4600 3350 50  0000 C CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 4690 3190 50  0001 C CNN
F 3 "" H 4650 3200 50  0001 C CNN
	1    4650 3200
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:330R R?
U 1 1 5E91110A
P 4650 3300
F 0 "R?" V 4600 3200 50  0000 C CNN
F 1 "330R" V 4600 3450 50  0000 C CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 4690 3290 50  0001 C CNN
F 3 "" H 4650 3300 50  0001 C CNN
	1    4650 3300
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:330R R?
U 1 1 5E9114EF
P 4650 3400
F 0 "R?" V 4600 3300 50  0000 C CNN
F 1 "330R" V 4600 3550 50  0000 C CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 4690 3390 50  0001 C CNN
F 3 "" H 4650 3400 50  0001 C CNN
	1    4650 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 3200 4450 3200
Connection ~ 4450 3200
Wire Wire Line
	4500 3300 4200 3300
Connection ~ 4200 3300
Wire Wire Line
	3950 3400 4500 3400
$Comp
L panneaux_solaires:NR R?
U 1 1 5E9176FE
P 3950 2950
F 0 "R?" H 4018 2996 50  0000 L CNN
F 1 "NR" H 4018 2905 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 3990 2940 50  0001 C CNN
F 3 "" H 3950 2950 50  0001 C CNN
	1    3950 2950
	1    0    0    -1  
$EndComp
$EndSCHEMATC