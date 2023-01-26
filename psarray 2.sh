#!/bin/bash     
# psarray.sh    : Speicherung der Ausgabe von ps in einem Array
#date           :20180720
#version        :1.0    
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================
line=0
zeilen=()
ps -f --no-header | while read zeile
do
	zeilen[]=$zeile
	let line=line+1
done

echo $line Zeilen gelesen

for (i=0; i<$zeilen; i++)
do
	echo zeilen[i]
done
 
echo $i Zeilen ausgegeben
