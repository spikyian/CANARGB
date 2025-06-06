#ifndef _MODULE_H_
#define _MODULE_H_

// comment out for CBUS
#define VLCB
// Enable FCU compatibility
#define FCU_COMPAT

#include "statusLeds.h"

//
// VLCB Service options first
//
// The data version stored at NV#0
#define APP_NVM_VERSION 1
#define NUM_SERVICES 6


#if defined(_18FXXQ83_FAMILY_)
#define IVT_BASE      0x900
#define IVT_BASE_U    0x00
#define IVT_BASE_H    0x09
#define IVT_BASE_L    0x00
#endif

//
// NV service
//
#define NV_NUM          49
#define NV_ADDRESS      0x200
#define NV_NVM_TYPE     EEPROM_NVM_TYPE

#define NV_CACHE

//
// CAN service
//
#define CANID_ADDRESS  0x3FE    // 1 byte
#define CANID_NVM_TYPE EEPROM_NVM_TYPE
#define CAN_INTERRUPT_PRIORITY 0    // all low priority
#define CAN_CLOCK_MHz   64
// Number of buffers
#define CAN_NUM_RXBUFFERS   8

//
// BOOT service
//
#define BOOT_FLAG_ADDRESS   0x3FF
#define BOOT_FLAG_NVM_TYPE EEPROM_NVM_TYPE
#define BOOTLOADER_PRESENT

//
// EVENT TEACH SERVICE
//
//
#define EVENT_TABLE_WIDTH   248  // This is also the number of EVs per event.
#define NUM_EVENTS          255  // The number of rows in the event table. The
                                 // actual number of events may be less than this
                                 // if any events use more the 1 row.
#define EVperEVT            248  // number of EVs per event
#define EV_FILL             0
#define NO_ACTION           0
#define EVENT_HASH_TABLE
#define EVENT_HASH_LENGTH   32
#define EVENT_CHAIN_LENGTH  20

#define EVENT_TABLE_ADDRESS               0x10000
#define EVENT_TABLE_NVM_TYPE    FLASH_NVM_TYPE
#define CONSUMED_EVENTS

//
// EVENT CONSUMER SERVICE
#define HANDLE_DATA_EVENTS


//
// MNS service
//
// Processor clock speed
#define clkMHz      64
// 2 bytes for the module's node number
#define NN_ADDRESS  0x3FC 
#define NN_NVM_TYPE EEPROM_NVM_TYPE
// 1 byte for the version number
#define VERSION_ADDRESS    0x3FA
#define VERSION_NVM_TYPE   EEPROM_NVM_TYPE
// 1 byte for the mode
#define MODE_ADDRESS    0x3FB
#define MODE_NVM_TYPE   EEPROM_NVM_TYPE
// 1 byte for the mode flags
#define MODE_FLAGS_ADDRESS    0x3F9
#define MODE_FLAGS_NVM_TYPE   EEPROM_NVM_TYPE
// Parameters
#define PARAM_MANU              MANU_MERG

#define PARAM_MODULE_ID         MTYP_CANARGB
#define PARAM_MAJOR_VERSION     1
#define PARAM_MINOR_VERSION     'a'
#define PARAM_BUILD_VERSION     1
// Module name - must be 7 characters
#define NAME    "ARGB   "

#define PARAM_NUM_NV            NV_NUM
#define PARAM_NUM_EVENTS        NUM_EVENTS
#define PARAM_NUM_EV_EVENT      252

// LEDs and PB                                 // GREEN is 0 YELLOW is 1
#if defined(_18F66K80_FAMILY_)
#define APP_setPortDirections(){ANCON0=ANCON1=0; TRISBbits.TRISB6=TRISBbits.TRISB7=0,TRISAbits.TRISA2=1;}
#endif
#if defined(_18FXXQ83_FAMILY_)
#define APP_setPortDirections(){ANSELA=ANSELB=0; TRISBbits.TRISB6=TRISBbits.TRISB7=0,TRISAbits.TRISA2=1;}
#endif
#define APP_writeLED1(state)   (LATBbits.LATB7=state)   // GREEN true is on
#define APP_writeLED2(state)   (LATBbits.LATB6=state)   // YELLOW true is on 
#define APP_pbPressed()        (!(PORTAbits.RA2))       // where the push button is connected. True when pressed


// enable this for additional validation checks
//#define SAFETY

// Module specific stuff here
#define DMA


#endif