#!/bin/bash     
# paramtest5.sh : Prüft, wieviele  Parameter übergeben wurden und gibt diese aus
#date           :20180618
#version        :1.1
#notes          :Benutzt while-schleife und shift
#bash_version   :3.2.57(1)-release
#============================================================================

zaehler=0
echo "Anzahl Parameter: $#"

# Achtung: shift verändert auch den Wert $#

while [ $# -gt 0 ]
do
	let zaehler=$zaehler+1
	echo "Parameter $zaehler: $1"
	shift
done

