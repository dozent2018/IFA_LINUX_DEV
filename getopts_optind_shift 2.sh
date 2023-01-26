#!/bin/bash
# getopts_optind_shift.sh - Demonstriert getopts mit zusätzlichen Angaben
#
while getopts abC:p: option 2>/dev/null; do
    case $option in
        a) echo "Option -a erkannt" ;;
        b) echo "Option -b erkannt" ;;
        C) echo "Option -C mit $OPTARG erkannt" ;;
        p) echo "Option -p mit $OPTARG erkannt" ;;
        ?) echo "Unbekannte Option"; exit ;;
    esac
done

# Wie kann man weitere Angaben (z.B. Dateinamen) nach den Optionsbuchstaben angeben und im
# Script auswerten

# OPTIND enthält die Position nach dem letzten Optionsbuchstaben einschliesslich allfälliger
# Angaben, wenn ein Optionsbuchstabe mit : angegeben wurde
# Es soll shift $OPTIND -1 verwendet werden, um $1 und $@ auf die Position
# in der Kommandozeile zu setzen, die dahinter liegt
# Das funktioniert unabhängig von der Anzahl der angegebenen Optionsschalter

shift $(( OPTIND - 1))

echo Der erste Zusatzparameter ist: $1

for datei in $@
do
    echo $datei
done
