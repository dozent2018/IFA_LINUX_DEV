#!/bin/bash
# papagei2.sh : liest eine Zeile und gibt sie wieder aus, bis ENDE eingegeben wird
while read -p "Erzähl mir was: " zeile
do
    if [ "$zeile" = "ENDE" ]
    then
        break
    fi
    echo $zeile
done
