#!/bin/bash
# chkdf2.sh führt eine einmalige
# Überprüfung aus, wie voll bestimmte Dateisysteme sind.
# Beim Start wird optional eine Konfigurationsdatei mit –f dateiname übergeben.
# Ohne diese Angabe wird eine Datei chkdf.cfg im aktuellen Verzeichnis benutzt
# In der Kobfigurationsdatei  stehen die Mountpunkte, die überwacht werden sollen 
# und für jeden Mountpunkt ein Schwellwert in %, ab dem ein Alarm ausgegeben wird. 
# Mit –d trennzeichen kann das Trennzeichen auch anders gesetzt werden, 
# z.B. chkdf2.sh –d  ‘  ‘ für das Leerzeichen oder chkdf2.sh –d  ‘:‘ für den 
# Doppelpunkt. 
# Wenn kein anderes Trennzeichen angegeben wurde, soll das Gleicheitszeichen gelten.
# Bei der Ausführung werden nur die durch den Mountpunkt angegebenen Dateisysteme 
# untersucht
# Wenn keine Konfigurationsdatei angegeben wird, kann mit –t eine Prozentzahl 
# angegeben werden. Dann werden alle Dateisysteme auf die Überschreitung dieser Zahl 
# geprüft. Die Optionen -f und –t schliessen sich gegenseitig aus

# Funktionen
usage() {
	# Alle Ausgaben auf stderr umlenken
	exec 1>&2

	echo "usage: $(basename $0) [ [-f file] [-d char] ] | -t fixed_% "
	echo "       $(basename $0) -h displays help text"                             
}

is_int() {
	# Test, ob das 1. Argument eine ganze Zahl ist
	value=$1
	if [ "$value" -eq "$value" ] 2>/dev/null; then
		return 0
	else
		return 1
	fi
}

help() {
	usage
	echo "       -f <config_file> file with lines containing mountpoint<delimiter>percent"
	echo "          Default configuration file is ./chkdf.cfg"
	echo "       -d <character> sets delimiter in <config_file> to <character>"
	echo "          Default delimiter is '='"
	echo "       -t <threshold_in_%> sets a fixed threshold for all file systems"
	echo "          no configuration file is used when -t is specified"
}


check_all() {
	# Wenn -t prozent angegeben wurde, werden alle Mountpunkte
	# einmal gegen den festen Schwellwert $threshold geprüft, der
	# als 1. Parameter übergeben wird. Entspricht chkdf1.sh
        local threshold=$1
	df | awk 'NR>1 { print $5,$6 }' | tr -d '%' | while read pct mnt
	do
		if [ $pct -gt $threshold ]; then
			timestamp=$(date):
			echo "$timestamp space usage of $mnt is higher than $threshold %"
		fi
	done
}

read_config(){
	# Liest config-Datei in globales arrray ein
	# Dateiname wird als $1 übergeben
	# Trennzeichen wird als $2 übergeben
        local config_file=$1
        local delim_char=$2	
	# Array muss vorsichtshalber gelöscht und als global (-g) neu angelegt werden
	unset disks
	declare -g -A disks
	echo "Reading configuration file $config_file with delimiter $delim_char"
	IFS=$delim_char; while read key value garbage
	do
		if [ "$key" = "INTERVAL" ]; then
			# Falls eine Zeile mit INTERVAL beginnt
			# wird das nicht als Mountpoint behandelt
			interval=$value # Achtung, globale Variable wird in Funktion geändert!
		elif [ -z "$key" ] || [ -z "$value" ]; then
			# Leerzeilen oder unvollständige Zeilen ignorieren
			continue
		elif ! is_int $value; then
			# Format korrekt, aber value ist keine Ganzzahl
			echo "found invalid value $value in $config_file" 1>&2
		else
			# ansonsten ist es ein key/value Paar, ins Array aufnehmen
   			disks[$key]=$value
		fi	
	done <$config_file
}

check_configured() {
	# Wird aufgerufen, wenn ein Konfigurationsfile verwendet wurde
	# Mit read_config() das globale Array disks befüllen
	for mnt in ${!disks[@]}
	do
		actual_pct=$(df $mnt | awk 'NR>1 { print $5 }' | tr -d '%')
		if (( actual_pct > ${disks[$mnt]} ))
		then
			timestamp=$(date):
			echo "$timestamp space usage of $mnt is higher than ${disks[$mnt]} %"
		fi
	done
}

# Default-Werte für diverse Variablen
file=./chkdf.cfg
f_mode=0
d_mode=0
t_mode=0
threshold=0
delimiter='='

while getopts hf:d:t:i: option
do
	case $option in
		f) f_mode=1
		   if (( t_mode == 1 )); then
		      usage
		      exit 1
		   fi
		   file="$OPTARG"
		   ;;
		d) delimiter="$OPTARG"
		   d_mode=1
		   ;;
		t) t_mode=1
		   # -t prozent: fester Schwellenwert für alle Mountpoints
		   # bei -t threshold ist es nicht vorgesehen, gleichzeitig
		   # -f datei anzugeben. Auch -i sekunden ist dann nicht sinnvoll
		   if (( f_mode == 1 )) || (( i_mode == 1 )); then
		   	usage
		   	exit 1
		   fi
		   fixed_threshold="$OPTARG"
		   if ! is_int "$fixed_threshold"; then
		   	# Benutzer hat nach -t keine ganze Zahl angegeben
		   	usage
		   	exit 1
		   fi
		   ;;
		h) help
		   exit 0	
		   ;;
		?) usage
		   exit 1
	esac
done

# -t % angegeben: fester Schwellwert für alle Mountpoints, einmal aufrufen
if (( t_mode == 1 )); then
	check_all "$fixed_threshold"
	# Fertig
	exit 0
fi
# Wenn nicht mit -t prozent aufgerufen, wird die Konfiurationsdatei gebraucht
# Kann die Konfigurationsdatei gelesen werden?
if ! [ -f "$file" ] || ! [ -r "$file" ]; then
	echo "file $file cannot be read" 1>&2
	usage
	exit 1
fi
# Datei einlesen
read_config "$file" "$delimiter"
# Prüfung durchführen
check_configured
exit 0
