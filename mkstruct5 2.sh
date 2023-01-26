#!/bin/bash
# mkstruct5.sh : Version mit Logdatei
# mit Positionsparameter und Default-Werten
# für den Kursnamen und den Speicherort
# und einer Logdatei

logline="$(date) mkstruct.sh $1 $2"
echo $logline >> mkstruct.log
path=${2:-$HOME}
name=${1:-Kurs}
kursdir=${path}/${name}


mkdir ${kursdir} | tee -a mkstruct.log  2>&1
mkdir ${kursdir}/block1
mkdir ${kursdir}/block1/aufgaben
mkdir ${kursdir}/block1/loesungen
cp -R ${kursdir}/block1 ${kursdir}/block2
cp -R ${kursdir}/block1 ${kursdir}/block3
cp -R ${kursdir}/block1 ${kursdir}/block4
cp -R ${kursdir}/block1 ${kursdir}/block5

