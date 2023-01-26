#!/bin/bash     
# analyze-step3b.sh: Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
#date           :20181112
#version        :1.0    
#notes          :       
#bash_version   :4.4.12(1)-release
#============================================================================

# die Ausgabe von vmstat -n -t -S M 1 | tr -s " " wurde in einer Datei vmstat.log gespeichert

# Vorläufig wird der Dateiname fix codiert
# 2do : Variablen Dateinamen mit -f angeben
inputfile=vmstat.log
# Variable für die Zeit in Sekunden
timestamp=0;

# Die Zeilen der Datei lesen
while read zeile
do
    # z_array bekommt alle  Spalten von zeile als Elemente zugewiesen
    z_array=($zeile)

    # Jetzt kann jede Spalte separat über den Array-Index angesprochen werden
    date=${z_array[17]}
    time=${z_array[18]} 
    value=${z_array[14]}

    # 2do : Vergleich der Zeitstempel der Zeilen und Bilden der Zeitdifferenz 
    #       in Sekunden. Ein besserer Weg ist, die tatsächlich in der Datei
    #       angegebenen Zeiten in Sekunden umzuwandeln
    
    # Datums-String in Sekunden seit 01.01.1970 00:00:00 GMT umwandeln
    # Beispiel: date -d "2018-08-24 14:51:39" +%s ergibt:  1535115099
    datetime="$date $time"
    timestamp=$(date -d"$datetime" +%s)
    echo $timestamp $value
done < $inputfile
