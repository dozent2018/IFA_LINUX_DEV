#!/bin/bash
# papagei1.sh : liest eine Zeile und gibt sie wieder aus, bis ENDE eingegeben wird
read -p "Erzähl mir was: " zeile

while [ "$zeile" != "ENDE" ]
do
    echo $zeile
    read -p "Erzähl mir was: " zeile
done
