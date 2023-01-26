#!/bin/bash
# mkstruct2.sh : Ausbau mkstruct mit Default-Wert
# nutzt eine Variable "KURSNAME" für den Kursnamen und den Speicherort
# und einen Default-Wert, falls die Variable nicht gesetzt ist

# Wenn KURSNAME leer ist, nehme den Default-Namen "Kurs"
KURSNAME=${KURSNAME:-Kurs}

mkdir ${KURSNAME}
mkdir ${KURSNAME}/block1
mkdir ${KURSNAME}/block1/aufgaben
mkdir ${KURSNAME}/block1/loesungen
cp -R ${KURSNAME}/block1 ${KURSNAME}/block2
cp -R ${KURSNAME}/block1 ${KURSNAME}/block3
cp -R ${KURSNAME}/block1 ${KURSNAME}/block4
cp -R ${KURSNAME}/block1 ${KURSNAME}/block5



