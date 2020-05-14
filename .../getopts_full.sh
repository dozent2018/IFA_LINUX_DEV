#!/bin/bash
# getopts_full.sh : zeigt eine komplexe Verwendung von getopts
# Funktion usage gibt eine Kurzbeschreibung aus
usage() {
	echo "USAGE: `basename $0` [-h] [-m <opt_arg>] [-l <opt_arg>] [-c] filename" >&2
}

# Beginnt der Options-String mit ':', wird der "silent mode" verwendet
# Es gibt keine Fehlerausgaben von getopts selbst und bei Fehlern wird
# folgendermassen verfahren:
# Bei unbekannten Optionen (Beispiel: -x) wird dann opt auf '?' gesetzt und
# OPTARG enthält dann den unbekannten Options-Buchstaben
# Wenn im Options-String nach einem Buchstaben ':' steht und danach keine
# Argument steht, wird opt auf ':' gesetzt und OPTARG enthält den 
# Options-Buchstaben, für den ein zusätzliches Argument erwartet wurde

while getopts :m:l:hc opt 
do
	case ${opt} in
		h) usage; exit 1;;
		m) opt_arg1="$OPTARG";;
		l) opt_arg2="$OPTARG";;
		c) nocolor=1;;
       	:) echo "Missing option argument for -$OPTARG" >&2; usage; exit 1;;
		?) echo "Unknown option -$OPTARG" >&2; usage; exit 1;;
  	esac
done

# Nach den Optionen kann es weitere Parameter geben
# OPTIND enthält die Anzahl der bisher mit getopts verarbeiteten
# Kommandozeilenparameter. Mit shift kann nun auf den ersten
# Parameter nach allen Optionen positioniert werden

let LASTARG_POS=$OPTIND-1
shift $LASTARG_POS
filename=$1

# Ausgabe der diversen gesetzen Variablenwerte
echo '$opt_arg1' ist $opt_arg1
echo '$opt_arg2' ist $opt_arg2
echo '$nocolor' ist $nocolor
echo '$filename' ist $filename
