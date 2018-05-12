#!/bin/sh
#------------------------------------------------------------------------------#
#            Copyright © 2018 Rickermann Engineering Operations                #
#------------------------------------------------------------------------------#
#                                                                              #
# Description:                                                                 #
# This is the shell script to build the project AWL files to be loaded into    #
# the Step 7 configuration program.                                            #
#------------------------------------------------------------------------------#
# Revision history:                                                            #
# Rev By                Date        CC   Note                                  #
# 1   David Paspa       06-Apr-2018 NA   Initial design.                       #
#------------------------------------------------------------------------------#
# Source the common functions and set the import file name:                    #
#------------------------------------------------------------------------------#
. bf.sh
importFile="$outputPath/z3.awl"

#------------------------------------------------------------------------------#
# Create the file header:                                                      #
#------------------------------------------------------------------------------#
createHeader "Import EM program objects" $importFile

#------------------------------------------------------------------------------#
# Append the EM Phase files to consolidate them into the one import file:      #
#------------------------------------------------------------------------------#
addFile $inputPath/sfc/fbPH_EMA1_MIX.AWL $importFile
addFile $inputPath/sfc/fbPH_EMC2_CHARGE.AWL $importFile
addFile $inputPath/sfc/fbPH_EMC2_FLUSH.AWL $importFile
addFile $inputPath/sfc/fbPH_EMC2_ISOLATE.AWL $importFile
addFile $inputPath/sfc/fbPH_EMC2_SETUP.AWL $importFile
addFile $inputPath/sfc/fbPH_EMC3_FLUSH.AWL $importFile
addFile $inputPath/sfc/fbPH_EMC3_ISOLATE.AWL $importFile
addFile $inputPath/sfc/fbPH_EMC3_SETUP.AWL $importFile
addFile $inputPath/sfc/fbPH_EMM1_MEASURE.AWL $importFile
addFile $inputPath/sfc/fbPH_EMM1_TARE.AWL $importFile
addFile $inputPath/sfc/fbPH_EMT1_DRAIN.AWL $importFile
addFile $inputPath/sfc/fbPH_EMV2_PULSE.AWL $importFile
addFile $inputPath/sfc/fbPH_EMX1_SETUP_CIPSIP.AWL $importFile
addFile $inputPath/sfc/fbPH_EMX1_SETUP_FILTER.AWL $importFile
addFile $inputPath/sfc/fbPH_EMX2_ISOLATE.AWL $importFile
addFile $inputPath/sfc/fbPH_EMX2_SETUP.AWL $importFile
addFile $inputPath/sfc/fbPH_EMX4_SIP_PULSE.AWL $importFile
addFile $inputPath/sfc/fbPH_EMX6_FILTER_BLEED.AWL $importFile
addFile $inputPath/sfc/fbPH_EMX6_SETUP_CIP.AWL $importFile
addFile $inputPath/sfc/fbPH_EMX6_SETUP_SIP.AWL $importFile

#------------------------------------------------------------------------------#
# Append the EM AWL files to consolidate them into the one import file:        #
#------------------------------------------------------------------------------#
addFile $outputPath/fbEMA1.awl $importFile
addFile $outputPath/fbEMC1.awl $importFile
addFile $outputPath/fbEMC2.awl $importFile
addFile $outputPath/fbEMC3.awl $importFile
addFile $outputPath/fbEMG1.awl $importFile
addFile $outputPath/fbEMM1.awl $importFile
addFile $outputPath/fbEMS1.awl $importFile
addFile $outputPath/fbEMS2.awl $importFile
addFile $outputPath/fbEMT1.awl $importFile
addFile $outputPath/fbEMV1.awl $importFile
addFile $outputPath/fbEMV2.awl $importFile
addFile $outputPath/fbEMX1.awl $importFile
addFile $outputPath/fbEMX2.awl $importFile
addFile $outputPath/fbEMX4.awl $importFile
addFile $outputPath/fbEMX5.awl $importFile
addFile $outputPath/fbEMX6.awl $importFile

#------------------------------------------------------------------------------#
# Append the EM Instance FB files:                                             #
#------------------------------------------------------------------------------#
addFile $outputPath/ifbEMA1.awl $importFile
addFile $outputPath/ifbEMC1.awl $importFile
addFile $outputPath/ifbEMC2.awl $importFile
addFile $outputPath/ifbEMC3.awl $importFile
addFile $outputPath/ifbEMG1.awl $importFile
addFile $outputPath/ifbEMM1.awl $importFile
addFile $outputPath/ifbEMS1.awl $importFile
addFile $outputPath/ifbEMS2.awl $importFile
addFile $outputPath/ifbEMT1.awl $importFile
addFile $outputPath/ifbEMV1.awl $importFile
addFile $outputPath/ifbEMV2.awl $importFile
addFile $outputPath/ifbEMX1.awl $importFile
addFile $outputPath/ifbEMX2.awl $importFile
addFile $outputPath/ifbEMX4.awl $importFile
addFile $outputPath/ifbEMX5.awl $importFile
addFile $outputPath/ifbEMX6.awl $importFile

#------------------------------------------------------------------------------#
# Append the instance DBs:                                                     #
#------------------------------------------------------------------------------#
addFile $outputPath/idbEMs.awl $importFile

#------------------------------------------------------------------------------#
# Append the calls from OB1:                                                   #
#------------------------------------------------------------------------------#
addFile $outputPath/fcCallEMs.awl $importFile
