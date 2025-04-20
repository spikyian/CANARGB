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
 *	The Main CANILED program.
 *
 * @author Ian Hogg 
 * @date Apr 2024
 * 
 */ 
/**
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 */ 

#include <xc.h>
#include "devincs.h"
#include <stddef.h>
#include "module.h"
#include "vlcb.h"
// the services
#include "mns.h"
#include "nv.h"
#include "can.h"
#include "boot.h"
#include "event_teach.h"
#include "event_consumer_simple.h"
#include "event_acknowledge.h"

// others
#include "ticktime.h"
#include "statusLeds.h"
#include "nvm.h"
#include "timedResponse.h"

// module specific
#include "canargb_nvs.h"
#include "canargb_events.h"
#include "canargb_leds.h"

/**************************************************************************
 * Application code packed with the bootloader must be compiled with options:
 * XC8 linker options -> Additional options --CODEOFFSET=0x800 
 * This generates an error
 * ::: warning: (2044) unrecognized option "--CODEOFFSET=0x800"
 * but this can be ignored as the option works
 * 
 * Then the Application project must be made dependent on the Bootloader 
 * project by adding the Bootloader to project properties->Conf:->Loading
 ***************************************************************************/

/*
 * File:   main.c
 * Author: Ian Hogg
 * 
 * This is the main for the Intelligent LED (WS2811) driver module.
 * 
 *
 * Created on 1 April 2025
 */
/** TODOs
 *
 */


// forward declarations
//void __init(void);
//uint8_t checkCBUS( void);
//void ISRHigh(void);
void initialise(void);
//void configIO(uint8_t io);
//void factoryReset(void);
//void factoryResetEE(void);
//void factoryResetFlash(void);
void factoryResetGlobalEvents(void);


static TickValue   flashTime;
static TickValue   testTime;
static TickValue   subtestTime;


const Service * const services[] = {
    &canService,
    &mnsService,
    &nvService,
    &bootService,
    &eventTeachService,
    &eventConsumerService
};


/**
 * Called at first run to initialise all the non volatile memory. 
 * Also called if the PB hold down special sequence at power up is done.
 * Also called as a result of a NNRSM request.
 */
void APP_factoryReset(void) {
    uint8_t io;
    
    factoryResetGlobalEvents();
}

#define NUM_TESTS 6
/**
 * Called if the PB is held down during power up.
 * Normally would perform any test functionality to help a builder check the hardware.
 * Goes through a number of different tests, each lasting a few seconds and then repeats
 * indefinately. Function does not end.
 */
void APP_testMode(void) {
    uint8_t step;
    uint8_t i,c;
    
    initARGB();
    ANSELA = 0x00;
    ANSELB = 0x00;
    ANSELC = 0x00;

    // enable interrupts, all init now done
    ei(); 

    testTime.val = tickGet();
    
    step = 0;
    while (TRUE) {
        if (tickTimeSince(testTime) > (4 * ONE_SECOND)) {
            testTime.val = tickGet();
            step++;
            if (step >= NUM_TESTS) step = 0;
            
            switch (step) {
                case 0: // all red
                    updateLedRange(0, MAX_LEDS-1, (PaletteIndex)((uint8_t)0x99));
                    break;
                case 1: // all green
                    updateLedRange(0, MAX_LEDS-1, (PaletteIndex)((uint8_t)0xAA));
                    break;
                case 2: // all blue
                    updateLedRange(0, MAX_LEDS-1, (PaletteIndex)((uint8_t)0xBB));
                    break;
                case 3:
                    updateLedRange(0, MAX_LEDS-1, (PaletteIndex)((uint8_t)0x00));   // all black
                    for (i=0,c=1; i<255; i++) {     // each led a different colour
                        ledPaletteIndexes[i].asByte = c;
                        c++;
                        if (c >= 0x10) c=1;
                    }
                    break;
                case 4:
                    updateLedRange(0, 19, (PaletteIndex)((uint8_t)0x0F));
                    updateLedRange(20, 39, (PaletteIndex)((uint8_t)0xF0));
                    updateLedRange(40, 59, (PaletteIndex)((uint8_t)0x0F));
                    updateLedRange(60, 79, (PaletteIndex)((uint8_t)0xF0));
                    updateLedRange(80, 99, (PaletteIndex)((uint8_t)0x0F));
                    updateLedRange(100, 119, (PaletteIndex)((uint8_t)0xF0));
                    updateLedRange(120, 139, (PaletteIndex)((uint8_t)0x0F));
                    updateLedRange(140, 159, (PaletteIndex)((uint8_t)0xF0));
                    updateLedRange(160, 179, (PaletteIndex)((uint8_t)0x0F));
                    updateLedRange(180, 199, (PaletteIndex)((uint8_t)0xF0));
                    updateLedRange(200, 219, (PaletteIndex)((uint8_t)0x0F));
                    updateLedRange(220, 239, (PaletteIndex)((uint8_t)0xF0));
                    updateLedRange(240, MAX_LEDS-1, (PaletteIndex)((uint8_t)0x0F));
                    break;
                case 5:
                    updateLedRange(0, MAX_LEDS-1, (PaletteIndex)((uint8_t)0x00));   // all black
                    i=0;
                    subtestTime.val = tickGet();
                    break;
            }
        }
        if (step == 5) {    // animate
            if (tickTimeSince(subtestTime) > HUNDRED_MILI_SECOND) {
                subtestTime.val = tickGet();
                updateLedRange(i,i, (PaletteIndex)((uint8_t)0xFF));   // update next in string to white
                i++;
            }
        }
    }
}

/**
 * Called upon power up.
 */
void setup(void) {
    // use CAN as the module's transport
    transport = &canTransport;

    /**
     * The order of initialisation is important.
     */
    setTimedResponseDelay(5);
    
    initARGB();

    ANSELA = 0x00;
    ANSELB = 0x00;
    ANSELC = 0x00;

    // enable interrupts, all init now done
    ei(); 
    flashTime.val = tickGet();
    updateLedRange(0, MAX_LEDS-1, (PaletteIndex)(uint8_t)1);  
    updateRGB();
}

void loop(void) {
    // Check and do flashing
    if (tickTimeSince(flashTime) > HALF_SECOND) {
        doFlash();
        flashTime.val = tickGet();
    }
    // Keep the LEDs up to date.
    refreshString();
}

// Application functions required by MERGLCB library


/**
 * Check to see if now is a good time to start a flash write.
 * It is a bad time if we are currently doing a servo pulse.
 * 
 * If a DMA transfer is currently in progress then it is a bad time. 
 * 
 * @return GOOD_TIME if OK else BAD_TIME
 */
ValidTime APP_isSuitableTimeToWriteFlash(void){
    if (DMAnCON0bits.DGO) return BAD_TIME;
    return GOOD_TIME;
}



