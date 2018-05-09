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
# Source the common functions:                                                 #
#------------------------------------------------------------------------------#
. bf.sh

#------------------------------------------------------------------------------#
# Format the import files and call the import scripts:                         #
#------------------------------------------------------------------------------#
codeGenerator=$1
csv2xlsx=$2
configFile=$3
inputPath=$4
outputPath=$5
parent=$6

#------------------------------------------------------------------------------#
# Generate the code:                                                           #
#------------------------------------------------------------------------------#
python $codeGenerator -c $configFile -i $inputPath -o $outputPath -p $parent
if [ $? -ne 0 ]; then
    echo FAIL $?
else
    #--------------------------------------------------------------------------#
    # Format the import files and call the import scripts:                     #
    #--------------------------------------------------------------------------#
    unix2dos $outputPath/* >/dev/null 2>/dev/null
    chmod +x *.sh
    . b1.sh $outputPath
    . b2.sh $outputPath
    . b3.sh $outputPath
    . b4.sh $outputPath
    . b5.sh $outputPath
    . b6.sh $outputPath

    #--------------------------------------------------------------------------#
    # Convert the tag CSV files to XSLX format for manual import:              #
    #--------------------------------------------------------------------------#
    python $csv2xlsx -i $outputPath/gVar.awl
    python $csv2xlsx -i $outputPath/gTag.awl
    python $csv2xlsx -i $outputPath/gStateTimer.awl

    #--------------------------------------------------------------------------#
    # Make one giant file to rebuild the entire project:                       #
    #--------------------------------------------------------------------------#
    importFile="$outputPath/zp.awl"

    #--------------------------------------------------------------------------#
    # Create the file header:                                                  #
    #--------------------------------------------------------------------------#
    createHeader "Import entire project" $importFile

    #--------------------------------------------------------------------------#
    # Append the content AWL files to consolidate them into one giant import   #
    # file:                                                                    #
    #--------------------------------------------------------------------------#
    addFile $outputPath/z1.awl $importFile
    addFile $outputPath/z2.awl $importFile
    addFile $outputPath/z3.awl $importFile
    addFile $outputPath/z4.awl $importFile
    addFile $outputPath/z5.awl $importFile
    addFile $outputPath/z6.awl $importFile
fi
