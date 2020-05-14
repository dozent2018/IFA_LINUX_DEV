#!/bin/bash
# mkstruct3.sh : Version mit Positionsparameter
# nutzt den 1. Positionsparameter für den Kursnamen und den Speicherort
# und einen Default-Wert, falls er nicht angegeben wurde

kursdir=${1:-Kurs}
mkdir ${kursdir}
mkdir ${kursdir}/block1
mkdir ${kursdir}/block1/aufgaben
mkdir ${kursdir}/block1/loesungen
cp -R ${kursdir}/block1 ${kursdir}/block2
cp -R ${kursdir}/block1 ${kursdir}/block3
cp -R ${kursdir}/block1 ${kursdir}/block4
cp -R ${kursdir}/block1 ${kursdir}/block5



