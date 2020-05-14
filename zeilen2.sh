#!/bin/bash
# zeilen2.sh : Variante von zeilen.sh mit cat und Pipe und einer Überraschung
# liest die Datei zeile für Zeile, gibt die Datei mit Zeilennummern aus
# Gibt die Anzahl Zeilen aus

nr=0
datei=$1
cat $datei | while read zeile
do
    let nr++
    echo $nr $zeile
done

# Überraschung?
echo $nr Zeilen gelesen

