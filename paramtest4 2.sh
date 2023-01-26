#!/bin/bash     
# paramtest4.sh : Prüft, ob zwei Parameter übergeben wurden
#date           :20180618
#version        :1      
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================


if [ $# -ne 2 ]
then
	echo Benutzung: $0 Parameter1 Parameter2
    exit 1
else
	echo $1 $2
    exit 0
fi
