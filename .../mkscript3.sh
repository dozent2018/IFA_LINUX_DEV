#!/bin/bash       
# mkscript3.sh : Ausbau von mkscript2.sh
# Beschreibung: Erzeugt einen "Kopf" für ein neues Script und ruft Editor auf
#               Wird als erstes Argument -i angegeben, werden der Skriptname,
#               die Beschreibung, der Autor und die Version abgefragt.
#               Wird das Argument -i nicht angegeben, werden diese Informationen
#               wie bei der 1. Version aus den Argumenten 1 bis 4 abgeleitet 
#               Mit -s <shell> kann eine andere Shell als die bash angegeben werden
#               Zusätztlich ist es möglich, einen absoluten Pfad anzugeben. 
#               Beispiel: mkscript /home/user1/sripts/scriptname "Ein Script" Ich 1.0
#               Die Skriptdatei wir dann im angegebenen Verzeichnis (/home/user/scripts)
#               angelegt.
# Version     : 2.0    
#===================================================================

today=$(date +%Y%m%d)
div="================================================================"

# Default-Werte setzen
interactive=no
shell=/bin/bash

while getopts :s:i opt 
do
    case $opt in
        i) interactive=yes
           ;;
        s) shell=$OPTARG 
           ;;
        :) echo "-$OPTARG benötigt ein zusätzliches Argument"
           exit 11
           ;;
        ?) echo "Unbekannte Option -$OPTARG" 
           exit 10
           ;;
    esac
done

# Positionieren auf den 1. Parameter nach den Optionen
shift $(( OPTIND - 1 ))

if [ "$interactive" == "yes" ]
then
	# interaktiver Modus
    # Angaben für den Kommentarkopf werden abgefragt
    echo -n "Skriptname       : " ; read -r file
    echo -n "Kurzbeschreibung : " ; read -r dscrp
    echo -n "Autor            : " ; read -r autor
    echo -n "Version          : " ; read -r version
else
	# Nicht-Interaktiver Modus, Angaben müssen über Kommandozeile
    # gemacht werden.
	# Prüfen, ob 4 Argumente angegeben wurden
	if [ $# -ne 4 ] ; then 
		echo "Verwendung: $0 dateiname kurzbeschreibung autor version." 
		echo "Bitte benutzen Sie \" \", um Leerzeichen zu maskieren."
		exit 1
	fi
	file=$1
	# Das 2. Argument ist die Kurzbeschreibung
	dscrp=$2
	# Das 3. Argument ist der Autor
	autor=$3
	# Das 4. Argument ist die Version
	version=$4
fi

# Das 1. Argument kann ein absoluter Pfad sein. Dann sind title und file nicht gleich
title=`basename $file`

# Prüfen, ob bereits eine Datei gleichen Namens existiert
if [ -e $file ] ; then 
    echo "Die Datei "$file" existert bereits." 
    echo "Bitte wählen Sie einen anderen Namen."
    exit 2
fi

# Inhalt in die Datei schreiben
echo "#!$shell" > $file
echo "# Name        : $title" >> $file 
echo "# Beschreibung: $dscrp" >> $file 
echo "# Autor       : $autor" >> $file 
echo "# Version     : $version" >> $file 
echo "# Datum       : $today" >> $file
echo "# $div " >> $file
echo >> $file


# Datei ausführbar machen
chmod +x $file

# Anzahl Zeilen datei ermitteln
lines=`wc -l $file | awk '{print $1}'`

echo
echo 'Wählen Sie einen Editor: '
PS3='Ihre Auswahl: '
select opt in "vi" "nano" "Abbruch"
do
    case $opt in
        "vi")
            vi +$lines $file
            break
            ;;
        "nano")
            nano +$lines $file
            break
            ;;
        "Abbruch" )
            break
            ;;
        *)  echo Unbekannte Option
            continue
            ;;
    esac
done
exit 0
