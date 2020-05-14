#!/bin/bash     
# chkdf2.sh : Ähnlich chkdf1.sh, mit Konfoigurationsfile und Optionen
#description    :Liest beim Start ein Konfigurationsfile ein, das jeweils einen 
#                Mountpunkt und einen Schwellenwert für den Füllungsgrad enthält. 
#                Format der Zeilen im Konfigurationsfile ist Mountpoint:Schwellenwert. 
#                Prüft dann in regelmässigen Zeitabständen mit df -k, ob der Schwellenwert 
#                für einen der Mountpunkte überschritten wurde und gibt in diesem Fall 
#                eine Meldung aus. Optionen: 
#                -f <Pfad zum Konfigurationsfile> 
#                -i <Zeit in Sekunden, nach der die Prüfung wiederholt wird>
#                -h Hilfetext ausgeben
#                Wenn keine Konfigurationsdatei angegeben wurde, wird die Datei 
#                chkdf.cfg im aktuellen Verzeichnis gesucht.
#                Ohne -i <Sekunden> wird die Prüfung nur einmal ausgeführt.
#date           :20180823
#version        :1.0    
#notes          :       
#bash_version   :4.4.12(1)-release
#============================================================================

config_file=chkdf.cfg
interval=0
declare -A config_array

usage() {
    command=`basename $0`
    echo "Benutzung: $command [-f Konfigurationsfile] [-i Zeitintervall_in_sec. ] [-h]" >&2
    echo "           Hilfe mit $command -h" >&2
}

help() {
    echo "######################################################################"
    usage
    echo "Überprüfung ob der Füllungsgrad ausgewählter Dateisysteme einen"
    echo "Schwellenwert überschreitet. Die zu Überprüfung vorgesehenen "
    echo "Dateisysteme  werden in einem Konfigurationsfile angegeben"
    echo "Das Konfigurationsfile enthält Zeilen in der Form "
    echo "Mountpoint Schwellenwert_in_%. "
    echo "Beispiel:"
    echo "    / 80"
    echo "    /home 65"
    echo "    /var 75"
    echo
    echo "Wenn keine Konfigurationsdatei angegeben wurde,"
    echo "wird die Datei chkdf.cfg im aktuellen Verzeichnis gesucht."
    echo
    echo "Das Zeitintervall nach -i ist die Zeit in Sekunden, die verstreicht,"
    echo "bevor eine erneute Prüfung stattfindet. Die Prüfung wird dann endlos"
    echo "wiederholt (Abbruch mit Control-C). Wird kein Intervall angegeben,"
    echo "wird die Prüfung nur einmal ausgeführt."
    echo "######################################################################"
}

read_config() {
    file=$1
    # Prüfung, ob das Konfigurationsfile existiert und lesbar ist
    if [ -f $file ] 2>/dev/null  && [ -r $file ] 2>/dev/null
    then
        # Einlesen der Konfigurationsdatei
        while read key value
        do
            config_array[$key]=$value
        done < $file
        # Erfolg
        return 0
    else
        # Fehlschlag
        return 1
    fi
}

is_int() {
    # Prüft, ob der übergebene Parameter eine ganze Zahl enthält
    if [ $1 -eq $1 ] 2>/dev/null
    then
        return 0
    else
        return 1
    fi
}

# Kommandozeilen-Optionen auswerten 
# Der 1. ':' bewirkt, das getopts keine Fehlermeldungen ausgibt. Die ':' nach den Options-
# buchstaben f und i bedeuten, dass dort ein weiteres Argument erwartet wird
while getopts :f:i:h opt 
do
    case $opt in
        f) config_file=$OPTARG 
           ;;
        i) interval=$OPTARG
           if ! is_int $OPTARG
           then
               usage
               exit 1 
           fi
           ;;
        h) help
           exit 0
           ;;
        :) # Wenn bei -f und -i kein zusätzliches Argument 
           # angegeben wurde, steht : in opt und der 
           # Optionsbuchstabe in OPTARG
           echo "Fehlendes Argument nach -$OPTARG" >&2
           usage
           exit 1
           ;;
        ?) usage
           exit 1
           ;;
    esac
done

# Lesen der Konfigurationsdatei (Default: chkdf.cfg im aktuellen Verzeichnis)
if ! read_config $config_file
then
    echo "Konfigurationsdatei konnte nicht gelesen werden"
    usage
    exit 1
fi
 
# Die Prüfung läuft in einer Endlosschleife. Abbruch mit ^C oder kill PID
while true
do
    # Schleife über alle Keys (= mountpoints) in config_array
    for mountpoint in ${!config_array[@]}
    do
        # df wird nur für jeweils einen mountpoint aufgerufen
        pct_full=$(df --output=pcent $mountpoint | tr -d '%' | tail -n+2)
        if [ $pct_full -gt ${config_array[$mountpoint]} ]
        then 
            echo "Alarm: $mountpoint ist zu $pct_full% voll. Schwellwert: ${config_array[$mountpoint]}"     
        fi
    done

    # Warten, bis die Zeit in $interval Sekunden abgelaufen ist
    sleep $interval

    # Wenn $interval den Wert 0 hat, wird die Schleife beendet
    if [ $interval -eq 0 ]
    then
        break
    fi
done

# Exit code 0 bei Erfolg
exit 0
