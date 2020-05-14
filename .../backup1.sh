#!/bin/bash     
# backup1.sh    : Dateien mit Endung .png Als Optionsparameter werden Quell- und Zielverszeichnis übergeben
#bash_version   :3.2.57(1)-release
#============================================================================

while getopts s:t: option
do
    case $option in
        s) sourcedir=$OPTARG ;;
        t) targetdir=$OPTARG ;;
        ?) echo "usage: $(basename $0) -s quellverzeichnis -t zielverzeichnis" ;;
    esac
done

mkdir $targetdir 2>/dev/null 
if ! [ -w $targetdir ]
then
    echo "Keine Schreiberechtigung in $targetdir"
    exit 3
fi

for pfadname in $(find $sourcedir -name "*.png" -print)
do
    echo kopiere Datei: $pfadname nach $targetdir
    dateiname=$(basename $pfadname)
    cp $pfadname $targetdir/$dateiname
done
