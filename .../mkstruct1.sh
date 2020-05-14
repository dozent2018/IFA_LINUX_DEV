#!/bin/bash
# mkstruct1.sh :  Version mit globaler Variable
# nutzt eine Variable "kurs" für den Kursnamen und den Speicherort

mkdir ${kurs}
mkdir ${kurs}/block1
mkdir ${kurs}/block1/aufgaben
mkdir ${kurs}/block1/loesungen
cp -R ${kurs}/block1 ${kurs}/block2
cp -R ${kurs}/block1 ${kurs}/block3
cp -R ${kurs}/block1 ${kurs}/block4
cp -R ${kurs}/block1 ${kurs}/block5



