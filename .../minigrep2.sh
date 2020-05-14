#!/bin/bash     
# minigrep2.sh : Fügt minigrep1 diverse Prüfungen hinzu
#                Exit-Code:
#				 0 : Suchbegriff gefunden
#                1 : Suchbegriff nicht gefunden
#                2 : Datei nicht gefunden
#                3 : Keine Leseberechtigung
#                4 : Keine Textdatei
#                5 : Anzahl Parameter != 2
#author         :Jochen Reinholdt
#date           :20180719
#version        :1.0    
#usage          :./minigrep2
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================
muster=$1
datei=$2
usage="usage: minigrep2 suchmuster datei"

# Korrekte Parameteranzahl?
if [ $# -ne 2 ] 
then
	echo $usage
	exit 5
fi

# Existiert die Datei?
if ! [ -f $datei ] 
then
	echo "Datei $datei nicht gefunden"
	exit 2
fi

# Hat der Benutzer Leserecht?
if ! [ -r $datei ] 
then
	echo "Kein Leserecht für die Datei $datei"
	exit 3
fi

# Ist es eine Textdatei?
if ! file $datei | grep -q text
then
	echo "Datei $datei ist keine Textdatei"
	exit 4
fi

# Wenn das Muster nicht gefunden wurde, soll der 
# Exit-Code 1 zurückggeben werden
exitcode=1

while read zeile 
do
    if [[ $zeile == *"$muster"* ]]
	then
		# Wenn das Muster gefunden wurde, soll der 
		# Exit-Code 0 zurückggeben werden
		exitcode=0
  		echo $zeile
    fi
done < $datei

exit $exitcode
