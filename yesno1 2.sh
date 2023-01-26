#!/bin/bash
# yesno1.sh : Eingabeaufforderung, bis "Y", "y", "N" oder "n"  eingegeben wurde
#  Gibt aus, ob der Benutzer die Frage bejaht oder verneint hat.
# (echo "bejaht" oder echo "verneint")
# Verwendet wird read -p "Eingabeaufforderung" und eine while-Schleife

input=""

while [ "$input" != Y -a "$input" != y -a "$input" != N -a "$input" != n ]
do
    read -p "Wollen Sie es tun? (Y/N): " input
done

[ "$input" = Y -o "$input" = y ] && echo bejaht
[ "$input" = N -o "$input" = n ] && echo verneint
