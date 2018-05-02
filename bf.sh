#!/bin/sh
#------------------------------------------------------------------------------#
#            Copyright © 2018 Rickermann Engineering Operations                #
#------------------------------------------------------------------------------#
#                                                                              #
# Description:                                                                 #
# This file includes standard bash script build functions.                     #
#------------------------------------------------------------------------------#
# Revision history:                                                            #
# Rev By                Date        CC   Note                                  #
# 1   David Paspa       07-Apr-2018 NA   Initial design.                       #
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# Function createHeader                                                        #
#                                                                              #
# Description:                                                                 #
# Creates a header block in the specified file.                                #
#------------------------------------------------------------------------------#
# Calling parameters:                                                          #
#                                                                              #
# $1                    The file name to output to.                            #
# $2                    The file specific header description text.             #
#------------------------------------------------------------------------------#
createHeader() {
echo "//----------------------------------------------------------------------------//" > $2

#------------------------------------------------------------------------------#
# Append the rest of the header:                                               #
#------------------------------------------------------------------------------#
echo "//            Copyright 2018 Rieckermann Engineering Operations               //" >> $2
echo "//                Automatically Generated File - Do Not Edit                  //" >> $2
echo "//----------------------------------------------------------------------------//" >> $2
echo "// Description:                                                               //" >> $2
echo "// Automatically generated Step 7 import file.                                //" >> $2
echo "// "$1 >> $2
echo "//----------------------------------------------------------------------------//" >> $2
echo $'\r'$'\n' >> $2
}

#------------------------------------------------------------------------------#
# Function addFile                                                             #
#                                                                              #
# Description:                                                                 #
# Adds the specified file content to the import text file.                     #
#------------------------------------------------------------------------------#
# Calling parameters:                                                          #
#                                                                              #
# $1                    The file name to add to the import text file.          #
# $2                    The file name to output to.                            #
#------------------------------------------------------------------------------#
addFile() {
    #--------------------------------------------------------------------------#
    # Check if input filename parameter was not specified:                     #
    #--------------------------------------------------------------------------#
    if [ -z "$1" ]; then
        echo "No argument supplied for input file to ready from"

    #--------------------------------------------------------------------------#
    # Check if output filename parameter was not specified:                    #
    #--------------------------------------------------------------------------#
    elif [ -z "$2" ]; then
        echo "No argument supplied for output file to write to"

    #--------------------------------------------------------------------------#
    # Check if the specified file does not exist:                              #
    #--------------------------------------------------------------------------#
    elif [ ! -f $1 ]; then
        echo "Input file $1 does not exist!"
    else
        #----------------------------------------------------------------------#
        # Append the input file to the end of the output file:                 #
        #----------------------------------------------------------------------#
        cat $1 >> $2
        echo $'\r'$'\n' >> $2
    fi
}

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -c|--config)
    configBase="$2"
    shift # past argument
    shift # past value
    ;;
    -i|--input)
    inputPath="$2"
    shift # past argument
    shift # past value
    ;;
    -o|--output)
    outputPathRoot="$2"
    shift # past argument
    shift # past value
    ;;
    -p|--parent)
    parent="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters
