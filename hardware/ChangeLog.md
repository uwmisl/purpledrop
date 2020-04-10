# Rev 6 (April 2020)

- Switch to STM32F4 for main controller (instead of raspberry pi)
- Switch to 5V input voltage from micro-USB or aux barrel connector
- Add current sensing for top-plate driver
- Use isolated power supply reference ground for HV507 supplies (5V_ISO and V_HV)
- HV supply uses op-amp feedback for regulation (instead of linear regulator)
- By default MCU measures and controls HV supply voltage
    - Optionally, steering resistor can select trim pot for voltage control
- Add fourth RTD sensor input
- Convert to single component revision (0.5.1 -> rev 6)