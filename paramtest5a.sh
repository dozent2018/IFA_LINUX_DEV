#!/bin/bash     
# paramtest5a.sh : Variante zu paramtest5.sh 
#date           :20180618
#version        :1.1
#notes          :Benutzt while-schleife und shift
#bash_version   :3.2.57(1)-release
#============================================================================

zaehler=0
anzahl=$#
echo "Anzahl Parameter: $anzahl"

# Achtung: shift verändert auch den Wert $#

while [ $zaehler -lt $anzahl ]
do
	let zaehler=$zaehler+1
	echo "Parameter $zaehler: $1"
	shift
done

