#!/bin/bash       
# mkscript.sh : Erzeugt einen "Kopf" mit Kommentarzeilen für ein neues Script und ruft Editor auf
# Version     : 1.0    
#===================================================================

today=$(date +%Y%m%d)
div="================================================================"

# Prüfen, ob 4 Argumente angegeben wurden
if [ $# -ne 4 ] ; then 
    echo "Verwendung: $0 dateiname kurzbeschreibung autor version." 
    echo "Bitte benutzen Sie \" \", um Leerzeichen zu maskieren."
    exit 1
fi

# Das 1. Argument ist der Skriptname
title=$1
# Das 2. Argument ist die Kurzbeschreibung
dscrp=$2
# Das 3. Argument ist der Autor
autor=$3
# Das 4. Argument ist die Version
version=$4

# Prüfen, ob bereits eine Datei gleichen Namens existiert
if [ -e $title ] ; then 
    echo "Die Datei $title existert bereits." 
    echo "Bitte wählen Sie einen anderen Namen."
    exit 2
fi

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
nano +8 $title
