#!/bin/bash     
# chkdf1-variante2.sh : Variante zu chkdf1.sh
#description    :Auswertung des Outputs von df -k, Alarm, wenn ein Schwellwert 
#                für den Füllungsgrad eines der Dateisysteme überschritten wurde
#date           :20181123
#version        :1.0    
#notes          :Variante zu chkdf1 mit for-Schleife, awk und Bash-Parameterexpansion
#bash_version   :4.4.12(1)-release
#============================================================================


# Der Schwellwert in % wird dem Skript als einziger Parameter übergeben
schwellwert=$1

# Schleife über alle Zeilen in der Ausgabe des Kommandos
# df -k, die erste Zeile, das %-Zeichen und alle unerwünschten Spalten
# werden mit awk enfernt
for zeile in $(df -k | awk 'NR>1 {gsub("%",""); print $6 ":" $5 }')
do
    # ${VARIABLE#MUSTER} entfernt MUSTER vom Anfang des Textes in VARIABLE
    pct_full=${zeile#*:}
    # ${VARIABLE%MUSTER} entfernt MUSTER vom Ende des Textes in VARIABLE
    mountpoint=${zeile%:*}
    if [ $pct_full -ge $schwellwert ]
    then
        echo "Füllungsgrad von $mountpoint ist $pct_full Prozent"
    fi
done
