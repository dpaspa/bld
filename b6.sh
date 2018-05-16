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
importFile="$outputPath/z6.awl"

#------------------------------------------------------------------------------#
# Create the file header:                                                      #
#------------------------------------------------------------------------------#
createHeader "Import program management objects" $importFile

#------------------------------------------------------------------------------#
# Append the content AWL files to consolidate them into one import file:       #
#------------------------------------------------------------------------------#
addFile $outputPath/dbEVENTPrompt.awl $importFile
addFile $outputPath/dbEVENTLogMsg.awl $importFile
addFile $outputPath/dbEVENTLogReal.awl $importFile
addFile $outputPath/dbEVENTLogTime.awl $importFile
addFile $outputPath/fcEventProcess.awl $importFile
addFile $outputPath/fcEventSequence.awl $importFile
addFile $outputPath/ifcHMISFCControl.awl $importFile
addFile $outputPath/fbTimeSyncPLC.awl $importFile
addFile $outputPath/fcLEDState.awl $importFile
addFile $outputPath/fcTimeManagement.awl $importFile
addFile $outputPath/Main.awl $importFile
addFile $outputPath/Startup.awl $importFile
