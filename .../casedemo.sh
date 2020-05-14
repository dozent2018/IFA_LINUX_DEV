#!/bin/bash
# casedemo.sh : Demonstration der case-Anweisung
while true
do
    read -p "Ja oder nein? " antwort
    case "$antwort" in
       [jJ] | [jJ][aA])         echo "Ja!"
                                exit 0 ;;
       [nN] | [nN][eE][iI][nN]) echo "Nein!"  
                                exit 1 ;;
       *)                       echo "Ja oder nein eingeben"
    esac
done
