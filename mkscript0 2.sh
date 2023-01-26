#!/bin/bash       
# mkscript.sh : Erzeugt einen "Kopf" mit Kommentarzeilen für ein neues Script und ruft Editor auf
# Version     : 1.0    
#===================================================================

today=$(date +%Y%m%d)
div="================================================================"

# Das 1. Argument ist der Skriptname
title=$1
# Das 2. Argument ist die Kurzbeschreibung
dscrp=$2
# Das 3. Argument ist der Autor
autor=$3
# Das 4. Argument ist die Version
version=$4

echo "#!/bin/bash" > $title
echo "# Name        : $title" >> $title 
echo "# Beschreibung: $dscrp" >> $title 
echo "# Autor       : $autor" >> $title 
echo "# Version     : $version" >> $title 
echo "# Datum       : $today" >> $title
echo "# $div " >> $title
echo >> $title

# Datei ausführbar machen
chmod +x $title

# Datei im Editor öffnen und hinter den Kopf positionieren. Hier wird nano verwendet
vi +999999 $title
