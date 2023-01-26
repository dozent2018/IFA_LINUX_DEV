#!/bin/bash
# filetypes.sh : for-Schleife über Parameter + tests auf verschiedene Dateitypen

for eintrag in "$@"
do
   [ -f $eintrag ] && echo "$eintrag: Reguläre Datei"
   [ -d $eintrag ] && echo "$eintrag: Verzeichnis"
   [ -b $eintrag ] && echo "$eintrag: Block Device"
   [ -c $eintrag ] && echo "$eintrag: Character Device"
   [ ! -e $eintrag ] && echo "$eintrag: nicht gefunden"
done

