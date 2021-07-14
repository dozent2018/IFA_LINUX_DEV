#!/bin/bash
# lockfile.sh prüft, ob die Datei /tmp/locktest/lock existiert. Wenn nicht, legt es sie an.

# Wenn Sie existiert, prüft es, ob es in die Datei schreiben darf
#       Wenn Schreibrecht vorhanden ist:
#               Berechtigungen für  (-r--r--r--) setzen
#               Nachricht mit PID, Datum und Uhrzeit in /tmp/locktest/common schreiben
#               4 Sekunden warten
#               Anschliessend  Berechtigungen für /tmp/locktest/lock auf (-rw-rw-rw-) setzen
#       Wenn kein Schreibrecht vorhanden ist:
#               PID aus /tmp/locktest/lock lesen,
#               Meldung "Datei gesperrt durch <PID>" auf stderr ausgeben
#               5 Sekunden warten
# Erneuter Versuch Schreibrecht testen ....

# Hinweis: Das ganze in einer Schleife ausführen
# Zum Testen locktest.sh in 1-2 weiteren Terminals starten
# Dateien /tmp/locktest/lock und /tmp/locktest/common mit tail -f verfolgen

trap 'rm -f /tmp/locktest/lock' SIGINT

if ! [ -e /tmp/locktest/lock ]; then
        mkdir /tmp/locktest
        touch /tmp/locktest/lock
        chmod ugo+w /tmp/locktest/lock
fi

while true; do
        if [ -w /tmp/locktest/lock ];then
                echo $$ > /tmp/locktest/lock
                chmod ugo-w /tmp/locktest/lock
                echo $(date) $$ >> /tmp/locktest/common
                sleep 2
                chmod ugo+w /tmp/locktest/lock
        else
                lock_pid=$(cat /tmp/locktest/lock)
                echo "Datei gesperrt durch Prozess $lock_pid"
                sleep 5
        fi
done
