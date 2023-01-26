#!/bin/bash     
# countdown3.sh : Ausbau countdown2.sh
#description    :Zählt vom Wert in $1 auf 0 herunter und gibt dann Start! aus
#date           :20180619
#version        :1      
#notes          :Variante von countdown2 mit for-schleife
#		 gibt returncode zurück
#bash_version   :3.2.57(1)-release
#============================================================================

# Prüfung Anzahl Parameter = 1?
if [ $# -ne 1 ]
then
	echo Benutzung: $0 startwert
	exit 1
fi


# Prüfung Parameter eine Zahl?
# Prüfung auf numerische Gleichheit ergibt 
# immer einen Returcode !=0, wenn keine Zahl vorliegt
if ! [ $1 -eq $1 ] 2>/dev/null
then
	echo  $1 ist keine Zahl
	exit 2
fi

# Prüfung Startwert > 0?
if [ $1 -le 0 ]
then
	echo Startwert muss grösser als 0 sein
	exit 3
fi


startwert=$1
for ((i=startwert;i>=0;i--))
do
	echo $i
done

echo Start!
exit 0
