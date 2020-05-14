#!/bin/bash     
# backupd3.sh : Variante von backupd1.sh
# bash_version   :3.2.57(1)-release
#============================================================================

# Wenn BACKDIR nicht gesetzt oder leer ist, wird als Default 
# für die Variable . genommen
zielpfad=${BACKDIR:=.}

# basename liefert den letzten Teil des Pfads in $1
# Kommandosubstitution wird benutzt
# Vor den Namen des Quellverzeichnisses wird / gesetzt
quellname=/`basename $1`

# Kommandosubstitution: Ausgabe von date
datum=`date +%Y_%m_%d`

zielname=$quellname.$datum

cp -R $1  $zielpfad$zielname

