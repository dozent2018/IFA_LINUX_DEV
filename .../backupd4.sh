#!/bin/bash     
# backupd4.sh   : Variante von backupd1.sh
#bash_version   :3.2.57(1)-release
#============================================================================

# Ist die Anzahl Parameter genau 1?
if [ $# != 1 ] 
then
	echo Benutzung: $0 Quellverzeichnis
	exit 1
fi

# Wenn BACKDIR nicht gesetzt ist, Defaultwert für zielpfad setzen
zielpfad=${BACKDIR:=.}
# Schrittweises Zusammensetzen der Variable ziel
# Verzeichnisnamen ohne Pfad ermitteln und in quellname speichern
# mit Kommandosubstitution
quellname=/`basename $1`
# Anhang für Verzeichnisnamen mit Kommandosubstitution
datum=`date +%Y_%m_%d`
ziel=$zielpfad$quellname.$datum

# Existiert ziel schon als Verzeichnis oder Datei
if [ -e $ziel ]
then
	echo $ziel existiert bereits, Abbruch
	exit 2
fi

# Die eigentliche Kopieraktion
cp -R $1  $ziel

# Nur jetzt wird 0 zurückgegeben
exit 0
