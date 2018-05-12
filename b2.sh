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
importFile="$outputPath/z2.awl"

#------------------------------------------------------------------------------#
# Create the file header:                                                      #
#------------------------------------------------------------------------------#
createHeader "Import CM program objects" $importFile

#------------------------------------------------------------------------------#
# Append the CM FB files to consolidate them into the one import file:         #
#------------------------------------------------------------------------------#
# addFile $outputPath/fbIL.awl $importFile
addFile $outputPath/fbAL1.awl $importFile
addFile $outputPath/fbDI1.awl $importFile
addFile $outputPath/fbDI2.awl $importFile
addFile $outputPath/fbHE1.awl $importFile
addFile $outputPath/fbMOD1.awl $importFile
addFile $outputPath/fbMOT1.awl $importFile
addFile $outputPath/fbPC1.awl $importFile
addFile $outputPath/fbPOSx.awl $importFile
addFile $outputPath/fbSIC1.awl $importFile
addFile $outputPath/fbTC1.awl $importFile
addFile $outputPath/fbVS1.awl $importFile
addFile $outputPath/fbZSC1.awl $importFile
addFile $outputPath/fbZSC2.awl $importFile

#------------------------------------------------------------------------------#
# Append the CM Instance FB files. The order matters. Dependent tags must be   #
# created first:                                                               #
#------------------------------------------------------------------------------#
addFile $outputPath/ifbCRIL.awl $importFile
addFile $outputPath/ifbNCRIL.awl $importFile
addFile $outputPath/ifbDI1.awl $importFile
addFile $outputPath/ifbDI2.awl $importFile
addFile $outputPath/ifbHE1.awl $importFile
addFile $outputPath/ifbMI1.awl $importFile
addFile $outputPath/ifbMOD1.awl $importFile
addFile $outputPath/ifbMOT1.awl $importFile
addFile $outputPath/ifbPI1.awl $importFile
addFile $outputPath/ifbPOS1.awl $importFile
addFile $outputPath/ifbPOS2.awl $importFile
addFile $outputPath/ifbPOS4.awl $importFile
addFile $outputPath/ifbPC1.awl $importFile
addFile $outputPath/ifbSIC1.awl $importFile
addFile $outputPath/ifbTI1.awl $importFile
addFile $outputPath/ifbTI2.awl $importFile
addFile $outputPath/ifbTC1.awl $importFile
addFile $outputPath/ifbVS1.awl $importFile
addFile $outputPath/ifbZSC1.awl $importFile
addFile $outputPath/ifbZSC2.awl $importFile

#------------------------------------------------------------------------------#
# Append the CM and interlock instance DBs:                                    #
#------------------------------------------------------------------------------#
addFile $outputPath/idbCMs.awl $importFile
addFile $outputPath/idbIL.awl $importFile

#------------------------------------------------------------------------------#
# Append the CM calls from the Main OB:                                        #
#------------------------------------------------------------------------------#
addFile $outputPath/fcCallCMs.awl $importFile
