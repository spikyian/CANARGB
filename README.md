
This module is for driving a string of WS2811 (or WS2812b) intelligent RGB LEDs.

A string up to 255 LEDs can be used.

LEDs on strips or wires may be used and 5V or 12V may be used provided the module PCB is correctly configured.

The firmware is targeted at a PIC18F27Q83 on a board similar to a CANMIO as that supports a separate voltage regulator for I/O. 
The LM317 VR1 regulator may need a heatsink for a string containing a lot of LEDs.

I/O usage: 
PB RA2
 * Green LED RB7
 * Yellow LED RB6
 * CAN TX RB2
 * CAN RX RB7
 * String Output RC0

NVs
Colour palette
NV1..3  Colour 0
NV4..6  Colour 1
NV7..9  Colour 2
NV10..12  Colour 3
NV13..15  Colour 4
NV16..18  Colour 5
NV19..21  Colour 6
NV22..24  Colour 7
NV25..27  Colour 8
NV28..30  Colour 9
NV31..33  Colour 10
NV34..36  Colour 11
NV37..39  Colour 12
NV40..42  Colour 13
NV43..45  Colour 14
NV46..48  Colour 15

EVs
LED instructions are a sequence of up to 63 instructions, each of 4 EVs. I.e. a max of 252 EVs.
 * Start of range LED number (0-255)
 * End of range LED number (0-255)
 * On event Colour (flash off colour) << 4 | (flash on colour)
 * Off event Colour (flash off colour) << 4 | (flash on colour)

