#!/bin/bash     
# paramtest6.sh :Prüft in for-Schleife, wieviele  Parameter übergeben wurden und gibt diese aus
#author         :Jochen Reinholdt
#date           :20180618
#version        :1      
#usage          :./paramtest6 parameterliste
#notes          :Benutzt for-schleife und $@
#bash_version   :3.2.57(1)-release
#============================================================================

echo Anzahl Parameter: $#
zaehler=1

for param in $@
do
	echo Parameter$zaehler: $param
	let zaehler=$zaehler+1
done
