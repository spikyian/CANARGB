/*
  This work is licensed under the:
      Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
   To view a copy of this license, visit:
      http://creativecommons.org/licenses/by-nc-sa/4.0/
   or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

   License summary:
    You are free to:
      Share, copy and redistribute the material in any medium or format
      Adapt, remix, transform, and build upon the material

    The licensor cannot revoke these freedoms as long as you follow the license terms.

    Attribution : You must give appropriate credit, provide a link to the license,
                   and indicate if changes were made. You may do so in any reasonable manner,
                   but not in any way that suggests the licensor endorses you or your use.

    NonCommercial : You may not use the material for commercial purposes. **(see note below)

    ShareAlike : If you remix, transform, or build upon the material, you must distribute
                  your contributions under the same license as the original.

    No additional restrictions : You may not apply legal terms or technological measures that
                                  legally restrict others from doing anything the license permits.

   ** For commercial use, please contact the original copyright holder(s) to agree licensing terms

    This software is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE
 */
/**
 *	The CANILED program.
 *
 * @author Ian Hogg 
 * @date April 2025
 * 
 */ 
#include <xc.h>
#include "module.h"
#include "nv.h"

#include "canargb_leds.h"

typedef struct Colours {
    uint8_t r;
    uint8_t g;
    uint8_t b;
} Colours;
static Colours leds[MAX_LEDS];


PaletteIndex ledPaletteIndexes[MAX_LEDS];

static uint8_t flashState;
static uint8_t refreshRequired;

//#define FAST_MODE

void initARGB(void) {
    uint8_t ledno;
    
    flashState = 0;
    
    for (ledno=0; ledno <MAX_LEDS; ledno++) {
        leds[ledno].r = 0;    // black (off)
        leds[ledno].g = 0;    // black (off)
        leds[ledno].b = 0;    // black (off)
        ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex = 0;   // probably black
        ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex = 0;  // probably black
    }
    
    /* Now set up the peripherals to drive the WS2811 signal.
     * We'll use SPI as a host/master, a PWM as a pulse generator and CLC to
     * combine the 2 signals. 
     * Although considered using the ideas from Microchip AN1606 this actually
     * seems rather lax on the signal timing and I think this approach performs
     * better.
     * Optionally uses "fast mode" with #define FAST_MODE
     * Loading SSP1BUF register sends that data byte to the DSM peripheral.
     * The SPI clock out is used to trigger the two monostable timers TMR2 and TMR4.
     * TMR2 is used for the longer logic 1 pulse 0.4us (0.8us slow mode).
     * TMR4 is used for the shorter logic 0 pulse 0.225us (0.45us slow mode).
     * Unfortunately the TMR2 and TMR4 cannot be triggered directly from SPI-CLK-OUT
     * but we can trigger via a CLC.
     * The DSM selects between the long or short pulse based upon the SPI data. 
     * DMA?
     * 
     * DMA----->SPI-----------
     *           |ck         |
     *           |           v mux
     *           v          DSM---------> PPS ---> PORTC0
     *          CLC1       ^H  ^L
     *           |         |   |
     *           |         |   |
     *           |        CLC2 |
     *           |         | CLC4
     *           |         |   |
     *           ---TMR2----   |
     *           |             |
     *           ---TMR4--------
     *           
     */
    
    // Main Output on RC0 other to help debug
    TRISC = 0;
    RC0PPS = 0x43;      // DSM1
    RC1PPS = 0x32;      // SPI1_SDO
    RC2PPS = 0x31;      // SPI1_SCK
    RC3PPS = 0x01;      // CLC1
    RC4PPS = 0x02;      // CLC2 (TMR2)
    RC5PPS = 0x04;      // CLC4 (TMR4)
    RC6PPS = 0x00;      // LATC6 (flashState)
    
    // Set up SPI as host
    {
        SPI1CON0bits.LSBF=0;        // 0 => MSB first(Tratitional)
        SPI1CON0bits.BMODE=1;       // 1 => all bytes are TWIDTH bits wide
        SPI1CON0bits.MST=1;         // 1 => Master mode

        SPI1TWIDTHbits.TWIDTH=0;    // 0 => 8 bits
        SPI1TCNT=0;

        SPI1CON1bits.SMP=0;         // 0 => Sample in the middle of data output time
        SPI1CON1bits.CKE=1;         // 1 => output changes Active to Idle clock state
        SPI1CON1bits.CKP=0;         // 1 => Idle state for SCK is low
        SPI1CON1bits.SDIP=1;        // 1 => SDO polarity

        SPI1CON2bits.SSET=0;        // 0 => Master: SS_out is driven to the Active state while the transmit counter is not zero
        SPI1CON1bits.SSP=1;         // 1 => SS is active low
        SPI1CON2bits.TXR=1;         // 1 => Transmit Data-Required Bit
        SPI1CON2bits.RXR=0;         // 0 => No receive data
        
        SPI1CLKbits.CLKSEL=0b00000; // 0b00000 => Fosc
#ifdef FAST_MODE
        SPI1BAUDbits.BAUD = 19;      // Freq = Fosc/80
#else
        SPI1BAUDbits.BAUD = 39;      // Freq = Fosc/160
#endif
        SPI1INTF=0;
        SPI1CON0bits.EN=1;
    }
    
    // Set up CLC1 as a nop gate with input from SPI CK
    {
        CLCSELECT = 0;      // CLC1
        CLCnCON = 0x82;     // ENABLED, No interrupts and Cell is 4 input AND
        CLCnPOL = 0x0E;     // Invert gates 2,3,4 to make them Logic 1
        CLCnSEL0 = 0x41;    // select SPI1 SCK
        CLCnSEL1 = 0x41;    // select SPI1 SCK
        CLCnSEL2 = 0x41;    // select SPI1 SCK
        CLCnSEL3 = 0x41;    // select SPI1 SCK
        CLCnGLS0 = 1;       // Use Gate 1 non inverted
        CLCnGLS1 = 0;       // Logic 0 requires polarity invert to make 1 to go into AND
        CLCnGLS2 = 0;       // Logic 0 requires polarity invert to make 1 to go into AND
        CLCnGLS3 = 0;       // Logic 0 requires polarity invert to make 1 to go into AND
    }

    // Set up Timer2 period for desired monostable long pulse
    {
        T2CON = 0x0;        // 1:1 prescalar, 1:1 postscalar
        T2CLKCON = 0x02;    // Fosc clock source
        T2HLT = 0x11;       // Monostable with trigger on rising edge
        T2RST = 0x12;       // reset from CLC1
#ifdef FAST_MODE
        T2PR = 26;          // Period of 26
#else
        T2PR = 51;          // Period of 51
#endif
    }
    
    // Set up Timer4 period for desired monostable short pulse
    {
        T4CON = 0x0;        // 1:1 prescalar, 1:1 postscalar
        T4CLKCON = 0x02;    // Fosc clock source
        T4HLT = 0x11;       // Monostable with trigger on rising edge
        T4RST = 0x12;       // reset from CLC1
#ifdef FAST_MODE
        T4PR = 14;          // Period of 14
#else
        T4PR = 29;          // Period of 29
#endif
    }
    
    // Set up CLC2 as a nop gate for connection between TMR2 and DSM H input.
    // TMR is low whilst counting, we need it high whilst counting so invert the output
    {
        CLCSELECT = 1;      // CLC2
        CLCnCON = 0x82;     // ENABLED, No interrupts and Cell is 4 input AND
        CLCnPOL = 0x8E;     // Output inversion, Invert gates 2,3,4
        CLCnSEL0 = 0x14;    // select TMR2
        CLCnSEL1 = 0x14;    // select TMR2
        CLCnSEL2 = 0x14;    // select TMR2
        CLCnSEL3 = 0x14;    // select TMR2
        CLCnGLS0 = 0x01;    // Use Gate 1 non inverted
        CLCnGLS1 = 0x00;    // Logic 0 requires polarity invert to make 1 to go into AND
        CLCnGLS2 = 0x00;    // Logic 0 requires polarity invert to make 1 to go into AND
        CLCnGLS3 = 0x00;    // Logic 0 requires polarity invert to make 1 to go into AND
    }
    
    // Set up CLC4 as a nop gate for connection between TMR4 and DSM L input
    // TMR is low whilst counting, we need it high whilst counting so invert the output
    {
        CLCSELECT = 3;      // CLC4
        CLCnCON = 0x82;     // ENABLED, No interrupts and Cell is 4 input AND
        CLCnPOL = 0x8E;     // Output inversion, Invert gates 2,3,4
        CLCnSEL0 = 0x16;    // select TMR4
        CLCnSEL1 = 0x16;    // select TMR4
        CLCnSEL2 = 0x16;    // select TMR4
        CLCnSEL3 = 0x16;    // select TMR4
        CLCnGLS0 = 0x01;    // Use Gate 1 non inverted
        CLCnGLS1 = 0x00;    // Logic 0 requires polarity invert to make 1 to go into AND
        CLCnGLS2 = 0x00;    // Logic 0 requires polarity invert to make 1 to go into AND
        CLCnGLS3 = 0x00;    // Logic 0 requires polarity invert to make 1 to go into AND
    }
    
    // Set up DSM to select correct pulse length based upon SPI SO output
    {
        MD1CON0 = 0;        // normal polarity
        MD1CON1 = 0x00;     // no synchronisation, Modulator signal inverted inversion
        MD1CARH = 0x12;     // CLC2
        MD1CARL = 0x10;     // CLC4
        MD1SRC = 0x1F;      // SPI1_SDO
    }

    // Set up DMA1 to transfer 3 x 256 bytes to SPI1TXB
    // DMA transaction = 1 byte. DMA message = 0x300 bytes.
#ifdef DMA
    {
        DMASELECT=0; // Select DMA1
        DMAnCON1bits.DMODE=0;       // 0 => Destination Pointer (DMADPTR) remains unchanged after each transfer
        DMAnCON1bits.SMR=0;         // 0 => SFR/GPR data space is DMA source memory
        DMAnCON1bits.SMODE=1;       // 1 => Source pointer increments
        DMAnCON1bits.SSTP=1;        // 1 => Clear SIRQEN once all data transferred
        DMAnSSZ=3*MAX_LEDS;         // 3 x number of LED for the total number of colour bytes
        DMAnSSA=(__uint24)leds;     // the array of byes for the LEDs
        DMAnDSZ=1;                  // 1 byte of SPI1TXR
        DMAnDSA=(uint16_t)&SPI1TXB; // SPI1 transmit buffer
        DMAnSIRQ=0x19;              // 0x19 => SPI1TX
        DMAnAIRQ=0;                 // No abort
        //Change arbiter priority if needed and perform lock operation
        DMA1PR = 0x01;            // Change the priority only if needed
        PRLOCK = 0x55;            // This sequence
        PRLOCK = 0xAA;            // is mandatory
        PRLOCKbits.PRLOCKED = 1;  // for DMA operation
        DMAnCON0bits.SIRQEN = 0;    // not ready to transfer data yet
        DMAnCON0bits.EN=1;      
    }
#endif

    T2CONbits.ON = 1;
    T4CONbits.ON = 1;
    MD1CON0bits.EN = 1;
    
    refreshRequired = 1;
}

/** Update a range of LEDs in the leds array based upon the request range and colour index pair.
 * The pair is made up of an upper nibble and a lower nibble. Flashing alternates between these two
 * indexes. The index is the offset into the palette.
 */ 
void updateLedRange(uint8_t start_ledno, uint8_t end_ledno, PaletteIndex colourIndexPair) {
    uint8_t ledno;
    if (end_ledno >= MAX_LEDS) end_ledno = MAX_LEDS-1;
    // update the LED array using the 2 nibbles of the new colour. a value of 0 is no change
    for(ledno=start_ledno; ledno<=end_ledno; ledno++) {
        ledPaletteIndexes[ledno] = colourIndexPair;
    }
}

/**
 * Schedule a refresh of the LEDs.
 */
void updateRGB(void) {
    refreshRequired = 1;
}

/**
 * Toggle between flashStates of flashOn and flashOff. Update the led colours
 * based by looking up from the palette. 
 */
void doFlash(void) {
    uint8_t ledno;
    uint8_t order;
    
    flashState = 1-flashState;
    order = (uint8_t)getNV(NV_COLOUR_ORDER);
    
    for (ledno=0; ledno < MAX_LEDS; ledno++) {
        if (flashState) {
            switch (order) {
                case ORDER_RGB:
                    leds[ledno].r = RED(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].g = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].b = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    break;
                case ORDER_RBG:
                    leds[ledno].r = RED(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].b = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].g = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    break;
                case ORDER_GBR:
                    leds[ledno].b = RED(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].r = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].g = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    break;
                case ORDER_BRG:
                    leds[ledno].g = RED(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].b = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].r = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    break;
                case ORDER_BGR:
                    leds[ledno].b = RED(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].g = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].r = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    break;
                default: // case ORDER_GRB:
                    leds[ledno].g = RED(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].r = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    leds[ledno].b = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOnPaletteIndex);
                    break;
            }
            
        } else {
            switch (order) {
                case ORDER_RGB:
                    leds[ledno].r = RED(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].g = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].b = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    break;
                case ORDER_RBG:
                    leds[ledno].r = RED(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].b = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].g = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    break;
                case ORDER_GBR:
                    leds[ledno].b = RED(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].r = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].g = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    break;
                case ORDER_BRG:
                    leds[ledno].g = RED(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].b = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].r = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    break;
                case ORDER_BGR:
                    leds[ledno].b = RED(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].g = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].r = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    break;
                default: // case ORDER_GRB:
                    leds[ledno].g = RED(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].r = GREEN(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    leds[ledno].b = BLUE(ledPaletteIndexes[ledno].asNibbles.flashOffPaletteIndex);
                    break;
            }
            
        }
    }
    refreshRequired = 1;
}

/**
 * Refresh the string of LEDs by outputting the LED data according to WS2811 spec.
 * This sends the data for each LED in turn, starting with the one nearest the module.
 * Each LED had 24 bits, made up of 8 red, 8 green, 8 blue bits. Each colour byte 
 * is sent MSB first with a 1 as a 0.8us logic 1 followed by a 0.45us logic 0. 
 * A 0 bit is a 0.45us logic 1 followed by a 0.8us logic 0. The end of the entire
 * 256 LED frame is indicated by at least 50us at logic 0.  
 */
void refreshString(void) {
    uint16_t offset;
    
    // if a transfer is already in progress then wait
    //if (DMAnCON0bits.DGO) return;
//    sendByte();
    if (refreshRequired) {
        refreshRequired = 0;
#ifdef DMA
        // Start a transfer
        SPI1TCNT = 3 * MAX_LEDS;
        DMAnCON0bits.SIRQEN = 1;
#else       
        // do a transfer
        offset = 0;
        while (offset < 3*MAX_LEDS) {
            if (PIR3bits.SPI1TXIF) {
                SPI1TXB = *(offset+(uint8_t *)leds);
                offset++;
            }
        }
#endif 

LATCbits.LATC6 = flashState;
    }
}
