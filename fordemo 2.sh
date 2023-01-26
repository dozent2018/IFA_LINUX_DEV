#!/bin/bash
# fordemo.sh : zeigt ein weiteres Beispiel für for
anzahl=0
for dateiname in $(ls -A)
do
    cp $dateiname /tmp/backups/${dateiname}.bak && let anzahl=anzahl+1
done
echo $anzahl Dateien kopiert

