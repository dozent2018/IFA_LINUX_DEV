#!/bin/bash
# secondline.sh : Ausgabe der 2. Zeile der als Parameter angegebenen Dateien
for file in "$@"; 
do 
    line=$(sed -n '2p' <$file)
    descr=${line#*: *}
    printf "# %-20s : %s\n" "$file" "$descr"
done

