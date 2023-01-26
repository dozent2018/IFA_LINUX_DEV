#!/bin/bash     
# functest3.sh : Demo Funktion mit Rückgabewert
#date           :20180820
#version        :1.0    
#notes          : Rückgabe eines ganzzahligen Werts mit return statt exit      
#bash_version   :3.2.57(1)-release
#============================================================================

file_exists() {
    if test -e  $1
    then
	    return 0
    fi
	return 1
}

file_exists $1
echo Rückgabewert von file_exists: $?

