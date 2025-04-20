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
#include "event_teach.h"
#include "mns.h"
#include "canargb_events.h"
#include "canargb_leds.h"

#define ACTION_ON_MASK      0x01
#define ACTION_OFF_MASK     0x02

// forward declarations
extern void clearAllEvents(void);


void factoryResetGlobalEvents(void) {
    // No default switch/button events
    clearAllEvents();
}

/**
 * The CANARGB module doesn't produce events so all events are consumed. 
 * 
 * @param tableIndex
 * @return 
 */
uint8_t APP_isConsumedEvent(uint8_t tableIndex) {
    return TRUE;
}

/**
 * No special handling is required.
 * 
 * @param m
 */
Processed APP_preProcessMessage(Message * m) {
    return NOT_PROCESSED;
}
/**
 * This application doesn't need to process any messages in a special way.
 */
Processed APP_postProcessMessage(Message * m) {
    return NOT_PROCESSED;
}

/**
 * No need for special handling.
 * 
 * @param nodeNumber
 * @param eventNumber
 * @param evNum
 * @param evVal
 * @param forceOwnNN
 * @return 
 */
uint8_t APP_addEvent(uint16_t nodeNumber, uint16_t eventNumber, uint8_t evNum, uint8_t evVal, Boolean forceOwnNN) {
    return addEvent(nodeNumber, eventNumber, evNum, evVal, forceOwnNN);
}

/**
 * Update the ledStates array for all the LEDs impacted by the event according 
 * to the event's EVs.
 * 
 * @param tableIndex the index of the event data
 * @param m event message pointer
 * @return 
 */
Processed APP_processConsumedEvent(uint8_t tableIndex, Message *m) {
    uint8_t ev;
    uint8_t onOff;
    
    onOff = !(m->opc & 1);
    if (getEVs(tableIndex)) {   
        // something went wrong
        return PROCESSED;
    }

    for(ev=0; ev<EVperEVT; ev+=4) {
        uint8_t action;
        uint8_t start_ledno;
        uint8_t end_ledno;
        PaletteIndex colourPixelIndexPair;
        
        action = evs[ev];
        start_ledno = evs[ev+1];
        end_ledno = evs[ev+2];
        colourPixelIndexPair.asByte = evs[ev+3];
        
        if (onOff && (action & ACTION_ON_MASK)) {
            updateLedRange(start_ledno, end_ledno, colourPixelIndexPair);
        }
        if (!onOff && (action & ACTION_OFF_MASK)) {
            updateLedRange(start_ledno, end_ledno, colourPixelIndexPair);
        }
    }
    updateRGB();
    return PROCESSED;
}


