#!/bin/bash
# countlines1.sh : liest die Zeilen einer Textdatei und gibt sie nummeriert aus
# am Ende wird die Anzahl Zeilen ausgegeben

echo Variante mit Eingabeumlenkung
datei=$1
num=0
while read zeile
do  
    (( num = num + 1 ))
    echo $num $zeile
done < $datei
echo $num Zeilen gelesen

echo Variante mit cat und Pipe
datei=$1
num=0
cat $datei | while read zeile
do  
    (( num = num + 1 ))
    echo $num $zeile
done 
# Überraschung?
echo $num Zeilen gelesen
