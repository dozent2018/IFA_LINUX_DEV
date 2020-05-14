#!/bin/bash     
# dreieck.sh : Gibt in zwei for-schleifen ein Dreieck ausSternen aus
#	 	        :Die Seitenlänge ist in Parameter1 angegeben
#date           :20180619
#version        :1      
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

# Schleife über die Zeilen
for (( zeile=1; zeile<=$1; zeile++ ))
do
    # Schleife über die Spalten einer Zeile 
	for (( spalte=1; spalte <= $zeile; spalte++ ))
	do
        # Ein Stern zur Zeit wird ausgegeben
		echo -n \*
	done
	echo
done
