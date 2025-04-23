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

#include "nv.h"

// The possible NVs
// Colour pallette
#define NV_COLOUR_0_R           1
#define NV_COLOUR_0_G           2
#define NV_COLOUR_0_B           3
#define NV_COLOUR_1_R           4
#define NV_COLOUR_1_G           5
#define NV_COLOUR_1_B           6
#define NV_COLOUR_2_R           7
#define NV_COLOUR_2_G           8
#define NV_COLOUR_2_B           9
#define NV_COLOUR_3_R           10
#define NV_COLOUR_3_G           11
#define NV_COLOUR_3_B           12
#define NV_COLOUR_4_R           13
#define NV_COLOUR_4_G           14
#define NV_COLOUR_4_B           15
#define NV_COLOUR_5_R           16
#define NV_COLOUR_5_G           17
#define NV_COLOUR_5_B           18
#define NV_COLOUR_6_R           19
#define NV_COLOUR_6_G           20
#define NV_COLOUR_6_B           21
#define NV_COLOUR_7_R           22
#define NV_COLOUR_7_G           23
#define NV_COLOUR_7_B           24
#define NV_COLOUR_8_R           25
#define NV_COLOUR_8_G           26
#define NV_COLOUR_8_B           27
#define NV_COLOUR_9_R           28
#define NV_COLOUR_9_G           29
#define NV_COLOUR_9_B           30
#define NV_COLOUR_10_R          31
#define NV_COLOUR_10_G          32
#define NV_COLOUR_10_B          33
#define NV_COLOUR_11_R          34
#define NV_COLOUR_11_G          35
#define NV_COLOUR_11_B          36
#define NV_COLOUR_12_R          37
#define NV_COLOUR_12_G          38
#define NV_COLOUR_12_B          39
#define NV_COLOUR_13_R          40
#define NV_COLOUR_13_G          41
#define NV_COLOUR_13_B          42
#define NV_COLOUR_14_R          43
#define NV_COLOUR_14_G          44
#define NV_COLOUR_14_B          45
#define NV_COLOUR_15_R          46
#define NV_COLOUR_15_G          47
#define NV_COLOUR_15_B          48
#define NV_COLOUR_ORDER         49

#define RED(c)          ((uint8_t)getNV((c)*3 + 1))
#define GREEN(c)        ((uint8_t)getNV((c)*3 + 2))
#define BLUE(c)         ((uint8_t)getNV((c)*3 + 3))

#define ORDER_RGB   1
#define ORDER_RBG   2
#define ORDER_GRB   3
#define ORDER_GBR   4
#define ORDER_BGR   5
#define ORDER_BRG   6

