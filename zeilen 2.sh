#!/bin/bash
# zeilen.sh : Liest Datei zeile für Zeile, gibt die Datei mit Zeilennummern und die Anzahl Zeilen aus

nr=0
datei=$1
while read zeile
do
    let nr++
    echo $nr $zeile
done < $datei

echo $nr Zeilen gelesen

