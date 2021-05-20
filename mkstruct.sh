#!/bin/bash
# mkstruct.sh : Legt eine Verzeichnisstruktur für einen Kurs an
# mit Positionsparameter und Default-Werten
# für den Kursnamen und den Speicherort
# und einer Logdatei
# Prüfung, ob Schreibrecht besteht und
# ob schon ein Verzeichniseintrag mit gleichem Namen existiert

logline="$(date) mkstruct.sh $1 $2"
echo $logline >> mkstruct.log
path=${2:-$HOME}
name=${1:-Kurs}
KURSNAME=${path}/${name}

# Prüfen, ob Schreibrecht besteht
if ! [ -w $path ]
then
	echo "Kein Schreibrecht in $path - Abbruch" | tee -a mkstruct.log >&2
	exit 1
fi

# Prüfen, ob $KURSNAME schon existiert
if [ -e $KURSNAME ]
then
	echo "$KURSNAME existiert schon - Abbruch" | tee -a mkstruct.log >&2
	exit 2
fi

mkdir ${KURSNAME} | tee -a mkstruct.log  2>&1
mkdir ${KURSNAME}/block1
mkdir ${KURSNAME}/block1/aufgaben
mkdir ${KURSNAME}/block1/loesungen
cp -R ${KURSNAME}/block1 ${KURSNAME}/block2
cp -R ${KURSNAME}/block1 ${KURSNAME}/block3
cp -R ${KURSNAME}/block1 ${KURSNAME}/block4
cp -R ${KURSNAME}/block1 ${KURSNAME}/block5

exit 0


