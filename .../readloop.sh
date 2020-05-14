#!/bin/bash
# readloop.sh : fragt wiederholt eine Benutzereingabe ab

input="" # Initialwert für input setzen

while true
do  
	read -p "Ihre Eingabe (Ende mit 'ende'): " input
    if [ "$input" = "ende" ]; then
        break
    fi
    echo "Ihre Eingabe: $input"
done
echo "Tschüss"

