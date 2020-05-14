#!/bin/bash
# delusers.sh : löscht $numusers  benutzer mit dem namen $prefix$nr 
# startet mit $startwith
# prüft, ob bereits ein user $prefix$startwith existiert, wenn nein, abbruch

prefix=$1
numusers=$2
startwith=$3
let endwith=$startwith+$numusers

for i in $(seq $startwith $endwith)
do
	username=$prefix$i
	# Gibt es den User in /etc/passwd?
	# Alternative: RC von id -u abfragen
	if getent passwd $username >/dev/null 2>&1
	then
		userdel --remove -f  $username
	else
		echo $username does not exist
	fi
done
