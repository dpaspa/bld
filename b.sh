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
# Make one giant file to rebuild the entire project:                           #
#------------------------------------------------------------------------------#
codeGenerator="/home/dpaspa/MEGA/Business/complianceSHORTCUTS/py/cg.py"
csv2xlsx="/home/dpaspa/MEGA/Business/complianceSHORTCUTS/py/csv2xlsx.py"
ilGenerator="/home/dpaspa/MEGA/Business/complianceSHORTCUTS/py/il.py"

#------------------------------------------------------------------------------#
# Format the import files and call the import scripts:                         #
#------------------------------------------------------------------------------#
echo $configBase
echo $inputPath
echo $outputPathRoot

#------------------------------------------------------------------------------#
# Update the output directory SFCs:                                            #
#------------------------------------------------------------------------------#
#cp -R $inputPath/sfc/. $outputPathRoot/sfc

#------------------------------------------------------------------------------#
# Copy the input configuration file to a DB version so as not to lose the      #
# original file integrity:                                                     #
#------------------------------------------------------------------------------#
DIR=$(dirname "${configBase}")
configFile="${DIR}/configdb.xlsx"
echo $configFile
cp "$configBase" "$configFile"

#------------------------------------------------------------------------------#
# Generate the interlocks in the configuration worksheet:                      #
#------------------------------------------------------------------------------#
if [ $parent = CPU1 ]
then
python $ilGenerator -c $configFile -s tblSafetyV -d y -a 1 -l M -n 1 -p $parent
python $ilGenerator -c $configFile -s tblSafetyV -d n -a 3 -l S -n 1 -p $parent
python $ilGenerator -c $configFile -s tblSafetyMX -d n -a 1 -l M -n 1 -p $parent
python $ilGenerator -c $configFile -s tblSafetyM1 -d n -a 1 -l M -n 1 -p $parent
python $ilGenerator -c $configFile -s tblSafetySY -d n -a 3 -l S -n 1 -p $parent
python $ilGenerator -c $configFile -s tblSafetyS1 -d n -a 3 -l S -n 1 -p $parent
fi

if [ $parent = CPU2 ]
then
python $ilGenerator -c $configFile -s tblSafetyV -d y -a 2 -l M -n 2 -p $parent
python $ilGenerator -c $configFile -s tblSafetyV -d n -a 4 -l S -n 2 -p $parent
python $ilGenerator -c $configFile -s tblSafetyMX -d n -a 2 -l M -n 2 -p $parent
python $ilGenerator -c $configFile -s tblSafetyM2 -d n -a 2 -l M -n 2 -p $parent
python $ilGenerator -c $configFile -s tblSafetySY -d n -a 4 -l S -n 2 -p $parent
fi

#------------------------------------------------------------------------------#
# Generate files for the specified tree heirarchy parent:                      #
#------------------------------------------------------------------------------#
. bl.sh $codeGenerator $csv2xlsx $configFile $inputPath $outputPathRoot/$parent $parent
