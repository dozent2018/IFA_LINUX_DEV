#!/bin/bash
# getopts_demo.sh : eine einfache Anwendung von getopts
while getopts abc:D: opt 2>/dev/null
do
    case $opt in
        a) echo "Option -a erkannt" ;;
        b) echo "Option -b erkannt" ;;
        c) echo "Option -c mit $OPTARG erkannt" ;;
        D) echo "Option -D mit $OPTARG erkannt" ;;
        ?) echo "Unbekannte Option" ;;
    esac
done
