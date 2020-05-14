#!/bin/bash
# getopts_simple.sh : zeigt eine einfach Verwendung von getopts
while getopts abC: option 2>/dev/null; do
    case $option in
        a) echo "Option -a erkannt" ;;
        b) echo "Option -b erkannt" ;;
        C) echo "Option -C mit $OPTARG erkannt" ;;
        ?) echo "usage: $0 [-a] [-b] [-C argument]"
           break ;;
    esac
done
