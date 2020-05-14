#!/bin/bash     
# analyze-step3a : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
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
    # 2do : Wert der Spalten 15 (cpu idle %), 18 (Datum) und 19 (Uhrzeit)
    #       separat in Variablen speichern und auswerten.
    #       Hier wird es mit einem Array gelöst:
    
    # z_array bekommt alle  Spalten von zeile als Elemente zugewiesen
    z_array=($zeile)

    # Jetzt kann jede Spalte separat über den Array-Index angesprochen werden
    date=${z_array[17]}
    time=${z_array[18]} 
    value=${z_array[14]}

    # 2do : Vergleich der Zeitstempel der Zeilen und Bilden der Zeitdifferenz 
    #       in Sekunden. Ein einfacher Weg wäre, in der Schleife eine Zähler-Variable
    #       jeweils um 1 zu erhöhen, da die Zeitstempel in der Datei um 1 Sekunde
    #       auseinanderliegen
    let timestamp++
    echo $timestamp $value
done < $inputfile
