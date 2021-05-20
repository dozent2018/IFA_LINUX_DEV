#!/bin/bash
# mkstruct1.sh :  Version mit globaler Variable
# nutzt eine Variable "KURSNAME" für den Kursnamen und den Speicherort

mkdir ${KURSNAME}
mkdir ${KURSNAME}/block1
mkdir ${KURSNAME}/block1/aufgaben
mkdir ${KURSNAME}/block1/loesungen
cp -R ${KURSNAME}/block1 ${KURSNAME}/block2
cp -R ${KURSNAME}/block1 ${KURSNAME}/block3
cp -R ${KURSNAME}/block1 ${KURSNAME}/block4
cp -R ${KURSNAME}/block1 ${KURSNAME}/block5



