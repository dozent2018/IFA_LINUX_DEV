#!/bin/bash
# trapdemo2.sh : fängt verschiedene Signale mit trap und einer Funktion ab

handler_function() {
        if (( count == 0 )); then
                echo Erstes Mal
                rm $tmpfile
                (( count ++ ))
        else
                echo Zweites Mal, Beenden
                exit
        fi
}
trap handler_function SIGINT SIGTERM
echo PID: $$
count=0
tmpfile=trapdemo$$
touch $tmpfile

while true; do
        # eine while-Schleife muss mindestens eine Anweisung enthalten
        # : ist die "leere Anweisung"
        :
done
