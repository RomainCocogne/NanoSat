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
P 2950 6950
F 0 "#PWR0102" H 2950 6700 50  0001 C CNN
F 1 "GND" H 2955 6777 50  0000 C CNN
F 2 "" H 2950 6950 50  0001 C CNN
F 3 "" H 2950 6950 50  0001 C CNN
	1    2950 6950
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC1
U 1 1 5E3DE122
P 2950 5100
F 0 "SC1" H 3058 5150 50  0000 L CNN
F 1 "Solar_Cell" H 3050 5100 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 2950 5160 50  0001 C CNN
F 3 "~" V 2950 5160 50  0001 C CNN
	1    2950 5100
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC2
U 1 1 5E3DECE3
P 2950 5400
F 0 "SC2" H 3058 5450 50  0000 L CNN
F 1 "Solar_Cell" H 3050 5400 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 2950 5460 50  0001 C CNN
F 3 "~" V 2950 5460 50  0001 C CNN
	1    2950 5400
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC3
U 1 1 5E3DF0C8
P 2950 5700
F 0 "SC3" H 3058 5750 50  0000 L CNN
F 1 "Solar_Cell" H 3050 5700 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 2950 5760 50  0001 C CNN
F 3 "~" V 2950 5760 50  0001 C CNN
	1    2950 5700
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC4
U 1 1 5E3DF3C4
P 2950 6000
F 0 "SC4" H 3058 6050 50  0000 L CNN
F 1 "Solar_Cell" H 3050 6000 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 2950 6060 50  0001 C CNN
F 3 "~" V 2950 6060 50  0001 C CNN
	1    2950 6000
	1    0    0    -1  
$EndComp
$Comp
L 1_solar_bank-rescue:D_Schottky-panneaux_solaires D2
U 1 1 5E3ECE28
P 2950 4750
F 0 "D2" V 2904 4829 50  0000 L CNN
F 1 "D_Schottky" V 2995 4829 50  0000 L CNN
F 2 "panneaux_solaires:SOD3715X135N" H 2950 4750 50  0001 C CNN
F 3 "~" H 2950 4750 50  0001 C CNN
	1    2950 4750
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Vsolar #PWR0101
U 1 1 5E3D675E
P 2950 2500
F 0 "#PWR0101" H 2950 2350 50  0001 C CNN
F 1 "Vsolar" H 2967 2673 50  0000 C CNN
F 2 "" H 2950 2500 50  0001 C CNN
F 3 "" H 2950 2500 50  0001 C CNN
	1    2950 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4500 2950 4550
Wire Wire Line
	2350 4300 2650 4300
Wire Wire Line
	2350 4200 2350 4300
$Comp
L power:GND #PWR0103
U 1 1 5E3FD898
P 2350 4750
F 0 "#PWR0103" H 2350 4500 50  0001 C CNN
F 1 "GND" H 2355 4577 50  0000 C CNN
F 2 "" H 2350 4750 50  0001 C CNN
F 3 "" H 2350 4750 50  0001 C CNN
	1    2350 4750
	1    0    0    -1  
$EndComp
Text GLabel 1550 4000 0    50   Input ~ 0
BNK1_CONTROL
Wire Wire Line
	2050 4000 1550 4000
Text Notes 550  850  0    50   ~ 0
logic 0 or 1 -> 0V or 3.3V \n0V -> NMOS1 off -> PMOS2 grid short circuited -> PMOS2 on\n3.3V -> NMOS1 on -> PMOS2 grid to Vsolar -> PMOS2 off\n
Wire Wire Line
	2350 4450 2350 4300
Connection ~ 2350 4300
Wire Wire Line
	2350 3800 2350 3650
Wire Wire Line
	2350 3650 2950 3650
Wire Wire Line
	2950 3650 2950 4100
Text GLabel 2200 6550 0    50   Input ~ 0
AMPERMETER1
Wire Wire Line
	2200 6550 2950 6550
Wire Wire Line
	2950 6550 2950 6500
Wire Wire Line
	2950 6650 2950 6550
Connection ~ 2950 6550
$Comp
L Device:Fuse_Small F1
U 1 1 5E446EA0
P 2950 2600
F 0 "F1" V 2904 2648 50  0000 L CNN
F 1 "Fuse_Small" V 2995 2648 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" H 2950 2600 50  0001 C CNN
F 3 "~" H 2950 2600 50  0001 C CNN
	1    2950 2600
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:VN10KM M1
U 1 1 5E456E4E
P 2250 4000
F 0 "M1" H 2538 4046 50  0000 L CNN
F 1 "VN10KM" H 2538 3955 50  0000 L CNN
F 2 "panneaux_solaires:TO237" H 2225 4000 50  0001 C CNN
F 3 "~" H 2225 4000 50  0001 C CNN
	1    2250 4000
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:BS250 M2
U 1 1 5E45895F
P 2850 4300
F 0 "M2" H 3138 4254 50  0000 L CNN
F 1 "BS250" H 3138 4345 50  0000 L CNN
F 2 "panneaux_solaires:SOT54E" H 2850 4300 50  0001 C CNN
F 3 "~" H 2850 4300 50  0001 C CNN
	1    2850 4300
	1    0    0    1   
$EndComp
$Comp
L panneaux_solaires:1M R1
U 1 1 5E461260
P 2350 4600
F 0 "R1" H 2418 4646 50  0000 L CNN
F 1 "1M" H 2418 4555 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 2390 4590 50  0001 C CNN
F 3 "~" H 2350 4600 50  0001 C CNN
	1    2350 4600
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:20R R2
U 1 1 5E46243C
P 2950 6800
F 0 "R2" H 3018 6846 50  0000 L CNN
F 1 "20R" H 3018 6755 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 2990 6790 50  0001 C CNN
F 3 "~" H 2950 6800 50  0001 C CNN
	1    2950 6800
	1    0    0    -1  
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
Wire Wire Line
	2950 3650 2950 3500
Connection ~ 2950 3650
Wire Wire Line
	2950 3000 2950 3050
Wire Wire Line
	3750 3150 3750 3050
Wire Wire Line
	3750 3050 2950 3050
Connection ~ 2950 3050
Wire Wire Line
	2950 3050 2950 3100
Wire Wire Line
	3750 3550 3750 4550
Wire Wire Line
	3750 4550 2950 4550
Connection ~ 2950 4550
Wire Wire Line
	2950 4550 2950 4600
Wire Wire Line
	6100 4550 6100 4600
Connection ~ 6100 4550
Wire Wire Line
	6900 4550 6100 4550
Wire Wire Line
	6900 3550 6900 4550
Wire Wire Line
	6100 3050 6100 3100
Connection ~ 6100 3050
Wire Wire Line
	6900 3050 6100 3050
Wire Wire Line
	6900 3150 6900 3050
Wire Wire Line
	6100 3000 6100 3050
Connection ~ 6100 3650
Wire Wire Line
	6100 3650 6100 3500
$Comp
L panneaux_solaires:20R R4
U 1 1 5E53FBEE
P 6100 6800
F 0 "R4" H 6168 6846 50  0000 L CNN
F 1 "20R" H 6168 6755 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 6140 6790 50  0001 C CNN
F 3 "~" H 6100 6800 50  0001 C CNN
	1    6100 6800
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:1M R3
U 1 1 5E53FBE8
P 5500 4600
F 0 "R3" H 5568 4646 50  0000 L CNN
F 1 "1M" H 5568 4555 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 5540 4590 50  0001 C CNN
F 3 "~" H 5500 4600 50  0001 C CNN
	1    5500 4600
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:BS250 M4
U 1 1 5E53FBE1
P 6000 4300
F 0 "M4" H 6288 4254 50  0000 L CNN
F 1 "BS250" H 6288 4345 50  0000 L CNN
F 2 "panneaux_solaires:SOT54E" H 6000 4300 50  0001 C CNN
F 3 "~" H 6000 4300 50  0001 C CNN
	1    6000 4300
	1    0    0    1   
$EndComp
$Comp
L panneaux_solaires:VN10KM M3
U 1 1 5E53FBDA
P 5400 4000
F 0 "M3" H 5688 4046 50  0000 L CNN
F 1 "VN10KM" H 5688 3955 50  0000 L CNN
F 2 "panneaux_solaires:TO237" H 5375 4000 50  0001 C CNN
F 3 "~" H 5375 4000 50  0001 C CNN
	1    5400 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse_Small F2
U 1 1 5E53FBD4
P 6100 2600
F 0 "F2" V 6054 2648 50  0000 L CNN
F 1 "Fuse_Small" V 6145 2648 50  0000 L CNN
F 2 "panneaux_solaires:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" H 6100 2600 50  0001 C CNN
F 3 "~" H 6100 2600 50  0001 C CNN
	1    6100 2600
	0    1    1    0   
$EndComp
Connection ~ 6100 6550
Wire Wire Line
	6100 6650 6100 6550
Wire Wire Line
	6100 6550 6100 6500
Wire Wire Line
	5350 6550 6100 6550
Text GLabel 5350 6550 0    50   Input ~ 0
AMPERMETER2
Wire Wire Line
	6100 3650 6100 4100
Wire Wire Line
	5500 3650 6100 3650
Wire Wire Line
	5500 3800 5500 3650
Connection ~ 5500 4300
Wire Wire Line
	5500 4450 5500 4300
Wire Wire Line
	5200 4000 4700 4000
Text GLabel 4700 4000 0    50   Input ~ 0
BNK2_CONTROL
$Comp
L power:GND #PWR0106
U 1 1 5E53FBC1
P 5500 4750
F 0 "#PWR0106" H 5500 4500 50  0001 C CNN
F 1 "GND" H 5505 4577 50  0000 C CNN
F 2 "" H 5500 4750 50  0001 C CNN
F 3 "" H 5500 4750 50  0001 C CNN
	1    5500 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4200 5500 4300
Wire Wire Line
	5500 4300 5800 4300
Wire Wire Line
	6100 4500 6100 4550
$Comp
L panneaux_solaires:Vsolar #PWR0107
U 1 1 5E53FBB7
P 6100 2500
F 0 "#PWR0107" H 6100 2350 50  0001 C CNN
F 1 "Vsolar" H 6117 2673 50  0000 C CNN
F 2 "" H 6100 2500 50  0001 C CNN
F 3 "" H 6100 2500 50  0001 C CNN
	1    6100 2500
	1    0    0    -1  
$EndComp
$Comp
L 1_solar_bank-rescue:D_Schottky-panneaux_solaires D4
U 1 1 5E53FBB1
P 6100 4750
F 0 "D4" V 6054 4829 50  0000 L CNN
F 1 "D_Schottky" V 6145 4829 50  0000 L CNN
F 2 "panneaux_solaires:SOD3715X135N" H 6100 4750 50  0001 C CNN
F 3 "~" H 6100 4750 50  0001 C CNN
	1    6100 4750
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC8
U 1 1 5E53FBAB
P 6100 6000
F 0 "SC8" H 6208 6050 50  0000 L CNN
F 1 "Solar_Cell" H 6200 6000 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 6100 6060 50  0001 C CNN
F 3 "~" V 6100 6060 50  0001 C CNN
	1    6100 6000
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC7
U 1 1 5E53FBA5
P 6100 5700
F 0 "SC7" H 6208 5750 50  0000 L CNN
F 1 "Solar_Cell" H 6200 5700 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 6100 5760 50  0001 C CNN
F 3 "~" V 6100 5760 50  0001 C CNN
	1    6100 5700
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC6
U 1 1 5E53FB9F
P 6100 5400
F 0 "SC6" H 6208 5450 50  0000 L CNN
F 1 "Solar_Cell" H 6200 5400 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 6100 5460 50  0001 C CNN
F 3 "~" V 6100 5460 50  0001 C CNN
	1    6100 5400
	1    0    0    -1  
$EndComp
$Comp
L panneaux_solaires:Solar_Cell SC5
U 1 1 5E53FB99
P 6100 5100
F 0 "SC5" H 6208 5150 50  0000 L CNN
F 1 "Solar_Cell" H 6200 5100 50  0001 L CNN
F 2 "panneaux_solaires:TRISOLX-T01" V 6100 5160 50  0001 C CNN
F 3 "~" V 6100 5160 50  0001 C CNN
	1    6100 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5E53FB93
P 6100 6950
F 0 "#PWR0108" H 6100 6700 50  0001 C CNN
F 1 "GND" H 6105 6777 50  0000 C CNN
F 2 "" H 6100 6950 50  0001 C CNN
F 3 "" H 6100 6950 50  0001 C CNN
	1    6100 6950
	1    0    0    -1  
$EndComp
Text GLabel 7050 4550 2    50   Input ~ 0
VOLTMETER2
Wire Wire Line
	7050 4550 6900 4550
Connection ~ 6900 4550
Text GLabel 3900 4550 2    50   Input ~ 0
VOLTMETER1
Wire Wire Line
	3900 4550 3750 4550
$Comp
L panneaux_solaires:Jumper_2_Bridged JP1
U 1 1 5E5B869D
P 2950 3300
F 0 "JP1" V 2904 3358 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 2995 3358 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 2950 3300 50  0001 C CNN
F 3 "~" H 2950 3300 50  0001 C CNN
	1    2950 3300
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Jumper_2_Bridged JP3
U 1 1 5E5BD01F
P 3750 3350
F 0 "JP3" V 3704 3408 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 3795 3408 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 3750 3350 50  0001 C CNN
F 3 "~" H 3750 3350 50  0001 C CNN
	1    3750 3350
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Jumper_2_Bridged JP2
U 1 1 5E5C0EBE
P 2950 6300
F 0 "JP2" V 2904 6358 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 2995 6358 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 2950 6300 50  0001 C CNN
F 3 "~" H 2950 6300 50  0001 C CNN
	1    2950 6300
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Jumper_2_Bridged JP5
U 1 1 5E5C5613
P 6100 6300
F 0 "JP5" V 6054 6358 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 6145 6358 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 6100 6300 50  0001 C CNN
F 3 "~" H 6100 6300 50  0001 C CNN
	1    6100 6300
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Jumper_2_Bridged JP4
U 1 1 5E5CCB61
P 6100 3300
F 0 "JP4" V 6054 3358 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 6145 3358 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 6100 3300 50  0001 C CNN
F 3 "~" H 6100 3300 50  0001 C CNN
	1    6100 3300
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:Jumper_2_Bridged JP6
U 1 1 5E5CD86F
P 6900 3350
F 0 "JP6" V 6854 3408 50  0000 L CNN
F 1 "Jumper_2_Bridged" V 6945 3408 50  0000 L CNN
F 2 "panneaux_solaires:TestPoint_Bridge_Pitch2.54mm_Drill0.7mm" H 6900 3350 50  0001 C CNN
F 3 "~" H 6900 3350 50  0001 C CNN
	1    6900 3350
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
L panneaux_solaires:LED D1
U 1 1 5E5DF6B9
P 2950 2850
F 0 "D1" V 2897 2928 50  0000 L CNN
F 1 "LED" V 2988 2928 50  0000 L CNN
F 2 "panneaux_solaires:LED_D3.0mm" H 2950 2850 50  0001 C CNN
F 3 "~" H 2950 2850 50  0001 C CNN
	1    2950 2850
	0    1    1    0   
$EndComp
$Comp
L panneaux_solaires:LED D3
U 1 1 5E5E30FB
P 6100 2850
F 0 "D3" V 6047 2928 50  0000 L CNN
F 1 "LED" V 6138 2928 50  0000 L CNN
F 2 "panneaux_solaires:LED_D3.0mm" H 6100 2850 50  0001 C CNN
F 3 "~" H 6100 2850 50  0001 C CNN
	1    6100 2850
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
$EndSCHEMATC
