#!/bin/bash
# beersong.sh gibt soviele Strophen des Songs aus, wie Flaschen im Kühlschrank
# sind. Die Anzahl wird beim Aufruf als Parameter angegeben

if ! [ $1 -eq $1 ] 2>/dev/null; then
    echo "usage: $(basename $0) number-of-beer-bottles"
    exit 1
fi
  
anzahl=${1:-0}

while [ $anzahl -gt 0 ]
do
    if [ $anzahl -eq 1 ]; then
        echo $anzahl Flasche Bier im Kühlschrank
        echo $anzahl Flasche Bier 
        echo Nimm sie raus
    else
        echo $anzahl Flaschen Bier im Kühlschrank
        echo $anzahl Flaschen Bier 
        echo Nimm eine raus
    fi
    echo Trink sie aus
    let anzahl--
done
echo Der Kühlschrank ist leer ...
exit 0
