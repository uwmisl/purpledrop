EESchema Schematic File Version 4
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
L Logic_LevelTranslator:74LVC2T45DC U67
U 1 1 5D6DC100
P 5350 1300
F 0 "U67" H 5050 1750 50  0000 C CNN
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
	1500 800  1000 800 
$Comp
L power:+3V3 #PWR0103
U 1 1 5D6EC6EA
P 1000 800
F 0 "#PWR0103" H 1000 650 50  0001 C CNN
F 1 "+3V3" H 1015 973 50  0000 C CNN
F 2 "" H 1000 800 50  0001 C CNN
F 3 "" H 1000 800 50  0001 C CNN
	1    1000 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0104
U 1 1 5D6ED250
P 5250 750
F 0 "#PWR0104" H 5250 600 50  0001 C CNN
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
AR Path="/5D31F2B8/5D778122" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 2400 600 50  0001 C CNN
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
AR Path="/5D31F2B8/5D77C825" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 2400 750 50  0001 C CNN
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
AR Path="/5D31F2B8/5D77DE53" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 5450 600 50  0001 C CNN
F 1 "+5V" H 5450 890 50  0000 C CNN
F 2 "" H 5450 750 60  0000 C CNN
F 3 "" H 5450 750 60  0000 C CNN
	1    5450 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 750  5450 800 
$Comp
L power:+3V3 #PWR0109
U 1 1 5D77EA85
P 4800 1550
F 0 "#PWR0109" H 4800 1400 50  0001 C CNN
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
	4950 1200 4500 1200
Wire Wire Line
	4950 1400 4500 1400
Wire Wire Line
	5750 1200 6200 1200
Wire Wire Line
	5750 1400 6200 1400
Text Label 4550 1200 0    50   ~ 0
pi_latch
Text Label 4550 1400 0    50   ~ 0
pi_clk
$Comp
L Logic_LevelTranslator:74LVC2T45DC U68
U 1 1 5D78A2E0
P 7600 1300
F 0 "U68" H 7300 1750 50  0000 C CNN
F 1 "74LVC2T45DCT" H 7950 800 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_3x3mm_P0.65mm" H 7600 450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC_LVCH2T45.pdf" H 7850 1050 50  0001 C CNN
	1    7600 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0110
U 1 1 5D78A2E6
P 7500 750
F 0 "#PWR0110" H 7500 600 50  0001 C CNN
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
AR Path="/5D31F2B8/5D78A2ED" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 7700 600 50  0001 C CNN
F 1 "+5V" H 7700 890 50  0000 C CNN
F 2 "" H 7700 750 60  0000 C CNN
F 3 "" H 7700 750 60  0000 C CNN
	1    7700 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 750  7700 800 
$Comp
L power:+3V3 #PWR0112
U 1 1 5D78A2F4
P 7050 1550
F 0 "#PWR0112" H 7050 1400 50  0001 C CNN
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
	7200 1200 6750 1200
Wire Wire Line
	7200 1400 6750 1400
Wire Wire Line
	8000 1200 8450 1200
Wire Wire Line
	8000 1400 8450 1400
$Comp
L Logic_LevelTranslator:74LVC2T45DC U69
U 1 1 5D78C2AF
P 9900 1300
F 0 "U69" H 9600 1750 50  0000 C CNN
F 1 "74LVC2T45DCT" H 10250 800 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_3x3mm_P0.65mm" H 9900 450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC_LVCH2T45.pdf" H 10150 1050 50  0001 C CNN
	1    9900 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0113
U 1 1 5D78C2B5
P 9800 750
F 0 "#PWR0113" H 9800 600 50  0001 C CNN
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
AR Path="/5D31F2B8/5D78C2BC" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 10000 600 50  0001 C CNN
F 1 "+5V" H 10000 890 50  0000 C CNN
F 2 "" H 10000 750 60  0000 C CNN
F 3 "" H 10000 750 60  0000 C CNN
	1    10000 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 750  10000 800 
$Comp
L power:+3V3 #PWR0115
U 1 1 5D78C2C3
P 9350 1550
F 0 "#PWR0115" H 9350 1400 50  0001 C CNN
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
	9500 1200 9050 1200
Wire Wire Line
	9500 1400 9050 1400
Wire Wire Line
	10300 1200 10750 1200
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
AR Path="/5D31F2B8/5D78E711" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 5350 1550 50  0001 C CNN
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
AR Path="/5D31F2B8/5D79071E" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 7600 1550 50  0001 C CNN
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
AR Path="/5D31F2B8/5D790B94" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 9900 1550 50  0001 C CNN
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
AR Path="/5D31F2B8/5D7914BF" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 9050 1150 50  0001 C CNN
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
L Device:R_Small_US R8
U 1 1 5D2EFC55
P 3300 1450
F 0 "R8" H 3368 1496 50  0000 L CNN
F 1 "4k32" H 3368 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3300 1450 50  0001 C CNN
F 3 "~" H 3300 1450 50  0001 C CNN
	1    3300 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R9
U 1 1 5D2F0A08
P 3300 1800
F 0 "R9" H 3368 1846 50  0000 L CNN
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
AR Path="/5D31F2B8/5D2F0C79" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 3300 1750 50  0001 C CNN
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
$EndSCHEMATC
