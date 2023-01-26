#!/bin/bash
# zeilen1.sh : Variante von zeilen.sh
# liest die Datei zeile für Zeile, gibt die Datei mit Zeilennummern aus
# Gibt die Anzahl Zeilen aus

nr=0
datei=$1
while read zeile
do
    let nr++
    echo $nr $zeile
done < $datei

echo $nr Zeilen gelesen

