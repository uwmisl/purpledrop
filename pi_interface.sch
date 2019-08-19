EESchema Schematic File Version 4
LIBS:PurpleDrop-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L Logic_LevelTranslator:74LVC2T45DC U3
U 1 1 5D6DC100
P 5350 1300
F 0 "U3" H 5050 1750 50  0000 C CNN
F 1 "74LVC2T45DCT" H 5700 800 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_3x3mm_P0.65mm" H 5350 450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC_LVCH2T45.pdf" H 5600 1050 50  0001 C CNN
	1    5350 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J3
U 1 1 5D6E6E89
P 1700 1700
F 0 "J3" H 1750 2817 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 1750 2726 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 1700 1700 50  0001 C CNN
F 3 "~" H 1700 1700 50  0001 C CNN
F 4 "ESQ-120-34-T-D " H 1700 1700 50  0001 C CNN "PN"
	1    1700 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1300 1050 1300
Wire Wire Line
	1500 1400 1050 1400
Wire Wire Line
	1500 1500 1050 1500
Wire Wire Line
	2450 1500 2000 1500
Text Label 1100 1300 0    50   ~ 0
pi_blank
Text Label 1100 1400 0    50   ~ 0
pi_latch
Text Label 1100 1500 0    50   ~ 0
pi_clk
Text Label 2100 1500 0    50   ~ 0
pi_data
Wire Wire Line
	1500 1600 900  1600
$Comp
L power:+3V3 #PWR012
U 1 1 5D6EC6EA
P 900 1600
F 0 "#PWR012" H 900 1450 50  0001 C CNN
F 1 "+3V3" H 915 1773 50  0000 C CNN
F 2 "" H 900 1600 50  0001 C CNN
F 3 "" H 900 1600 50  0001 C CNN
	1    900  1600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR023
U 1 1 5D6ED250
P 5250 750
F 0 "#PWR023" H 5250 600 50  0001 C CNN
F 1 "+3V3" H 5265 923 50  0000 C CNN
F 2 "" H 5250 750 50  0001 C CNN
F 3 "" H 5250 750 50  0001 C CNN
	1    5250 750 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D778122
P 2400 750
AR Path="/5D31F1CA/5D778122" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D778122" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 2400 600 50  0001 C CNN
F 1 "+5V" H 2400 890 50  0000 C CNN
F 2 "" H 2400 750 60  0000 C CNN
F 3 "" H 2400 750 60  0000 C CNN
	1    2400 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 800  2400 800 
Wire Wire Line
	2400 800  2400 750 
Wire Wire Line
	2000 900  2400 900 
Wire Wire Line
	2400 900  2400 800 
Connection ~ 2400 800 
$Comp
L power:GND #PWR?
U 1 1 5D77C825
P 2400 1000
AR Path="/5D31F1CA/5D77C825" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D77C825" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 2400 750 50  0001 C CNN
F 1 "GND" H 2400 850 50  0000 C CNN
F 2 "" H 2400 1000 60  0000 C CNN
F 3 "" H 2400 1000 60  0000 C CNN
	1    2400 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1000 2250 1000
Wire Wire Line
	5250 750  5250 800 
$Comp
L power:+5V #PWR?
U 1 1 5D77DE53
P 5450 750
AR Path="/5D31F1CA/5D77DE53" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D77DE53" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 5450 600 50  0001 C CNN
F 1 "+5V" H 5450 890 50  0000 C CNN
F 2 "" H 5450 750 60  0000 C CNN
F 3 "" H 5450 750 60  0000 C CNN
	1    5450 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 750  5450 800 
$Comp
L power:+3V3 #PWR022
U 1 1 5D77EA85
P 4800 1550
F 0 "#PWR022" H 4800 1400 50  0001 C CNN
F 1 "+3V3" H 4650 1600 50  0000 C CNN
F 2 "" H 4800 1550 50  0001 C CNN
F 3 "" H 4800 1550 50  0001 C CNN
	1    4800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1550 4800 1600
Wire Wire Line
	4800 1600 4950 1600
Wire Wire Line
	2450 2300 2000 2300
Text Label 2150 2300 0    50   ~ 0
pi_pol
Wire Wire Line
	5750 1200 6200 1200
Wire Wire Line
	5750 1400 5950 1400
Text Label 4550 1200 0    50   ~ 0
pi_latch
Text Label 4550 1400 0    50   ~ 0
pi_clk
$Comp
L Logic_LevelTranslator:74LVC2T45DC U4
U 1 1 5D78A2E0
P 7600 1300
F 0 "U4" H 7300 1750 50  0000 C CNN
F 1 "74LVC2T45DCT" H 7950 800 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_3x3mm_P0.65mm" H 7600 450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC_LVCH2T45.pdf" H 7850 1050 50  0001 C CNN
	1    7600 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR031
U 1 1 5D78A2E6
P 7500 750
F 0 "#PWR031" H 7500 600 50  0001 C CNN
F 1 "+3V3" H 7515 923 50  0000 C CNN
F 2 "" H 7500 750 50  0001 C CNN
F 3 "" H 7500 750 50  0001 C CNN
	1    7500 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 750  7500 800 
$Comp
L power:+5V #PWR?
U 1 1 5D78A2ED
P 7700 750
AR Path="/5D31F1CA/5D78A2ED" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D78A2ED" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 7700 600 50  0001 C CNN
F 1 "+5V" H 7700 890 50  0000 C CNN
F 2 "" H 7700 750 60  0000 C CNN
F 3 "" H 7700 750 60  0000 C CNN
	1    7700 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 750  7700 800 
$Comp
L power:+3V3 #PWR030
U 1 1 5D78A2F4
P 7050 1550
F 0 "#PWR030" H 7050 1400 50  0001 C CNN
F 1 "+3V3" H 6900 1600 50  0000 C CNN
F 2 "" H 7050 1550 50  0001 C CNN
F 3 "" H 7050 1550 50  0001 C CNN
	1    7050 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1550 7050 1600
Wire Wire Line
	7050 1600 7200 1600
Wire Wire Line
	7200 1400 6750 1400
Wire Wire Line
	8000 1200 8450 1200
Wire Wire Line
	8000 1400 8450 1400
$Comp
L power:+3V3 #PWR038
U 1 1 5D78C2B5
P 9800 750
F 0 "#PWR038" H 9800 600 50  0001 C CNN
F 1 "+3V3" H 9815 923 50  0000 C CNN
F 2 "" H 9800 750 50  0001 C CNN
F 3 "" H 9800 750 50  0001 C CNN
	1    9800 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 750  9800 800 
$Comp
L power:+5V #PWR?
U 1 1 5D78C2BC
P 10000 750
AR Path="/5D31F1CA/5D78C2BC" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D78C2BC" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 10000 600 50  0001 C CNN
F 1 "+5V" H 10000 890 50  0000 C CNN
F 2 "" H 10000 750 60  0000 C CNN
F 3 "" H 10000 750 60  0000 C CNN
	1    10000 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 750  10000 800 
$Comp
L power:+3V3 #PWR035
U 1 1 5D78C2C3
P 9350 1550
F 0 "#PWR035" H 9350 1400 50  0001 C CNN
F 1 "+3V3" H 9250 1600 50  0000 C CNN
F 2 "" H 9350 1550 50  0001 C CNN
F 3 "" H 9350 1550 50  0001 C CNN
	1    9350 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1550 9350 1600
Wire Wire Line
	9350 1600 9500 1600
Wire Wire Line
	9500 1400 9050 1400
Wire Wire Line
	10300 1200 10500 1200
Text Label 6850 1200 0    50   ~ 0
pi_blank
Text Label 6850 1400 0    50   ~ 0
pi_pol
Text Label 9200 1200 0    50   ~ 0
pi_data
$Comp
L power:GND #PWR?
U 1 1 5D78E711
P 5350 1800
AR Path="/5D31F1CA/5D78E711" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D78E711" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 5350 1550 50  0001 C CNN
F 1 "GND" H 5350 1650 50  0000 C CNN
F 2 "" H 5350 1800 60  0000 C CNN
F 3 "" H 5350 1800 60  0000 C CNN
	1    5350 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D79071E
P 7600 1800
AR Path="/5D31F1CA/5D79071E" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D79071E" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 7600 1550 50  0001 C CNN
F 1 "GND" H 7600 1650 50  0000 C CNN
F 2 "" H 7600 1800 60  0000 C CNN
F 3 "" H 7600 1800 60  0000 C CNN
	1    7600 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D790B94
P 9900 1800
AR Path="/5D31F1CA/5D790B94" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D790B94" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 9900 1550 50  0001 C CNN
F 1 "GND" H 9900 1650 50  0000 C CNN
F 2 "" H 9900 1800 60  0000 C CNN
F 3 "" H 9900 1800 60  0000 C CNN
	1    9900 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D7914BF
P 9050 1400
AR Path="/5D31F1CA/5D7914BF" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D7914BF" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 9050 1150 50  0001 C CNN
F 1 "GND" H 9050 1250 50  0000 C CNN
F 2 "" H 9050 1400 60  0000 C CNN
F 3 "" H 9050 1400 60  0000 C CNN
	1    9050 1400
	1    0    0    -1  
$EndComp
NoConn ~ 10300 1400
Text GLabel 6200 1200 2    50   Input ~ 0
HV_LE
Text GLabel 6200 1400 2    50   Input ~ 0
HV_CLK
Text GLabel 8450 1200 2    50   Input ~ 0
HV_BL
Text GLabel 8450 1400 2    50   Input ~ 0
HV_POL
Text GLabel 10750 1200 2    50   Input ~ 0
HV_DIN
Wire Wire Line
	1500 1700 1050 1700
Wire Wire Line
	1500 1800 1050 1800
Wire Wire Line
	1500 1900 1050 1900
Wire Wire Line
	2450 1900 2000 1900
Wire Wire Line
	2450 2000 2000 2000
Wire Wire Line
	2000 2100 2450 2100
Text GLabel 2450 1900 2    50   Input ~ 0
pi_CE0_0
Text GLabel 2450 2000 2    50   Input ~ 0
pi_CE1_0
Text GLabel 2450 2100 2    50   Input ~ 0
pi_CE2_sw
Text GLabel 1050 1700 0    50   Input ~ 0
pi_MOSI_0
Text GLabel 1050 1800 0    50   Input ~ 0
pi_MISO_0
Text GLabel 1050 1900 0    50   Input ~ 0
pi_SCK_0
$Comp
L Device:R_Small_US R1
U 1 1 5D2EFC55
P 3300 1450
F 0 "R1" H 3368 1496 50  0000 L CNN
F 1 "4k32" H 3368 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3300 1450 50  0001 C CNN
F 3 "~" H 3300 1450 50  0001 C CNN
	1    3300 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R2
U 1 1 5D2F0A08
P 3300 1800
F 0 "R2" H 3368 1846 50  0000 L CNN
F 1 "8k2" H 3368 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3300 1800 50  0001 C CNN
F 3 "~" H 3300 1800 50  0001 C CNN
	1    3300 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D2F0C79
P 3300 2000
AR Path="/5D31F1CA/5D2F0C79" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D2F0C79" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 3300 1750 50  0001 C CNN
F 1 "GND" H 3300 1850 50  0000 C CNN
F 2 "" H 3300 2000 60  0000 C CNN
F 3 "" H 3300 2000 60  0000 C CNN
	1    3300 2000
	1    0    0    -1  
$EndComp
Text GLabel 3450 1200 2    50   Input ~ 0
HV_DOUT
Wire Wire Line
	2000 1600 3300 1600
Wire Wire Line
	3300 1600 3300 1550
Wire Wire Line
	3300 1600 3300 1700
Connection ~ 3300 1600
Wire Wire Line
	3300 1900 3300 2000
Wire Wire Line
	3300 1350 3300 1200
Wire Wire Line
	3300 1200 3450 1200
Text Label 2050 1600 0    50   ~ 0
HV_DOUT_3v3
Wire Wire Line
	2000 1400 2250 1400
Wire Wire Line
	2250 1400 2250 1000
Connection ~ 2250 1000
Wire Wire Line
	2250 1000 2400 1000
$Comp
L Device:C C?
U 1 1 5D4C02DE
P 6050 2300
AR Path="/5D7A24CC/5D4C02DE" Ref="C?"  Part="1" 
AR Path="/5D31F2B8/5D4C02DE" Ref="C9"  Part="1" 
F 0 "C9" H 6165 2346 50  0000 L CNN
F 1 "0.1uF" H 6165 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6088 2150 50  0001 C CNN
F 3 "~" H 6050 2300 50  0001 C CNN
	1    6050 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4C02EA
P 6050 2550
AR Path="/5D31F1CA/5D4C02EA" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D4C02EA" Ref="#PWR027"  Part="1" 
AR Path="/5D7A24CC/5D4C02EA" Ref="#PWR?"  Part="1" 
F 0 "#PWR027" H 6050 2300 50  0001 C CNN
F 1 "GND" H 6050 2400 50  0000 C CNN
F 2 "" H 6050 2550 60  0000 C CNN
F 3 "" H 6050 2550 60  0000 C CNN
	1    6050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2100 6050 2150
Wire Wire Line
	6050 2450 6050 2550
$Comp
L power:+5V #PWR?
U 1 1 5D4C1480
P 6050 2100
AR Path="/5D31F1CA/5D4C1480" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D4C1480" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 6050 1950 50  0001 C CNN
F 1 "+5V" H 6050 2240 50  0000 C CNN
F 2 "" H 6050 2100 60  0000 C CNN
F 3 "" H 6050 2100 60  0000 C CNN
	1    6050 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D4C22A6
P 9600 2350
AR Path="/5D7A24CC/5D4C22A6" Ref="C?"  Part="1" 
AR Path="/5D31F2B8/5D4C22A6" Ref="C10"  Part="1" 
F 0 "C10" H 9715 2396 50  0000 L CNN
F 1 "0.1uF" H 9715 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9638 2200 50  0001 C CNN
F 3 "~" H 9600 2350 50  0001 C CNN
	1    9600 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4C22AC
P 9600 2600
AR Path="/5D31F1CA/5D4C22AC" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D4C22AC" Ref="#PWR037"  Part="1" 
AR Path="/5D7A24CC/5D4C22AC" Ref="#PWR?"  Part="1" 
F 0 "#PWR037" H 9600 2350 50  0001 C CNN
F 1 "GND" H 9600 2450 50  0000 C CNN
F 2 "" H 9600 2600 60  0000 C CNN
F 3 "" H 9600 2600 60  0000 C CNN
	1    9600 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 2150 9600 2200
Wire Wire Line
	9600 2500 9600 2600
$Comp
L power:+5V #PWR?
U 1 1 5D4C22B4
P 9600 2150
AR Path="/5D31F1CA/5D4C22B4" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D4C22B4" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 9600 2000 50  0001 C CNN
F 1 "+5V" H 9600 2290 50  0000 C CNN
F 2 "" H 9600 2150 60  0000 C CNN
F 3 "" H 9600 2150 60  0000 C CNN
	1    9600 2150
	1    0    0    -1  
$EndComp
$Comp
L Logic_LevelTranslator:74LVC2T45DC U5
U 1 1 5D78C2AF
P 9900 1300
F 0 "U5" H 9600 1750 50  0000 C CNN
F 1 "74LVC2T45DCT" H 10250 800 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_3x3mm_P0.65mm" H 9900 450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC_LVCH2T45.pdf" H 10150 1050 50  0001 C CNN
	1    9900 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4FBF76
P 2200 1700
AR Path="/5D31F1CA/5D4FBF76" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D4FBF76" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 2200 1450 50  0001 C CNN
F 1 "GND" H 2200 1550 50  0000 C CNN
F 2 "" H 2200 1700 60  0000 C CNN
F 3 "" H 2200 1700 60  0000 C CNN
	1    2200 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4FC5E9
P 2600 2200
AR Path="/5D31F1CA/5D4FC5E9" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D4FC5E9" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 2600 1950 50  0001 C CNN
F 1 "GND" H 2600 2050 50  0000 C CNN
F 2 "" H 2600 2200 60  0000 C CNN
F 3 "" H 2600 2200 60  0000 C CNN
	1    2600 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1700 2200 1700
Wire Wire Line
	2000 2400 2500 2400
Wire Wire Line
	2500 2400 2500 2200
Connection ~ 2500 2200
Wire Wire Line
	2500 2200 2600 2200
Wire Wire Line
	1400 2700 1500 2700
$Comp
L power:GND #PWR?
U 1 1 5D5014D0
P 1300 2000
AR Path="/5D31F1CA/5D5014D0" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D5014D0" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 1300 1750 50  0001 C CNN
F 1 "GND" H 1300 1850 50  0000 C CNN
F 2 "" H 1300 2000 60  0000 C CNN
F 3 "" H 1300 2000 60  0000 C CNN
	1    1300 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D501968
P 1400 2700
AR Path="/5D31F1CA/5D501968" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D501968" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 1400 2450 50  0001 C CNN
F 1 "GND" H 1400 2550 50  0000 C CNN
F 2 "" H 1400 2700 60  0000 C CNN
F 3 "" H 1400 2700 60  0000 C CNN
	1    1400 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2000 1500 2000
$Comp
L power:GND #PWR?
U 1 1 5D503841
P 900 1200
AR Path="/5D31F1CA/5D503841" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D503841" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 900 950 50  0001 C CNN
F 1 "GND" H 900 1050 50  0000 C CNN
F 2 "" H 900 1200 60  0000 C CNN
F 3 "" H 900 1200 60  0000 C CNN
	1    900  1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  1200 1500 1200
Wire Wire Line
	2000 2200 2500 2200
$Comp
L Connector:TestPoint_Alt TP1
U 1 1 5D6169CB
P 5950 1400
F 0 "TP1" H 6008 1472 50  0000 L CNN
F 1 "TestPoint_Alt" H 6008 1427 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 6150 1400 50  0001 C CNN
F 3 "~" H 6150 1400 50  0001 C CNN
	1    5950 1400
	1    0    0    -1  
$EndComp
Connection ~ 5950 1400
Wire Wire Line
	5950 1400 6200 1400
$Comp
L Connector:TestPoint_Alt TP2
U 1 1 5D617A06
P 10500 1200
F 0 "TP2" H 10558 1272 50  0000 L CNN
F 1 "TestPoint_Alt" H 10558 1227 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 10700 1200 50  0001 C CNN
F 3 "~" H 10700 1200 50  0001 C CNN
	1    10500 1200
	1    0    0    -1  
$EndComp
Connection ~ 10500 1200
Wire Wire Line
	10500 1200 10750 1200
$Comp
L Device:R_Small_US R7
U 1 1 5D54B935
P 8950 1300
F 0 "R7" H 9018 1346 50  0000 L CNN
F 1 "10k" H 9018 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8950 1300 50  0001 C CNN
F 3 "~" H 8950 1300 50  0001 C CNN
	1    8950 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R3
U 1 1 5D54BD66
P 4100 1300
F 0 "R3" H 4168 1346 50  0000 L CNN
F 1 "10k" H 4168 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4100 1300 50  0001 C CNN
F 3 "~" H 4100 1300 50  0001 C CNN
	1    4100 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R4
U 1 1 5D54C51B
P 4350 1500
F 0 "R4" H 4418 1546 50  0000 L CNN
F 1 "10k" H 4418 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4350 1500 50  0001 C CNN
F 3 "~" H 4350 1500 50  0001 C CNN
	1    4350 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1200 4950 1200
Wire Wire Line
	4350 1400 4950 1400
$Comp
L power:GND #PWR?
U 1 1 5D550F83
P 4350 1600
AR Path="/5D31F1CA/5D550F83" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D550F83" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 4350 1350 50  0001 C CNN
F 1 "GND" H 4350 1450 50  0000 C CNN
F 2 "" H 4350 1600 60  0000 C CNN
F 3 "" H 4350 1600 60  0000 C CNN
	1    4350 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D5512CB
P 4100 1400
AR Path="/5D31F1CA/5D5512CB" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D5512CB" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 4100 1150 50  0001 C CNN
F 1 "GND" H 4100 1250 50  0000 C CNN
F 2 "" H 4100 1400 60  0000 C CNN
F 3 "" H 4100 1400 60  0000 C CNN
	1    4100 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R5
U 1 1 5D55151E
P 6600 1300
F 0 "R5" H 6668 1346 50  0000 L CNN
F 1 "10k" H 6668 1255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6600 1300 50  0001 C CNN
F 3 "~" H 6600 1300 50  0001 C CNN
	1    6600 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R6
U 1 1 5D551A7C
P 6750 1650
F 0 "R6" H 6818 1696 50  0000 L CNN
F 1 "10k" H 6818 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6750 1650 50  0001 C CNN
F 3 "~" H 6750 1650 50  0001 C CNN
	1    6750 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1200 7200 1200
Wire Wire Line
	6750 1400 6750 1550
Wire Wire Line
	8950 1200 9500 1200
Wire Wire Line
	9050 1400 8950 1400
Connection ~ 9050 1400
$Comp
L power:GND #PWR?
U 1 1 5D559A86
P 6750 1800
AR Path="/5D31F1CA/5D559A86" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D559A86" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 6750 1550 50  0001 C CNN
F 1 "GND" H 6750 1650 50  0000 C CNN
F 2 "" H 6750 1800 60  0000 C CNN
F 3 "" H 6750 1800 60  0000 C CNN
	1    6750 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D559E4C
P 6600 1500
AR Path="/5D31F1CA/5D559E4C" Ref="#PWR?"  Part="1" 
AR Path="/5D31F2B8/5D559E4C" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 6600 1250 50  0001 C CNN
F 1 "GND" H 6600 1350 50  0000 C CNN
F 2 "" H 6600 1500 60  0000 C CNN
F 3 "" H 6600 1500 60  0000 C CNN
	1    6600 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1400 6600 1500
Wire Wire Line
	6750 1750 6750 1800
$EndSCHEMATC
