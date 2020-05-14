#!/bin/bash     
# sum_params.sh :Prüft, wieviele  Parameter übergeben wurden und summiert sie
#bash_version   :3.2.57(1)-release
#============================================================================

anzahl=$#
zaehler=0
summe=0

while [ $zaehler -lt $anzahl ]
do
    # Nur wenn $1 eine Zahl ist, wird summiert
    if [ $1 -eq $1 ]
    then
        let summe=$summe+$1
    fi
	let zaehler=$zaehler+1
	shift
done
echo $summe

