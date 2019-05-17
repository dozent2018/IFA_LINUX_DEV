#!/bin/bash     
#title          :chkdf1 
#description    :Auswertung des Outputs von df -k, Alarm, wenn ein Schwellwert 
#                für den Füllungsgrad eines der Dateisysteme überschritten wurde
#author         :Jochen Reinholdt
#date           :20181123
#version        :1.0    
#usage          :./chkdf1
#notes          :       
#bash_version   :4.4.12(1)-release
#============================================================================


# Der Schwellwert in % wird dem Skript als einziger Parameter übergeben
schwellwert=$1

# Schleife über alle Zeilen in der Ausgabe des Kommandos
# df -k, %-Zeichen mit tr entfernt, Überschrift mit tail entfernt
# read akzeptiert mehrere Variablen. Bei Eingaben, die mehrere Wörter,
# getrennt durch Leerzeichen enthalten, werden diese Wörter der Reihe
# nach den Variablen hinter read zugewiesen
df -k --output=pcent,target | tr '%' ' ' | tail -n+2 | while read pct_full filesystem
do
    if [ $pct_full -ge $schwellwert ]
    then
        echo "Füllungsgrad von  $filesystem ist $pct_full Prozent"
    fi
done

