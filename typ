#!/bin/bash     
#title          :and_demo
#description    :Demonstriert den gebrauch der UND-Verknüpfung mit -a oder &&
#author         :Jochen Reinholdt
#date           :20180828
#version        :1.0    
#usage          :./and_demo
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

file=$1

if [ -e $datei ]
then
    echo $datei existiert
else
    echo $datei existiert nicht
    exit 1
fi

if [ -f $file ]
then
   echo "$file : normale Datei"
elif [ -d $file ] 
then
   echo "$file : Verzeichnis"
else
   echo "$file : weder normale Datei noch Verzeichnis"
fi
exit 0
