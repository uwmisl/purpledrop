EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "PurpleDrop Main Board"
Date "2020-11-03"
Rev "6.1"
Comp "UW MISL"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5000 1200 1150 1800
U 5D31F1CA
F0 "HV interface" 50
F1 "HV_interface.sch" 50
$EndSheet
$Sheet
S 2900 3600 1150 1550
U 5D7A24CC
F0 "peripherals" 50
F1 "peripherals.sch" 50
$EndSheet
$Sheet
S 5100 3700 1000 1450
U 5D30D175
F0 "power" 50
F1 "power.sch" 50
$EndSheet
Wire Notes Line
	11150 4300 8000 4300
Wire Notes Line
	8000 4300 8000 6450
Text Notes 8200 4400 0    50   ~ 0
mechanical / graphical
$Comp
L Mechanical:MountingHole H1
U 1 1 5D64531B
P 8300 4650
F 0 "H1" H 8400 4696 50  0000 L CNN
F 1 "MountingHole" H 8400 4605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580" H 8300 4650 50  0001 C CNN
F 3 "~" H 8300 4650 50  0001 C CNN
	1    8300 4650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5D6461FF
P 8300 4850
F 0 "H2" H 8400 4896 50  0000 L CNN
F 1 "MountingHole" H 8400 4805 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580" H 8300 4850 50  0001 C CNN
F 3 "~" H 8300 4850 50  0001 C CNN
	1    8300 4850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5D64630A
P 8300 5050
F 0 "H3" H 8400 5096 50  0000 L CNN
F 1 "MountingHole" H 8400 5005 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580" H 8300 5050 50  0001 C CNN
F 3 "~" H 8300 5050 50  0001 C CNN
	1    8300 5050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5D646444
P 8300 5250
F 0 "H4" H 8400 5296 50  0000 L CNN
F 1 "MountingHole" H 8400 5205 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580" H 8300 5250 50  0001 C CNN
F 3 "~" H 8300 5250 50  0001 C CNN
	1    8300 5250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5D6465D1
P 8300 5450
F 0 "H5" H 8400 5496 50  0000 L CNN
F 1 "MountingHole" H 8400 5405 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580" H 8300 5450 50  0001 C CNN
F 3 "~" H 8300 5450 50  0001 C CNN
	1    8300 5450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5D646751
P 8300 5650
F 0 "H6" H 8400 5696 50  0000 L CNN
F 1 "MountingHole" H 8400 5605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580" H 8300 5650 50  0001 C CNN
F 3 "~" H 8300 5650 50  0001 C CNN
	1    8300 5650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H7
U 1 1 5D6468BD
P 8300 5850
F 0 "H7" H 8400 5896 50  0000 L CNN
F 1 "MountingHole" H 8400 5805 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580" H 8300 5850 50  0001 C CNN
F 3 "~" H 8300 5850 50  0001 C CNN
	1    8300 5850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H8
U 1 1 5D646A29
P 8300 6050
F 0 "H8" H 8400 6096 50  0000 L CNN
F 1 "MountingHole" H 8400 6005 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580" H 8300 6050 50  0001 C CNN
F 3 "~" H 8300 6050 50  0001 C CNN
	1    8300 6050
	1    0    0    -1  
$EndComp
$Comp
L PurpleDrop:graphic G1
U 1 1 5D648BAF
P 9750 4800
F 0 "G1" H 9898 4906 50  0000 L CNN
F 1 "W logo" H 9898 4815 50  0000 L CNN
F 2 "logos:wlogo" H 9750 4800 50  0001 C CNN
F 3 "" H 9750 4800 50  0001 C CNN
	1    9750 4800
	1    0    0    -1  
$EndComp
$Comp
L PurpleDrop:graphic G2
U 1 1 5D649A6E
P 9750 5150
F 0 "G2" H 9898 5256 50  0000 L CNN
F 1 "MISL logo" H 9898 5165 50  0000 L CNN
F 2 "logos:misl-logo" H 9750 5150 50  0001 C CNN
F 3 "" H 9750 5150 50  0001 C CNN
	1    9750 5150
	1    0    0    -1  
$EndComp
$Comp
L PurpleDrop:graphic G3
U 1 1 5D64A074
P 9750 5500
F 0 "G3" H 9898 5606 50  0000 L CNN
F 1 "PurpleDrop logo" H 9898 5515 50  0000 L CNN
F 2 "logos:purpledrop" H 9750 5500 50  0001 C CNN
F 3 "" H 9750 5500 50  0001 C CNN
	1    9750 5500
	1    0    0    -1  
$EndComp
$Sheet
S 3000 1300 1050 1350
U 5E77DDA4
F0 "MCU" 50
F1 "MCU.sch" 50
$EndSheet
$EndSCHEMATC
