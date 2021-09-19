#!/bin/bash
# Zeigt, wie nach der getopts-Schleife weitere Argumente verarbeitet
# werden können, mittels shift und $OPTIND

while getopts ab: opt; do
  case $opt in
	  a) echo "-a" ;;
	  b) echo "-b mit $OPTARG" ;;
	  ?) echo "unbekannt" ;;
  esac
done
echo "Wert von OPTIND: $OPTIND"
shift $(($OPTIND - 1))
echo $@
