#!/bin/bash
# existiert_datei.sh : Prüft die Existenz eines Verzeichniseintrags 
if [ -e $1 ]
then
    echo $1 existiert
    exit 0
fi
echo $1 existiert nicht
exit 1
