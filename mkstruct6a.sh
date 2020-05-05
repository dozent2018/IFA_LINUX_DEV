#!/bin/bash
# mkstruct.sh, 1. Version
kursname=${1:-Kurs}
pfad=${2:-$HOME}
dir=${pfad}/${kursname}
datum=$(date)
echo "$datum name: $kursname pfad: $pfad" >> mkstruct.log
# echo '${dir} hat den Wert: ' "${dir}"
if mkdir ${dir} 2>/dev/null
then
	mkdir ${dir}/block1
	mkdir ${dir}/block1/aufgaben
	mkdir ${dir}/block1/loesungen
	cp -R ${dir}/block1 ${dir}/block2
	cp -R ${dir}/block1 ${dir}/block3
	cp -R ${dir}/block1 ${dir}/block4
	cp -R ${dir}/block1 ${dir}/block5
	exit 0
else
	echo Verzeichnis $dir konnte nicht angelegt werden 2>&
	exit 1
fi
