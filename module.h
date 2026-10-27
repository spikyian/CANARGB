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
// The data version stored at VERSION_ADDRESS
#define APP_NVM_VERSION 1
#define NUM_SERVICES 6

// Interrupts vector
#if defined(_18FXXQ83_FAMILY_)
#define IVT_BASE      0x900
#define IVT_BASE_U    0x00
#define IVT_BASE_H    0x09
#define IVT_BASE_L    0x00
#endif

// NVM
// Ensure that supply has stabilised at power up
#define VLCB_VDD_GUARD  0x0B
// Check that supply is stable before doing a write
#define VLCB_VDD_WRITE_GUARD

//
// NV service
//
#define NV_ADDRESS      0x200
#define NV_NVM_TYPE     EEPROM_NVM_TYPE
#define NV_CACHE

// NVM
// Buffer EEPROM write to be done asynchronously
//define ASYNC_EEPROM BUFFER
// Store the Buffer the NVs at 0x200
//#define EEPROM_BASE_ADDRESS NV_ADDRESS
//#define NUMBER_EEPROM (PARAM_NUM_NV+1)

//
// CAN service
//
#define CANID_ADDRESS  0x3FE    // 1 byte
#define CANID_NVM_TYPE EEPROM_NVM_TYPE
#define CAN_INTERRUPT_PRIORITY 0    // all low priority
#define CAN_CLOCK_MHz   64
// Number of buffers
#define CAN_NUM_RXBUFFERS   8
// After a factory reset (CANID 0) enumerate before the first transmission instead
// of transmitting straight away as CANID 1, and never send a frame as CANID 0.
#define CAN_ADDITIONAL_CANID_CHECKS
// more checks waiting for TX queue to drain
#define STRINGENT_TX_DRAIN_QUEUE_DRAIN

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
#define EV_FILL             0
#define NO_ACTION           0
#define EVENT_HASH_TABLE
#define EVENT_HASH_LENGTH   32
#define EVENT_CHAIN_LENGTH  20
// Padding is needed since previous release had 252 EVs whereas this release has 248 EVs.
// To maintain the same addresses in the event table we need to pad with 4 bytes.
#define EVENTTABLE_PADDING  4

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
#define PARAM_BUILD_VERSION     5
// Module name - must be 7 characters
#define NAME    "ARGB   "

#define PARAM_NUM_NV            49
#define PARAM_NUM_EVENTS        255
#define PARAM_NUM_EV_EVENT      248

// LEDs and PB                                 // GREEN is 0 YELLOW is 1
#if defined(_18F66K80_FAMILY_)
#define APP_setPortDirections(){ANCON0=ANCON1=0; TRISBbits.TRISB6=TRISBbits.TRISB7=0,TRISAbits.TRISA2=1;}
#endif
#if defined(_18FXXQ83_FAMILY_)
#define APP_setPortDirections(){ANSELA=ANSELB=0; TRISBbits.TRISB6=TRISBbits.TRISB7=0,TRISAbits.TRISA2=1;}
#endif
// Written as if/else so that the compiler emits a single BSF/BCF. A multi-instruction
// read-modify-write of LATB could be interrupted by the LED matrix interrupt, which
// drives the row anodes on LATB4/5, and undo its change.
#define APP_writeLED1(state)   do{ if (state) LATBbits.LATB7 = 1; else LATBbits.LATB7 = 0; }while(0)   // GREEN true is on
#define APP_writeLED2(state)   do{ if (state) LATBbits.LATB6 = 1; else LATBbits.LATB6 = 0; }while(0)   // YELLOW true is on 
#define APP_pbPressed()        (!(PORTAbits.RA2))       // where the push button is connected. True when pressed


// enable this for additional validation checks
//#define SAFETY

// Module specific stuff here
#define DMA


#endif