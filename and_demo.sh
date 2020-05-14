#!/bin/bash     
# and_demo.sh   : Demonstriert den gebrauch der UND-Verknüpfung mit -a oder &&
#bash_version   :3.2.57(1)-release
#============================================================================

file=$1

# Schreibweise 1 für AND mit -a verknüpfte Prüfungen in einem test
if [ -f $file -a -w $file ]
then
   echo "Datei $file: normale Datei mit Schreibrecht"
# Schreibweise 2 für AND mit 2 tests, mit && verknüpft
elif [ -d $file ] && [ -w $file ]
then
   echo "Datei $file: Verzeichnis mit Schreibrecht"
else
   echo "weder noch"
fi

