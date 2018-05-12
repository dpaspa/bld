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
importFile="$outputPath/z5.awl"

#------------------------------------------------------------------------------#
# Create the file header:                                                      #
#------------------------------------------------------------------------------#
createHeader "Import PC program objects" $importFile

#------------------------------------------------------------------------------#
# Append the Process Cell Recipe SFCs to consolidate them into one file:       #
#------------------------------------------------------------------------------#
addFile $inputPath/sfc/fbRP_PCMX_CIPSIP.AWL $importFile
addFile $inputPath/sfc/fbRP_PCMX_FILL.AWL $importFile
addFile $inputPath/sfc/fbRP_PCMX_FILTER.AWL $importFile
addFile $inputPath/sfc/fbRP_PCMX_MAKE.AWL $importFile
addFile $inputPath/sfc/fbRP_PCSY_CIPSIP.AWL $importFile
addFile $inputPath/sfc/fbRP_PCSY_FILL.AWL $importFile

#------------------------------------------------------------------------------#
# Append the Process Cell FB files:                                            #
#------------------------------------------------------------------------------#
addFile $outputPath/fbPCMX.awl $importFile
addFile $outputPath/fbPCSY.awl $importFile

#------------------------------------------------------------------------------#
# Append the Process Cell Instance FB files:                                   #
#------------------------------------------------------------------------------#
addFile $outputPath/ifbPCMX.awl $importFile
addFile $outputPath/ifbPCSY.awl $importFile

#------------------------------------------------------------------------------#
# Append the instance DBs:                                                     #
#------------------------------------------------------------------------------#
addFile $outputPath/idbPCs.awl $importFile

#------------------------------------------------------------------------------#
# Append the calls from OB1:                                                   #
#------------------------------------------------------------------------------#
addFile $outputPath/fcCallPCs.awl $importFile
