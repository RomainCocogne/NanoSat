EESchema Schematic File Version 4
LIBS:proto2-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 9
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
L panneaux_solaires:MCP1501_1-25V U?
U 1 1 5E73C9D5
P 5600 3100
F 0 "U?" H 5600 3717 50  0000 C CNN
F 1 "MCP1501_1-25V" H 5600 3626 50  0000 C CNN
F 2 "" H 5600 3100 50  0001 C CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/1664fa.pdf" H 5600 3100 50  0001 C CNN
	1    5600 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E73CF93
P 5100 3750
F 0 "#PWR?" H 5100 3500 50  0001 C CNN
F 1 "GND" H 5105 3577 50  0000 C CNN
F 2 "" H 5100 3750 50  0001 C CNN
F 3 "" H 5100 3750 50  0001 C CNN
	1    5100 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3750 5100 3600
Wire Wire Line
	6100 3200 6100 3400
Wire Wire Line
	6100 3600 5100 3600
Connection ~ 6100 3400
Wire Wire Line
	6100 3400 6100 3600
Connection ~ 5100 3600
Wire Wire Line
	5100 3600 5100 3400
Wire Wire Line
	5100 3000 4950 3000
Wire Wire Line
	4950 3000 4950 3600
Wire Wire Line
	4950 3600 5100 3600
Wire Wire Line
	6100 3000 6100 2800
Wire Wire Line
	5100 3200 4850 3200
Wire Wire Line
	4850 3200 4850 2800
Wire Wire Line
	4850 2800 5100 2800
$Comp
L panneaux_solaires:Vsolar #PWR?
U 1 1 5E74306A
P 4850 2800
F 0 "#PWR?" H 4850 2650 50  0001 C CNN
F 1 "Vsolar" H 4865 2973 50  0000 C CNN
F 2 "" H 4850 2800 50  0001 C CNN
F 3 "" H 4850 2800 50  0001 C CNN
	1    4850 2800
	1    0    0    -1  
$EndComp
Connection ~ 4850 2800
$Comp
L panneaux_solaires:Vref #PWR?
U 1 1 5E74403A
P 6350 2800
F 0 "#PWR?" H 6350 2650 50  0001 C CNN
F 1 "Vref" H 6367 2973 50  0000 C CNN
F 2 "" H 6350 2800 50  0001 C CNN
F 3 "" H 6350 2800 50  0001 C CNN
	1    6350 2800
	1    0    0    -1  
$EndComp
Connection ~ 6100 2800
$Comp
L panneaux_solaires:1k R?
U 1 1 5E7524F0
P 7200 3200
F 0 "R?" H 7268 3246 50  0000 L CNN
F 1 "1k" H 7268 3155 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 7240 3190 50  0001 C CNN
F 3 "" H 7200 3200 50  0001 C CNN
	1    7200 3200
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:2.2uF C?
U 1 1 5E75296D
P 7200 3450
F 0 "C?" H 7292 3496 50  0000 L CNN
F 1 "2.2uF" H 7292 3405 50  0000 L CNN
F 2 "" H 7200 3450 50  0001 C CNN
F 3 "~" H 7200 3450 50  0001 C CNN
	1    7200 3450
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:2.2uF C?
U 1 1 5E752F2B
P 3850 3300
F 0 "C?" H 3942 3346 50  0000 L CNN
F 1 "2.2uF" H 3942 3255 50  0000 L CNN
F 2 "" H 3850 3300 50  0001 C CNN
F 3 "~" H 3850 3300 50  0001 C CNN
	1    3850 3300
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Vsolar #PWR?
U 1 1 5E8C3985
P 3850 3200
F 0 "#PWR?" H 3850 3050 50  0001 C CNN
F 1 "Vsolar" H 3865 3373 50  0000 C CNN
F 2 "" H 3850 3200 50  0001 C CNN
F 3 "" H 3850 3200 50  0001 C CNN
	1    3850 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E8C4081
P 3850 3400
F 0 "#PWR?" H 3850 3150 50  0001 C CNN
F 1 "GND" H 3855 3227 50  0000 C CNN
F 2 "" H 3850 3400 50  0001 C CNN
F 3 "" H 3850 3400 50  0001 C CNN
	1    3850 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2800 6350 2800
$Comp
L power:GND #PWR?
U 1 1 5E8C6EC0
P 7200 3700
F 0 "#PWR?" H 7200 3450 50  0001 C CNN
F 1 "GND" H 7205 3527 50  0000 C CNN
F 2 "" H 7200 3700 50  0001 C CNN
F 3 "" H 7200 3700 50  0001 C CNN
	1    7200 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3700 7200 3550
Wire Wire Line
	7200 3050 7200 2950
$Comp
L panneaux_solaires:Vref #PWR?
U 1 1 5E8C7C73
P 7200 2950
F 0 "#PWR?" H 7200 2800 50  0001 C CNN
F 1 "Vref" H 7217 3123 50  0000 C CNN
F 2 "" H 7200 2950 50  0001 C CNN
F 3 "" H 7200 2950 50  0001 C CNN
	1    7200 2950
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:100nF C?
U 1 1 5E86AB42
P 3450 3300
F 0 "C?" H 3542 3346 50  0000 L CNN
F 1 "100nF" H 3542 3255 50  0000 L CNN
F 2 "" H 3450 3300 50  0001 C CNN
F 3 "~" H 3450 3300 50  0001 C CNN
	1    3450 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3400 3850 3400
Connection ~ 3850 3400
Wire Wire Line
	3450 3200 3850 3200
Connection ~ 3850 3200
$EndSCHEMATC
