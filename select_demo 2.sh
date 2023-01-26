#!/bin/bash
# select_demo.sh : Demonstriert ein Menu mit select
PS3='Ihre Auswahl: '
select opt in "Brot" "Käse" "Schinken" "Beenden"
do
  case $opt in
    "Brot")     echo "Sie haben Nr. 1, $opt gewählt" ;;
    "Käse")     echo "Sie haben Nr. 2, $opt gewählt" ;;
    "Schinken") echo "Sie haben Nr. 3, $opt gewählt" ;;
    "Beenden")  break ;;
    *)          echo "Ungültige Auswahl: $REPLY"; continue ;;
  esac
done
