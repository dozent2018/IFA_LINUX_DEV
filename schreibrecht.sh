#!/bin/bash     
# schreibrecht.sh : Demonstriert den Gebrauch der UND-Verknüpfung mit -a oder &&
#date           :20180828
#version        :1.0    
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

file=$1

if ! [ -e $file ]
    echo "$file existiert nicht"
    exit 1
fi

if [ -f $file ] && [ -w $file ]
then
   echo "Datei $file : normale Datei mit Schreibrecht"
   exit 0
fi

if [ -d $file ] && [ -w $file ]
then
   echo "Datei $file : Verzeichnis mit Schreibrecht"
   exit 0
fi

if [ -f $file ]
then
   echo "Datei $file : normale Datei"
   exit 2
fi

if [ -d $file ] 
then
   echo "Datei $file : Verzeichnis"
   exit 2
fi

