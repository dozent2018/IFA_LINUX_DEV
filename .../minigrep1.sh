#!/bin/bash     
# minigrep1.sh : Sucht ein einfaches Muster in einer Textdatei
#date           :20180719
#version        :1.0    
#usage          :./minigrep
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================
muster=$1
datei=$2

while read zeile 
do
    if [[ $zeile == *"$muster"* ]]
		then
  		echo $zeile
    fi
done < $datei
