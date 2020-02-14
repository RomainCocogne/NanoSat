EESchema Schematic File Version 4
LIBS:1_solar_bank-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L power:GND #PWR0102
U 1 1 5E3D9404
P 2950 6850
F 0 "#PWR0102" H 2950 6600 50  0001 C CNN
F 1 "GND" H 2955 6677 50  0000 C CNN
F 2 "" H 2950 6850 50  0001 C CNN
F 3 "" H 2950 6850 50  0001 C CNN
	1    2950 6850
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC1
U 1 1 5E3DE122
P 2950 3950
F 0 "SC1" H 3058 4000 50  0000 L CNN
F 1 "Solar_Cell" H 3050 3950 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 2950 4010 50  0001 C CNN
F 3 "~" V 2950 4010 50  0001 C CNN
	1    2950 3950
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC2
U 1 1 5E3DECE3
P 2950 4250
F 0 "SC2" H 3058 4300 50  0000 L CNN
F 1 "Solar_Cell" H 3050 4250 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 2950 4310 50  0001 C CNN
F 3 "~" V 2950 4310 50  0001 C CNN
	1    2950 4250
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC3
U 1 1 5E3DF0C8
P 2950 4550
F 0 "SC3" H 3058 4600 50  0000 L CNN
F 1 "Solar_Cell" H 3050 4550 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 2950 4610 50  0001 C CNN
F 3 "~" V 2950 4610 50  0001 C CNN
	1    2950 4550
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC4
U 1 1 5E3DF3C4
P 2950 4850
F 0 "SC4" H 3058 4900 50  0000 L CNN
F 1 "Solar_Cell" H 3050 4850 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 2950 4910 50  0001 C CNN
F 3 "~" V 2950 4910 50  0001 C CNN
	1    2950 4850
	1    0    0    -1  
$EndComp
$Comp
L 1_solar_bank-rescue:D_Schottky-panneaux_solaires D2
U 1 1 5E3ECE28
P 2950 3600
F 0 "D2" V 2904 3679 50  0000 L CNN
F 1 "D_Schottky" V 2995 3679 50  0000 L CNN
F 2 "panneaux_solaires:SOD3715X135N" H 2950 3600 50  0001 C CNN
F 3 "~" H 2950 3600 50  0001 C CNN
	1    2950 3600
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Vsolar #PWR0101
U 1 1 5E3D675E
P 2950 3250
F 0 "#PWR0101" H 2950 3100 50  0001 C CNN
F 1 "Vsolar" H 2967 3423 50  0000 C CNN
F 2 "" H 2950 3250 50  0001 C CNN
F 3 "" H 2950 3250 50  0001 C CNN
	1    2950 3250
	1    0    0    -1  
$EndComp
Text GLabel 1300 5800 0    50   Input ~ 0
BNK1_CONTROL
Text Notes 600  2050 0    50   ~ 0
logic 0 or 1 -> 0V or 3.3V \n0V -> NMOS1 off -> PMOS2 grid short circuited -> PMOS2 on\n3.3V -> NMOS1 on -> PMOS2 grid to Vsolar -> PMOS2 off\n
Text GLabel 2200 6450 0    50   Input ~ 0
AMPERMETER1
Wire Wire Line
	2200 6450 2950 6450
Wire Wire Line
	2950 6550 2950 6450
Connection ~ 2950 6450
$Comp
L Device:Fuse_Small F1
U 1 1 5E446EA0
P 2950 3350
F 0 "F1" V 2904 3398 50  0000 L CNN
F 1 "Fuse_Small" V 2995 3398 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" H 2950 3350 50  0001 C CNN
F 3 "~" H 2950 3350 50  0001 C CNN
	1    2950 3350
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D5
U 1 1 5E470E93
P 10050 2000
F 0 "D5" V 10004 2079 50  0000 L CNN
F 1 "D_Zener" V 10095 2079 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" H 10050 2000 50  0001 C CNN
F 3 "~" H 10050 2000 50  0001 C CNN
	1    10050 2000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E471989
P 10050 2150
F 0 "#PWR0104" H 10050 1900 50  0001 C CNN
F 1 "GND" H 10055 1977 50  0000 C CNN
F 2 "" H 10050 2150 50  0001 C CNN
F 3 "" H 10050 2150 50  0001 C CNN
	1    10050 2150
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Vsolar #PWR0105
U 1 1 5E4721E7
P 10050 1000
F 0 "#PWR0105" H 10050 850 50  0001 C CNN
F 1 "Vsolar" H 10065 1173 50  0000 C CNN
F 2 "" H 10050 1000 50  0001 C CNN
F 3 "" H 10050 1000 50  0001 C CNN
	1    10050 1000
	1    0    0    -1  
$EndComp
Text GLabel 10300 1850 2    50   Input ~ 0
V_REF
Wire Wire Line
	10300 1850 10050 1850
Wire Wire Line
	10050 1700 10050 1850
Connection ~ 10050 1850
$Comp
L panneaux_solaires:1M R5
U 1 1 5E47C63D
P 10050 1550
F 0 "R5" H 10118 1596 50  0000 L CNN
F 1 "1M" H 10118 1505 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 10090 1540 50  0001 C CNN
F 3 "~" H 10050 1550 50  0001 C CNN
	1    10050 1550
	1    0    0    -1  
$EndComp
Text GLabel 3400 3750 2    50   Input ~ 0
VOLTMETER1
$Comp
L panneaux_solaires:Jumper_2_Bridged JP3
U 1 1 5E5BD01F
P 3850 5600
F 0 "JP3" V 3804 5658 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 3895 5658 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 3850 5600 50  0001 C CNN
F 3 "~" H 3850 5600 50  0001 C CNN
	1    3850 5600
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Jumper_2_Bridged JP2
U 1 1 5E5C0EBE
P 2950 5300
F 0 "JP2" V 2904 5358 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 2995 5358 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 2950 5300 50  0001 C CNN
F 3 "~" H 2950 5300 50  0001 C CNN
	1    2950 5300
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Jumper_2_Bridged JP7
U 1 1 5E5D5394
P 10050 1200
F 0 "JP7" V 10004 1258 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 10095 1258 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 10050 1200 50  0001 C CNN
F 3 "~" H 10050 1200 50  0001 C CNN
	1    10050 1200
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Conn_01x09 J1
U 1 1 5E49450D
P 9600 3600
F 0 "J1" H 9680 3642 50  0000 L CNN
F 1 "Conn_01x09" H 9680 3551 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x09_P2.54mm_Vertical" H 9600 3600 50  0001 C CNN
F 3 "~" H 9600 3600 50  0001 C CNN
	1    9600 3600
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Vsolar #PWR0109
U 1 1 5E49C050
P 9400 3200
F 0 "#PWR0109" H 9400 3050 50  0001 C CNN
F 1 "Vsolar" H 9417 3373 50  0000 C CNN
F 2 "" H 9400 3200 50  0001 C CNN
F 3 "" H 9400 3200 50  0001 C CNN
	1    9400 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5E49CDCA
P 9000 3100
F 0 "#PWR0110" H 9000 2850 50  0001 C CNN
F 1 "GND" H 9005 2927 50  0000 C CNN
F 2 "" H 9000 3100 50  0001 C CNN
F 3 "" H 9000 3100 50  0001 C CNN
	1    9000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3100 9250 3100
Text GLabel 8950 3400 0    50   Input ~ 0
V_REF
Text GLabel 8650 3500 0    50   Input ~ 0
VOLTMETER1
Text GLabel 8950 3800 0    50   Input ~ 0
VOLTMETER2
Text GLabel 8950 3600 0    50   Input ~ 0
AMPERMETER1
Text GLabel 8700 3900 0    50   Input ~ 0
AMPERMETER2
Text GLabel 8700 3700 0    50   Input ~ 0
BNK1_CONTROL
Text GLabel 8950 4000 0    50   Input ~ 0
BNK2_CONTROL
Wire Wire Line
	9400 3300 9250 3300
Wire Wire Line
	9250 3300 9250 3100
Wire Wire Line
	8950 3400 9400 3400
Wire Wire Line
	9400 3500 8650 3500
Wire Wire Line
	9400 3600 8950 3600
Wire Wire Line
	9400 3700 8700 3700
Wire Wire Line
	9400 3800 8950 3800
Wire Wire Line
	9400 3900 8700 3900
Wire Wire Line
	9400 4000 8950 4000
$Comp
L panneaux_solaires:20R R2
U 1 1 5E46243C
P 2950 6700
F 0 "R2" H 3018 6746 50  0000 L CNN
F 1 "20R" H 3018 6655 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 2990 6690 50  0001 C CNN
F 3 "~" H 2950 6700 50  0001 C CNN
	1    2950 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 5900 2950 6050
$Comp
L panneaux_solaires:20R R1
U 1 1 5E4AEF3E
P 1400 6000
F 0 "R1" H 1468 6046 50  0000 L CNN
F 1 "20R" H 1468 5955 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 1440 5990 50  0001 C CNN
F 3 "~" H 1400 6000 50  0001 C CNN
	1    1400 6000
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:1M R3
U 1 1 5E4AF9CD
P 1900 5300
F 0 "R3" H 1968 5346 50  0000 L CNN
F 1 "1M" H 1968 5255 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 1940 5290 50  0001 C CNN
F 3 "~" H 1900 5300 50  0001 C CNN
	1    1900 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 5700 2650 5600
Wire Wire Line
	2650 5600 1900 5600
Wire Wire Line
	1900 5450 1900 5600
Wire Wire Line
	1600 5800 1400 5800
Wire Wire Line
	1400 5800 1400 5850
$Comp
L power:GND #PWR0103
U 1 1 5E4B3E73
P 1400 6150
F 0 "#PWR0103" H 1400 5900 50  0001 C CNN
F 1 "GND" H 1405 5977 50  0000 C CNN
F 2 "" H 1400 6150 50  0001 C CNN
F 3 "" H 1400 6150 50  0001 C CNN
	1    1400 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5E4B4616
P 1900 6000
F 0 "#PWR0106" H 1900 5750 50  0001 C CNN
F 1 "GND" H 1905 5827 50  0000 C CNN
F 2 "" H 1900 6000 50  0001 C CNN
F 3 "" H 1900 6000 50  0001 C CNN
	1    1900 6000
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Vsolar #PWR0107
U 1 1 5E4B4EED
P 1900 4950
F 0 "#PWR0107" H 1900 4800 50  0001 C CNN
F 1 "Vsolar" H 1915 5123 50  0000 C CNN
F 2 "" H 1900 4950 50  0001 C CNN
F 3 "" H 1900 4950 50  0001 C CNN
	1    1900 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4950 1900 5150
Wire Wire Line
	1400 5800 1300 5800
Connection ~ 1400 5800
Wire Wire Line
	3850 5800 3850 6050
Wire Wire Line
	3850 6050 2950 6050
Connection ~ 2950 6050
Wire Wire Line
	2950 5100 2950 5000
Wire Wire Line
	3850 5400 3850 5000
Wire Wire Line
	3850 5000 3300 5000
Connection ~ 2950 5000
Wire Wire Line
	2950 5000 2950 4950
Wire Wire Line
	3400 3750 2950 3750
Connection ~ 2950 3750
$Comp
L power:GND #PWR0108
U 1 1 5E5482E3
P 6550 6250
F 0 "#PWR0108" H 6550 6000 50  0001 C CNN
F 1 "GND" H 6555 6077 50  0000 C CNN
F 2 "" H 6550 6250 50  0001 C CNN
F 3 "" H 6550 6250 50  0001 C CNN
	1    6550 6250
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC5
U 1 1 5E5482E9
P 6550 3350
F 0 "SC5" H 6658 3400 50  0000 L CNN
F 1 "Solar_Cell" H 6650 3350 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 6550 3410 50  0001 C CNN
F 3 "~" V 6550 3410 50  0001 C CNN
	1    6550 3350
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC6
U 1 1 5E5482EF
P 6550 3650
F 0 "SC6" H 6658 3700 50  0000 L CNN
F 1 "Solar_Cell" H 6650 3650 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 6550 3710 50  0001 C CNN
F 3 "~" V 6550 3710 50  0001 C CNN
	1    6550 3650
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC7
U 1 1 5E5482F5
P 6550 3950
F 0 "SC7" H 6658 4000 50  0000 L CNN
F 1 "Solar_Cell" H 6650 3950 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 6550 4010 50  0001 C CNN
F 3 "~" V 6550 4010 50  0001 C CNN
	1    6550 3950
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC8
U 1 1 5E5482FB
P 6550 4250
F 0 "SC8" H 6658 4300 50  0000 L CNN
F 1 "Solar_Cell" H 6650 4250 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 6550 4310 50  0001 C CNN
F 3 "~" V 6550 4310 50  0001 C CNN
	1    6550 4250
	1    0    0    -1  
$EndComp
$Comp
L 1_solar_bank-rescue:D_Schottky-panneaux_solaires D1
U 1 1 5E548301
P 6550 3000
F 0 "D1" V 6504 3079 50  0000 L CNN
F 1 "D_Schottky" V 6595 3079 50  0000 L CNN
F 2 "panneaux_solaires:SOD3715X135N" H 6550 3000 50  0001 C CNN
F 3 "~" H 6550 3000 50  0001 C CNN
	1    6550 3000
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Vsolar #PWR0111
U 1 1 5E548307
P 6550 2650
F 0 "#PWR0111" H 6550 2500 50  0001 C CNN
F 1 "Vsolar" H 6567 2823 50  0000 C CNN
F 2 "" H 6550 2650 50  0001 C CNN
F 3 "" H 6550 2650 50  0001 C CNN
	1    6550 2650
	1    0    0    -1  
$EndComp
Text GLabel 4900 5200 0    50   Input ~ 0
BNK2_CONTROL
Text GLabel 5800 5850 0    50   Input ~ 0
AMPERMETER2
Wire Wire Line
	5800 5850 6550 5850
Wire Wire Line
	6550 5950 6550 5850
Connection ~ 6550 5850
$Comp
L Device:Fuse_Small F2
U 1 1 5E548312
P 6550 2750
F 0 "F2" V 6504 2798 50  0000 L CNN
F 1 "Fuse_Small" V 6595 2798 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" H 6550 2750 50  0001 C CNN
F 3 "~" H 6550 2750 50  0001 C CNN
	1    6550 2750
	0    1    1    0   
$EndComp
Text GLabel 7000 3150 2    50   Input ~ 0
VOLTMETER2
$Comp
L panneaux_solaires:Jumper_2_Bridged JP4
U 1 1 5E548319
P 7450 5000
F 0 "JP4" V 7404 5058 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 7495 5058 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 7450 5000 50  0001 C CNN
F 3 "~" H 7450 5000 50  0001 C CNN
	1    7450 5000
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Jumper_2_Bridged JP1
U 1 1 5E54831F
P 6550 4700
F 0 "JP1" V 6504 4758 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 6595 4758 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 6550 4700 50  0001 C CNN
F 3 "~" H 6550 4700 50  0001 C CNN
	1    6550 4700
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:20R R7
U 1 1 5E548331
P 6550 6100
F 0 "R7" H 6618 6146 50  0000 L CNN
F 1 "20R" H 6618 6055 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 6590 6090 50  0001 C CNN
F 3 "~" H 6550 6100 50  0001 C CNN
	1    6550 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 5300 6550 5450
$Comp
L panneaux_solaires:20R R4
U 1 1 5E548338
P 5000 5400
F 0 "R4" H 5068 5446 50  0000 L CNN
F 1 "20R" H 5068 5355 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 5040 5390 50  0001 C CNN
F 3 "~" H 5000 5400 50  0001 C CNN
	1    5000 5400
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:1M R6
U 1 1 5E54833E
P 5500 4700
F 0 "R6" H 5568 4746 50  0000 L CNN
F 1 "1M" H 5568 4655 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 5540 4690 50  0001 C CNN
F 3 "~" H 5500 4700 50  0001 C CNN
	1    5500 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 5100 6250 5000
Wire Wire Line
	6250 5000 5500 5000
Wire Wire Line
	5500 4850 5500 5000
Wire Wire Line
	5200 5200 5000 5200
Wire Wire Line
	5000 5200 5000 5250
$Comp
L power:GND #PWR0112
U 1 1 5E54834A
P 5000 5550
F 0 "#PWR0112" H 5000 5300 50  0001 C CNN
F 1 "GND" H 5005 5377 50  0000 C CNN
F 2 "" H 5000 5550 50  0001 C CNN
F 3 "" H 5000 5550 50  0001 C CNN
	1    5000 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5E548350
P 5500 5400
F 0 "#PWR0113" H 5500 5150 50  0001 C CNN
F 1 "GND" H 5505 5227 50  0000 C CNN
F 2 "" H 5500 5400 50  0001 C CNN
F 3 "" H 5500 5400 50  0001 C CNN
	1    5500 5400
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Vsolar #PWR0114
U 1 1 5E548356
P 5500 4350
F 0 "#PWR0114" H 5500 4200 50  0001 C CNN
F 1 "Vsolar" H 5515 4523 50  0000 C CNN
F 2 "" H 5500 4350 50  0001 C CNN
F 3 "" H 5500 4350 50  0001 C CNN
	1    5500 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4350 5500 4550
Wire Wire Line
	5000 5200 4900 5200
Connection ~ 5000 5200
Wire Wire Line
	7450 5200 7450 5450
Wire Wire Line
	7450 5450 6550 5450
Connection ~ 6550 5450
Wire Wire Line
	6550 5450 6550 5850
Wire Wire Line
	6550 4500 6550 4400
Wire Wire Line
	7450 4800 7450 4400
Wire Wire Line
	7450 4400 6950 4400
Connection ~ 6550 4400
Wire Wire Line
	6550 4400 6550 4350
Wire Wire Line
	7000 3150 6550 3150
Connection ~ 6550 3150
$Comp
L panneaux_solaires:RUR040N02HZGTL Q1
U 1 1 5E570176
P 1800 5800
F 0 "Q1" H 2006 5846 50  0000 L CNN
F 1 "RUR040N02HZGTL" H 2006 5755 50  0000 L CNN
F 2 "panneaux_solaires:RUR040N02HZGTL" H 2000 5900 50  0001 C CNN
F 3 "~" H 1800 5800 50  0001 C CNN
	1    1800 5800
	1    0    0    -1  
$EndComp
Connection ~ 1900 5600
Wire Wire Line
	2950 6050 2950 6450
$Comp
L panneaux_solaires:RUR040N02HZGTL Q2
U 1 1 5E579900
P 2850 5700
F 0 "Q2" H 3056 5746 50  0000 L CNN
F 1 "RUR040N02HZGTL" H 3056 5655 50  0000 L CNN
F 2 "panneaux_solaires:RUR040N02HZGTL" H 3050 5800 50  0001 C CNN
F 3 "~" H 2850 5700 50  0001 C CNN
	1    2850 5700
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:RUR040N02HZGTL Q3
U 1 1 5E57AC97
P 5400 5200
F 0 "Q3" H 5606 5246 50  0000 L CNN
F 1 "RUR040N02HZGTL" H 5606 5155 50  0000 L CNN
F 2 "panneaux_solaires:RUR040N02HZGTL" H 5600 5300 50  0001 C CNN
F 3 "~" H 5400 5200 50  0001 C CNN
	1    5400 5200
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:RUR040N02HZGTL Q4
U 1 1 5E57BE87
P 6450 5100
F 0 "Q4" H 6656 5146 50  0000 L CNN
F 1 "RUR040N02HZGTL" H 6656 5055 50  0000 L CNN
F 2 "panneaux_solaires:RUR040N02HZGTL" H 6650 5200 50  0001 C CNN
F 3 "~" H 6450 5100 50  0001 C CNN
	1    6450 5100
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:TestPoint TP1
U 1 1 5E6698E7
P 2300 3650
F 0 "TP1" H 2358 3768 50  0000 L CNN
F 1 "TestPoint" H 2358 3677 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 2500 3650 50  0001 C CNN
F 3 "~" H 2500 3650 50  0001 C CNN
	1    2300 3650
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:TestPoint TP2
U 1 1 5E66BA18
P 2300 4000
F 0 "TP2" H 2358 4118 50  0000 L CNN
F 1 "TestPoint" H 2358 4027 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 2500 4000 50  0001 C CNN
F 3 "~" H 2500 4000 50  0001 C CNN
	1    2300 4000
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:TestPoint TP3
U 1 1 5E66C790
P 2300 4300
F 0 "TP3" H 2358 4418 50  0000 L CNN
F 1 "TestPoint" H 2358 4327 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 2500 4300 50  0001 C CNN
F 3 "~" H 2500 4300 50  0001 C CNN
	1    2300 4300
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:TestPoint TP4
U 1 1 5E66DA3B
P 2300 4600
F 0 "TP4" H 2358 4718 50  0000 L CNN
F 1 "TestPoint" H 2358 4627 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 2500 4600 50  0001 C CNN
F 3 "~" H 2500 4600 50  0001 C CNN
	1    2300 4600
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:TestPoint TP5
U 1 1 5E66E878
P 3300 4750
F 0 "TP5" H 3358 4868 50  0000 L CNN
F 1 "TestPoint" H 3358 4777 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 3500 4750 50  0001 C CNN
F 3 "~" H 3500 4750 50  0001 C CNN
	1    3300 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3750 2300 3750
Wire Wire Line
	2300 3750 2300 3650
Wire Wire Line
	2950 4050 2300 4050
Wire Wire Line
	2300 4050 2300 4000
Connection ~ 2950 4050
Wire Wire Line
	2950 4350 2300 4350
Wire Wire Line
	2300 4350 2300 4300
Connection ~ 2950 4350
Wire Wire Line
	2950 4650 2300 4650
Wire Wire Line
	2300 4650 2300 4600
Connection ~ 2950 4650
Wire Wire Line
	3300 5000 3300 4750
Connection ~ 3300 5000
Wire Wire Line
	3300 5000 2950 5000
$Comp
L panneaux_solaires:TestPoint TP6
U 1 1 5E6943C0
P 5900 3050
F 0 "TP6" H 5958 3168 50  0000 L CNN
F 1 "TestPoint" H 5958 3077 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 6100 3050 50  0001 C CNN
F 3 "~" H 6100 3050 50  0001 C CNN
	1    5900 3050
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:TestPoint TP7
U 1 1 5E6943C6
P 5900 3400
F 0 "TP7" H 5958 3518 50  0000 L CNN
F 1 "TestPoint" H 5958 3427 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 6100 3400 50  0001 C CNN
F 3 "~" H 6100 3400 50  0001 C CNN
	1    5900 3400
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:TestPoint TP8
U 1 1 5E6943CC
P 5900 3700
F 0 "TP8" H 5958 3818 50  0000 L CNN
F 1 "TestPoint" H 5958 3727 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 6100 3700 50  0001 C CNN
F 3 "~" H 6100 3700 50  0001 C CNN
	1    5900 3700
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:TestPoint TP9
U 1 1 5E6943D2
P 5900 4000
F 0 "TP9" H 5958 4118 50  0000 L CNN
F 1 "TestPoint" H 5958 4027 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 6100 4000 50  0001 C CNN
F 3 "~" H 6100 4000 50  0001 C CNN
	1    5900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3150 5900 3150
Wire Wire Line
	5900 3150 5900 3050
Wire Wire Line
	6550 3450 5900 3450
Wire Wire Line
	5900 3450 5900 3400
Wire Wire Line
	6550 3750 5900 3750
Wire Wire Line
	5900 3750 5900 3700
Wire Wire Line
	6550 4050 5900 4050
Wire Wire Line
	5900 4050 5900 4000
$Comp
L panneaux_solaires:TestPoint TP10
U 1 1 5E697CF5
P 6950 4150
F 0 "TP10" H 7008 4268 50  0000 L CNN
F 1 "TestPoint" H 7008 4177 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 7150 4150 50  0001 C CNN
F 3 "~" H 7150 4150 50  0001 C CNN
	1    6950 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 4150 6950 4400
Connection ~ 6950 4400
Wire Wire Line
	6950 4400 6550 4400
$Comp
L panneaux_solaires:TestPoint TP11
U 1 1 5E6CE24C
P 2300 4050
F 0 "TP11" H 2358 4168 50  0000 L CNN
F 1 "TestPoint" H 2358 4077 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 2500 4050 50  0001 C CNN
F 3 "~" H 2500 4050 50  0001 C CNN
	1    2300 4050
	0    -1   -1   0   
$EndComp
$Comp
L panneaux_solaires:TestPoint TP12
U 1 1 5E6D0041
P 2300 4350
F 0 "TP12" H 2358 4468 50  0000 L CNN
F 1 "TestPoint" H 2358 4377 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 2500 4350 50  0001 C CNN
F 3 "~" H 2500 4350 50  0001 C CNN
	1    2300 4350
	0    -1   -1   0   
$EndComp
$Comp
L panneaux_solaires:TestPoint TP13
U 1 1 5E6D1A23
P 2300 4650
F 0 "TP13" H 2358 4768 50  0000 L CNN
F 1 "TestPoint" H 2358 4677 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 2500 4650 50  0001 C CNN
F 3 "~" H 2500 4650 50  0001 C CNN
	1    2300 4650
	0    -1   -1   0   
$EndComp
$Comp
L panneaux_solaires:TestPoint TP14
U 1 1 5E6D6A06
P 5900 3450
F 0 "TP14" H 5958 3568 50  0000 L CNN
F 1 "TestPoint" H 5958 3477 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 6100 3450 50  0001 C CNN
F 3 "~" H 6100 3450 50  0001 C CNN
	1    5900 3450
	0    -1   -1   0   
$EndComp
$Comp
L panneaux_solaires:TestPoint TP15
U 1 1 5E6D6A0C
P 5900 3750
F 0 "TP15" H 5958 3868 50  0000 L CNN
F 1 "TestPoint" H 5958 3777 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 6100 3750 50  0001 C CNN
F 3 "~" H 6100 3750 50  0001 C CNN
	1    5900 3750
	0    -1   -1   0   
$EndComp
$Comp
L panneaux_solaires:TestPoint TP16
U 1 1 5E6D6A12
P 5900 4050
F 0 "TP16" H 5958 4168 50  0000 L CNN
F 1 "TestPoint" H 5958 4077 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Pad_3.0x3.0mm" H 6100 4050 50  0001 C CNN
F 3 "~" H 6100 4050 50  0001 C CNN
	1    5900 4050
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
