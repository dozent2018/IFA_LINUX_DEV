#!/bin/bash
# chkdf2_step1.sh : 1. Versuch zur Aufgabe chkdf2.sh

# Teil1: Config File chkdf.cfg lesen und assoziatives Array füllen
declare -A confarray
# Das File chkdf.cfg hat zwei Spalten: mountpoint und Schwellwert
while read key value
do
    # In key steht der mountpoint, in value der Schwellwert
    confarray[$key]=$value    
done < chkdf.cfg

# Teil2: for-schleife über alle Array-Keys
for mountpoint in ${!confarray[@]}
do
    # Erstmal nur testen, ob der Inhalt des Arrays stimmt
    echo Mountpoint: $mountpoint Schwellwert: ${confarray[$mountpoint]}
done
