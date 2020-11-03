# Rev 6.1 (Nov 2020)

Functionally equivalent to rev 6, but fixes several issues with the rev 6 design.

- Fix several labeling errors
  - RED/GREEN LED labels backwards for HV enable switch
  - R41/R42 silkscreen labels swapped
  - Incorrect top plate steering resistor silkscreen labels
  - Incorrect PWM channel labels in silkscreen
- Move `HV_CLK` and `HV_DIN` to SPI pins PC10 and PC12
- Fix footprint pin assignment error on U16 (reference diode)
- Add low-pass filter to high voltage feedback lines to ADC
- Add pulldown to VTARGET output to prevent enabling HV when STM32 is in reset
- Move HV enable switch to opposite side of board, away from exposed HV nets
- Add HV507 low-side augment FET to improve capacitance sensing noise
- Switch to 2-wire RTD pins, and combine all 4 sensors into one 8-pin header
- Fix BOOT0 polarity, so that STM32 boots to application by default
- Add BOOT1 pulldown resistor
- Add 1000pF capacitance on RTD inputs for rejection of HV coupling
- Increase HV voltage divider resistance to save power

# Rev 6 (April 2020)

- Switch to STM32F4 for main controller (instead of raspberry pi)
- Switch to 5V input voltage from micro-USB or aux barrel connector
- Add current sensing for top-plate driver
- Use isolated power supply reference ground for HV507 supplies (`5V_ISO` and `V_HV`)
- HV supply uses op-amp feedback for regulation (instead of linear regulator)
- By default MCU measures and controls HV supply voltage
    - Optionally, steering resistor can select trim pot for voltage control
- Add fourth RTD sensor input
- Convert to single component revision (0.5.1 -> rev 6)


