#!/bin/bash
# mkstruct.sh
# mit Positionsparameter und Default-Werten
# für den Kursnamen und den Speicherort
# und einer Logdatei
# Prüfung, ob Schreibrecht besteht und
# ob schon ein Verzeichniseintrag mit gleichem Namen existiert

logline="$(date) mkstruct.sh $1 $2"
echo $logline >> mkstruct.log
path=${2:-$HOME}
name=${1:-Kurs}
kursdir=${path}/${name}

# Prüfen, ob Schreibrecht besteht
if ! [ -w $path ]
then
	echo "Kein Schreibrecht in $path - Abbruch" | tee -a mkstruct.log >&2
	exit 1
fi

# Prüfen, ob $kursdir schon existiert
if [ -e $kursdir ]
then
	echo "$kursdir existiert schon - Abbruch" | tee -a mkstruct.log >&2
	exit 2
fi

mkdir ${kursdir} | tee -a mkstruct.log  2>&1
mkdir ${kursdir}/block1
mkdir ${kursdir}/block1/aufgaben
mkdir ${kursdir}/block1/loesungen
cp -R ${kursdir}/block1 ${kursdir}/block2
cp -R ${kursdir}/block1 ${kursdir}/block3
cp -R ${kursdir}/block1 ${kursdir}/block4
cp -R ${kursdir}/block1 ${kursdir}/block5

exit 0


