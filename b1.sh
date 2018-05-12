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
importFile="$outputPath/z1.awl"

#------------------------------------------------------------------------------#
# Create the file header:                                                      #
#------------------------------------------------------------------------------#
createHeader "Import base program objects" $importFile

#------------------------------------------------------------------------------#
# Append the AWL files to consolidate them into one import file:               #
#------------------------------------------------------------------------------#
addFile $outputPath/udtMaster.awl $importFile
addFile $outputPath/dbMaster.awl $importFile
addFile $outputPath/dbCONST.awl $importFile
addFile $outputPath/dbEVENTProcess.awl $importFile
addFile $outputPath/dbEVENTSequence.awl $importFile
addFile $outputPath/fcAnalog.awl $importFile
addFile $outputPath/fcHygiene.awl $importFile
addFile $outputPath/fcModeCmd.awl $importFile
addFile $outputPath/fcModeCmdBLK.awl $importFile
addFile $outputPath/fcSFCCommand.awl $importFile
addFile $outputPath/fcSFCMode.awl $importFile
addFile $outputPath/fbRunTimer.awl $importFile
addFile $outputPath/fcHMS2Time.awl $importFile
addFile $outputPath/fcTime2HMS.awl $importFile
addFile $outputPath/fcHMISFCSelect.awl $importFile
