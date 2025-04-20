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
#include "canargb_nvs.h"
#include "nv.h"

typedef struct {uint8_t red,green,blue;} Colour;

static const Colour defaultColours [16] = {
    {0x00,0x00,0x00},    // 0 black
    {0x3f,0x3f,0x3f},    // 1 dark grey
    {0x7f,0x00,0x00},    // 2 dark red
    {0x00,0x7f,0x00},    // 3 dark green
    {0x00,0x00,0x7f},    // 4 dark blue
    {0xFA,0x7F,0x00},    // 5 orange
    {0x9c,0x00,0x9c},    // 6 dark magenta
    {0x00,0x9c,0x9c},    // 7 dark cyan
    {0x7f,0x7f,0x7f},    // 8 grey
    {0xff,0x00,0x00},    // 9 red
    {0x00,0xff,0x00},    // 10 green
    {0x00,0x00,0xff},    // 11 blue
    {0xff,0xff,0x00},    // 12 yellow
    {0xff,0x00,0xff},    // 13 magenta
    {0x00,0xff,0xff},    // 14 cyan
    {0xFF,0xFF,0xFF}     // 15 white
};

        
/**
 * The Application specific NV defaults are defined here. 1 .. NUM_NV
 */
uint8_t APP_nvDefault(uint8_t index) {
    index--;
    if (index < NV_NUM) {
        switch (index%3) {
            case 0:
                return defaultColours[index/3].red;
            case 1:
                return defaultColours[index/3].green;
            case 2:
                return defaultColours[index/3].blue;
        }
    }
    return 0;
}

/**
 * We validate NV values here.
 * All values are valid.
 */
NvValidation APP_nvValidate(uint8_t index, uint8_t value)  {
    return VALID;
}

/**
 * We perform the necessary action when an NV changes value.
 * No need to do anything.
 */
void APP_nvValueChanged(uint8_t index, uint8_t value, uint8_t oldValue) {
}