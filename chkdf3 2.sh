# chkdf3.sh läuft im Hintergrund und führt in regelmässigen Zeitabständen eine
# Überprüfung aus, wie voll bestimmte Dateisysteme sind.
# Die Zeit zwischen den Prüfungen wird mit -i sekunden angegeben
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
# Die Optionen -i und -t schliessen sich gegenseitig aus

# Funktionen
usage() {
	# Alle Ausgaben auf stderr umlenken
	exec 1>&2

	echo "usage: $(basename $0) [ [-f file] [-d char] [-i seconds] ] | -t fixed_% "
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
	echo "       -i <seconds> sets elapsed time between repeated checks"
	echo "          Default interval is 3600 seconds (1 hour)"
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
	# Array muss gelöscht und als global angelegt werden, für den Fall dass
	# eine Zeile im Konfigurationsfile gelöscht wurde
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
			# echo ist bei Ausführung im Hintergrund nicht wirklich sinnvoll
			# In der Praxis sollte hier eher ein Mail oder ein SMS
			# geschickt werden, oder ein Pager angerufen werden
			timestamp=$(date):
			echo "$timestamp space usage of $mnt is higher than ${disks[$mnt]} %"
		fi
	done
}

# Das script reagiert auf das Signal 10 (SIGUSR1). Wenn es empfangen wird,
# soll die Konfigurationsdatei neu eingelesen werden. Beim nächsten Check
# gelten dann die geänderten Werte in der Konfigurationsdatei

# Default-Werte für diverse Variablen
file=./chkdf.cfg
f_mode=0
d_mode=0
t_mode=0
threshold=0
delimiter='='
interval=3600

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
		i) interval="$OPTARG"
		   if ! is_int "$interval"; then
		   	# Benutzer hat nach -i keine ganze Zahl angegeben
		   	usage
		   	exit 1
		   fi
		   i_mode=1
		   # wenn -t threshold angegeben wurde, ist -i zeitintervall
		   # nicht vorgesehen. Daher die folgende Überprüfung
		   if (( t_mode == 1 )); then
		   	usage
		   	exit 1
		   fi
		   ;;
		?) usage
		   exit 1
	esac
done
# Signal 10 (SIGUSR1) abfangen
# Die Funktions-Argumente müssen in "" stehen, damit delimiter wie '=',';'
# korrekt übernommen werden und Dateinamen mit Leerzeichen funktionieren
trap 'read_config "$file" "$delimiter"' SIGUSR1

# -t % angegeben: fester Schwellwert für alle Mountpoints, einmal aufrufen
if (( t_mode == 1 )); then
	check_all "$fixed_threshold"
	exit 0
fi

echo PID is $$
if ! [ -f "$file" ] || ! [ -r "$file" ]; then
	echo "file $file cannot be read" 1>&2
	usage
	exit 1
fi

read_config "$file" "$delimiter"

# Das script läuft ansonsten in einer Endlosschleife
while true; do
   check_configured
   sleep "$interval"
done
#
exit 0
