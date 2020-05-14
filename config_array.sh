#!/bin/bash
# Name        : Aufgabe2-8
# Beschreibung: Analyse
# Autor       : Samuel Heeb
# Version     : 1.0
# Datum       : Mon Oct 28 18:51:35 UTC 2019
#===============================================================

#Function config auslesen
Filename="$0"
ConfigName="${Filename:2}.config"
. "$ConfigName"

#Optionen auslesen
while getopts 'v:' OPTION
do
        case "$OPTION" in
        v)
                input=($OPTARG)
                if [ -n $input ] && [ $input -eq $input ] && [ $input -lt 100 ] ; then
                        value="$OPTARG"
                else
                        value="20"
                fi
                break ;;
        *)
                value="20"
                break ;;
        esac
done

#Auswertung
df -k --output=pcent,target,source | tail -n +2 | tr -d % | while read spalte1 spalte2 spalte3
do
        #echo "spalte1 ist: $spalte1"
        #echo "spalte2 ist: $spalte2"

        for ((zahl=0; zahl <= ${#diskpath[@]}; zahl++))
        do
                if [ "$spalte3" = "${diskpath[zahl]}" ] ; then
                        if [ "$spalte1" -gt "${diskvalue[zahl]}" ] ; then
                                echo "F¸llgrad von $spalte2 ist mehr als ${diskvalue[zahl]}"
                        fi
                fi
        done

done

