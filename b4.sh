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
importFile="$outputPath/z4.awl"

#------------------------------------------------------------------------------#
# Create the file header:                                                      #
#------------------------------------------------------------------------------#
createHeader "Import UN program objects" $importFile

#------------------------------------------------------------------------------#
# Append the Unit Operation SFCs to consolidate them into one import file:     #
#------------------------------------------------------------------------------#
addFile $inputPath/sfc/fbUO_MX_CIP.AWL $importFile
addFile $inputPath/sfc/fbUO_MX_FILL.AWL $importFile
addFile $inputPath/sfc/fbUO_MX_FILTER.AWL $importFile
addFile $inputPath/sfc/fbUO_MX_MAKE.AWL $importFile
addFile $inputPath/sfc/fbUO_MX_SETUP.AWL $importFile
addFile $inputPath/sfc/fbUO_MX_SIP.AWL $importFile
addFile $inputPath/sfc/fbUO_SY_CIP.AWL $importFile
addFile $inputPath/sfc/fbUO_SY_FILL.AWL $importFile
addFile $inputPath/sfc/fbUO_SY_FILTER.AWL $importFile
addFile $inputPath/sfc/fbUO_SY_SETUP.AWL $importFile
addFile $inputPath/sfc/fbUO_SY_SIP.AWL $importFile

#------------------------------------------------------------------------------#
# Append the Unit FB files:                                                    #
#------------------------------------------------------------------------------#
addFile $outputPath/fbMX.awl $importFile
addFile $outputPath/fbSY.awl $importFile

#------------------------------------------------------------------------------#
# Append the Unit Instance FB files:                                           #
#------------------------------------------------------------------------------#
addFile $outputPath/ifbMX.awl $importFile
addFile $outputPath/ifbSY.awl $importFile

#------------------------------------------------------------------------------#
# Append the instance DBs:                                                     #
#------------------------------------------------------------------------------#
addFile $outputPath/idbUNs.awl $importFile

#------------------------------------------------------------------------------#
# Append the calls from OB1:                                                   #
#------------------------------------------------------------------------------#
addFile $outputPath/fcCallUNs.awl $importFile
