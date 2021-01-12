#!/bin/bash
# Lösungsvorschlag allerrors.sh
while getopts p: option
do
    case $option in
        p) echo -p
           log_filename=$OPTARG;;
        ?) echo unbekannte Option >&2
           exit 1
    esac
done
# Alle Fehlermeldungen in Datei umleiten
exec 2>> allerrors.log

# Alle normalen Ausgaben in die Logdatei umleiten, ABER
# trotzdem noch auf den Bildschim umleiten WTF????
# Prozess-Substitution ist das Stichwort >( kommnado )
exec >> >(tee $log_filename)

# korrektes Kommando:
ls *.sh

# Kommando mit fehlerausgabe:
ls djashDGKAJHSGDKjahsdgkajHSDGAK
