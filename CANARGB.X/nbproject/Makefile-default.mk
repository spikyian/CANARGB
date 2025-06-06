#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../main.c ../canargb_events.c ../canargb_leds.c ../canargb_nvs.c ../../VLCBlib_PIC/boot.c ../../VLCBlib_PIC/can18_can_2.c ../../VLCBlib_PIC/event_consumer_simple.c ../../VLCBlib_PIC/event_teach_simple.c ../../VLCBlib_PIC/messageQueue.c ../../VLCBlib_PIC/mns.c ../../VLCBlib_PIC/nv.c ../../VLCBlib_PIC/nvm.c ../../VLCBlib_PIC/statusLeds2.c ../../VLCBlib_PIC/ticktime.c ../../VLCBlib_PIC/timedResponse.c ../../VLCBlib_PIC/vlcb.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/main.p1 ${OBJECTDIR}/_ext/1472/canargb_events.p1 ${OBJECTDIR}/_ext/1472/canargb_leds.p1 ${OBJECTDIR}/_ext/1472/canargb_nvs.p1 ${OBJECTDIR}/_ext/1954642981/boot.p1 ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1 ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1 ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1 ${OBJECTDIR}/_ext/1954642981/messageQueue.p1 ${OBJECTDIR}/_ext/1954642981/mns.p1 ${OBJECTDIR}/_ext/1954642981/nv.p1 ${OBJECTDIR}/_ext/1954642981/nvm.p1 ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1 ${OBJECTDIR}/_ext/1954642981/ticktime.p1 ${OBJECTDIR}/_ext/1954642981/timedResponse.p1 ${OBJECTDIR}/_ext/1954642981/vlcb.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/main.p1.d ${OBJECTDIR}/_ext/1472/canargb_events.p1.d ${OBJECTDIR}/_ext/1472/canargb_leds.p1.d ${OBJECTDIR}/_ext/1472/canargb_nvs.p1.d ${OBJECTDIR}/_ext/1954642981/boot.p1.d ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1.d ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1.d ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1.d ${OBJECTDIR}/_ext/1954642981/messageQueue.p1.d ${OBJECTDIR}/_ext/1954642981/mns.p1.d ${OBJECTDIR}/_ext/1954642981/nv.p1.d ${OBJECTDIR}/_ext/1954642981/nvm.p1.d ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1.d ${OBJECTDIR}/_ext/1954642981/ticktime.p1.d ${OBJECTDIR}/_ext/1954642981/timedResponse.p1.d ${OBJECTDIR}/_ext/1954642981/vlcb.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/main.p1 ${OBJECTDIR}/_ext/1472/canargb_events.p1 ${OBJECTDIR}/_ext/1472/canargb_leds.p1 ${OBJECTDIR}/_ext/1472/canargb_nvs.p1 ${OBJECTDIR}/_ext/1954642981/boot.p1 ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1 ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1 ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1 ${OBJECTDIR}/_ext/1954642981/messageQueue.p1 ${OBJECTDIR}/_ext/1954642981/mns.p1 ${OBJECTDIR}/_ext/1954642981/nv.p1 ${OBJECTDIR}/_ext/1954642981/nvm.p1 ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1 ${OBJECTDIR}/_ext/1954642981/ticktime.p1 ${OBJECTDIR}/_ext/1954642981/timedResponse.p1 ${OBJECTDIR}/_ext/1954642981/vlcb.p1

# Source Files
SOURCEFILES=../main.c ../canargb_events.c ../canargb_leds.c ../canargb_nvs.c ../../VLCBlib_PIC/boot.c ../../VLCBlib_PIC/can18_can_2.c ../../VLCBlib_PIC/event_consumer_simple.c ../../VLCBlib_PIC/event_teach_simple.c ../../VLCBlib_PIC/messageQueue.c ../../VLCBlib_PIC/mns.c ../../VLCBlib_PIC/nv.c ../../VLCBlib_PIC/nvm.c ../../VLCBlib_PIC/statusLeds2.c ../../VLCBlib_PIC/ticktime.c ../../VLCBlib_PIC/timedResponse.c ../../VLCBlib_PIC/vlcb.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F27Q83
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/main.p1: ../main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1472/main.p1 ../main.c 
	@-${MV} ${OBJECTDIR}/_ext/1472/main.d ${OBJECTDIR}/_ext/1472/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1472/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/canargb_events.p1: ../canargb_events.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1472/canargb_events.p1 ../canargb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/1472/canargb_events.d ${OBJECTDIR}/_ext/1472/canargb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1472/canargb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/canargb_leds.p1: ../canargb_leds.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_leds.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1472/canargb_leds.p1 ../canargb_leds.c 
	@-${MV} ${OBJECTDIR}/_ext/1472/canargb_leds.d ${OBJECTDIR}/_ext/1472/canargb_leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1472/canargb_leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/canargb_nvs.p1: ../canargb_nvs.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_nvs.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_nvs.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1472/canargb_nvs.p1 ../canargb_nvs.c 
	@-${MV} ${OBJECTDIR}/_ext/1472/canargb_nvs.d ${OBJECTDIR}/_ext/1472/canargb_nvs.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1472/canargb_nvs.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/boot.p1: ../../VLCBlib_PIC/boot.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/boot.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/boot.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/boot.p1 ../../VLCBlib_PIC/boot.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/boot.d ${OBJECTDIR}/_ext/1954642981/boot.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/boot.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/can18_can_2.p1: ../../VLCBlib_PIC/can18_can_2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1 ../../VLCBlib_PIC/can18_can_2.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/can18_can_2.d ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1: ../../VLCBlib_PIC/event_consumer_simple.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1 ../../VLCBlib_PIC/event_consumer_simple.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.d ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1: ../../VLCBlib_PIC/event_teach_simple.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1 ../../VLCBlib_PIC/event_teach_simple.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/event_teach_simple.d ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/messageQueue.p1: ../../VLCBlib_PIC/messageQueue.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/messageQueue.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/messageQueue.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/messageQueue.p1 ../../VLCBlib_PIC/messageQueue.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/messageQueue.d ${OBJECTDIR}/_ext/1954642981/messageQueue.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/messageQueue.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/mns.p1: ../../VLCBlib_PIC/mns.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/mns.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/mns.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/mns.p1 ../../VLCBlib_PIC/mns.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/mns.d ${OBJECTDIR}/_ext/1954642981/mns.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/mns.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/nv.p1: ../../VLCBlib_PIC/nv.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/nv.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/nv.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/nv.p1 ../../VLCBlib_PIC/nv.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/nv.d ${OBJECTDIR}/_ext/1954642981/nv.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/nv.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/nvm.p1: ../../VLCBlib_PIC/nvm.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/nvm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/nvm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/nvm.p1 ../../VLCBlib_PIC/nvm.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/nvm.d ${OBJECTDIR}/_ext/1954642981/nvm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/nvm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/statusLeds2.p1: ../../VLCBlib_PIC/statusLeds2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1 ../../VLCBlib_PIC/statusLeds2.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/statusLeds2.d ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/ticktime.p1: ../../VLCBlib_PIC/ticktime.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/ticktime.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/ticktime.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/ticktime.p1 ../../VLCBlib_PIC/ticktime.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/ticktime.d ${OBJECTDIR}/_ext/1954642981/ticktime.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/ticktime.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/timedResponse.p1: ../../VLCBlib_PIC/timedResponse.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/timedResponse.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/timedResponse.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/timedResponse.p1 ../../VLCBlib_PIC/timedResponse.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/timedResponse.d ${OBJECTDIR}/_ext/1954642981/timedResponse.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/timedResponse.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/vlcb.p1: ../../VLCBlib_PIC/vlcb.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/vlcb.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/vlcb.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=pickit5   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/vlcb.p1 ../../VLCBlib_PIC/vlcb.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/vlcb.d ${OBJECTDIR}/_ext/1954642981/vlcb.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/vlcb.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1472/main.p1: ../main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1472/main.p1 ../main.c 
	@-${MV} ${OBJECTDIR}/_ext/1472/main.d ${OBJECTDIR}/_ext/1472/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1472/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/canargb_events.p1: ../canargb_events.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1472/canargb_events.p1 ../canargb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/1472/canargb_events.d ${OBJECTDIR}/_ext/1472/canargb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1472/canargb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/canargb_leds.p1: ../canargb_leds.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_leds.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1472/canargb_leds.p1 ../canargb_leds.c 
	@-${MV} ${OBJECTDIR}/_ext/1472/canargb_leds.d ${OBJECTDIR}/_ext/1472/canargb_leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1472/canargb_leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/canargb_nvs.p1: ../canargb_nvs.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_nvs.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1472/canargb_nvs.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1472/canargb_nvs.p1 ../canargb_nvs.c 
	@-${MV} ${OBJECTDIR}/_ext/1472/canargb_nvs.d ${OBJECTDIR}/_ext/1472/canargb_nvs.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1472/canargb_nvs.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/boot.p1: ../../VLCBlib_PIC/boot.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/boot.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/boot.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/boot.p1 ../../VLCBlib_PIC/boot.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/boot.d ${OBJECTDIR}/_ext/1954642981/boot.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/boot.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/can18_can_2.p1: ../../VLCBlib_PIC/can18_can_2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1 ../../VLCBlib_PIC/can18_can_2.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/can18_can_2.d ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/can18_can_2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1: ../../VLCBlib_PIC/event_consumer_simple.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1 ../../VLCBlib_PIC/event_consumer_simple.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.d ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/event_consumer_simple.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1: ../../VLCBlib_PIC/event_teach_simple.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1 ../../VLCBlib_PIC/event_teach_simple.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/event_teach_simple.d ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/event_teach_simple.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/messageQueue.p1: ../../VLCBlib_PIC/messageQueue.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/messageQueue.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/messageQueue.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/messageQueue.p1 ../../VLCBlib_PIC/messageQueue.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/messageQueue.d ${OBJECTDIR}/_ext/1954642981/messageQueue.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/messageQueue.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/mns.p1: ../../VLCBlib_PIC/mns.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/mns.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/mns.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/mns.p1 ../../VLCBlib_PIC/mns.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/mns.d ${OBJECTDIR}/_ext/1954642981/mns.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/mns.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/nv.p1: ../../VLCBlib_PIC/nv.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/nv.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/nv.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/nv.p1 ../../VLCBlib_PIC/nv.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/nv.d ${OBJECTDIR}/_ext/1954642981/nv.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/nv.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/nvm.p1: ../../VLCBlib_PIC/nvm.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/nvm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/nvm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/nvm.p1 ../../VLCBlib_PIC/nvm.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/nvm.d ${OBJECTDIR}/_ext/1954642981/nvm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/nvm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/statusLeds2.p1: ../../VLCBlib_PIC/statusLeds2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1 ../../VLCBlib_PIC/statusLeds2.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/statusLeds2.d ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/statusLeds2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/ticktime.p1: ../../VLCBlib_PIC/ticktime.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/ticktime.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/ticktime.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/ticktime.p1 ../../VLCBlib_PIC/ticktime.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/ticktime.d ${OBJECTDIR}/_ext/1954642981/ticktime.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/ticktime.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/timedResponse.p1: ../../VLCBlib_PIC/timedResponse.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/timedResponse.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/timedResponse.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/timedResponse.p1 ../../VLCBlib_PIC/timedResponse.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/timedResponse.d ${OBJECTDIR}/_ext/1954642981/timedResponse.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/timedResponse.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1954642981/vlcb.p1: ../../VLCBlib_PIC/vlcb.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1954642981" 
	@${RM} ${OBJECTDIR}/_ext/1954642981/vlcb.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1954642981/vlcb.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1954642981/vlcb.p1 ../../VLCBlib_PIC/vlcb.c 
	@-${MV} ${OBJECTDIR}/_ext/1954642981/vlcb.d ${OBJECTDIR}/_ext/1954642981/vlcb.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1954642981/vlcb.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=pickit5  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto --CODEOFFSET=0x800        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../../../MPLABworkspace/CBUS_PIC_Bootloader.X/dist/PIC18F27Q83_canmio/production/CBUS_PIC_Bootloader.X.production.hex
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -mrom=0800-FFFF -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../" -I"../../VLCB-defs" -I"../../VLCBlib_PIC" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto --CODEOFFSET=0x800     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	
	@echo "Creating unified hex file"
	@"C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/CANARGB.X.${IMAGE_TYPE}.hex ../../../MPLABworkspace/CBUS_PIC_Bootloader.X/dist/PIC18F27Q83_canmio/production/CBUS_PIC_Bootloader.X.production.hex -odist/${CND_CONF}/production/CANARGB.X.production.unified.hex

endif


# Subprojects
.build-subprojects:
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
	cd ../../../MPLABworkspace/CBUS_PIC_Bootloader.X && ${MAKE}  -f Makefile CONF=PIC18F27Q83_canmio TYPE_IMAGE=DEBUG_RUN
else
	cd ../../../MPLABworkspace/CBUS_PIC_Bootloader.X && ${MAKE}  -f Makefile CONF=PIC18F27Q83_canmio
endif


# Subprojects
.clean-subprojects:
	cd ../../../MPLABworkspace/CBUS_PIC_Bootloader.X && rm -rf "build/PIC18F27Q83_canmio" "dist/PIC18F27Q83_canmio"

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
