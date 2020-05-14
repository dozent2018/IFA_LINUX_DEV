#!/bin/bash
# vergleiche1.sh : Prüft die Parameter auf = > und > und ob sie überhaupt Zahlen enthalten
# Beschreibung: Eine komplette Lösung der Aufgabe 1.5
# Autor       : Jochen Reinholdt
# Version     : 1.0
# Datum       : 16.04.2019
# #######################################################

# hier werden zwei Prüfungen mit UND verknüpft:
# ist $1 eine ganze Zahl und $2 auch?
if [ $1 -eq $1 -a $2 -eq $2 ]
then
    if [ $1 -eq $2 ]
    then
        echo $1 und $2 sind gleich
    else
        if [ $1 -gt $2 ]
        then
            echo $1 ist grösser als $2
        else
            echo $1 ist kleiner als $2
        fi
    fi
    # Das Skript war erfogreich und gibt 0 zurück
    exit 0
else
    echo $1 und $2 können nicht verglichen werden
    echo Verwendung: vergleiche Zahl1 Zahl2
    # Das Skript war nicht erfogreich und gibt 1 zurück
    exit 1
fi
