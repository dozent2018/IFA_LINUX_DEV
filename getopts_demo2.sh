#!/bin/bash       
# getopts_demo2 :  zeigt eine komplexere Verwendung von getopts
#    Bei Angabe der Option -i an erster Stelle sollen die anderen Optionen
#    nicht ausgewertet werden.
#    Aus der Hilfe zu getopts: "If the first character
#    of OPTSTRING is a colon, getopts uses silent error reporting.  In
#    this mode, no error messages are printed.  If an invalid option is
#    seen, getopts places the option character found into OPTARG.  If a
#    required argument is not found, getopts places a ':' into NAME and
#    sets OPTARG to the option character found.  If getopts is not in
#    silent mode, and an invalid option is seen, getopts places '?' into
#    NAME and unsets OPTARG.  If a required argument is not found, a '?'
#    is placed in NAME, OPTARG is unset, and a diagnostic message is
#    printed.
    


# der OPTSTRING beginnt mit ':' - silent mode, keine Fehlerausgaben
# ###########  OPTSTRING    NAME
while getopts  ":n:b:a:v:i" opt
do
    case $opt in
        i) interactive=yes
           echo ${OPTIND}
           # Break springt sofort aus der Schleife
           break
           ;;
        n) name=$OPTARG 
           ;;
        b) beschreibung=$OPTARG 
           ;;
        a) autor=$OPTARG 
           ;;
        v) version=$OPTARG 
           ;;
        :) # Wenn das Zusatzargument fehlt, ist der inhalt von opt : 
           # und der inhalt von OPTARG der alte Inhalt von opt
           echo "-$OPTARG benötigt ein zusätzliches Argument"
           exit 11
           ;;
        ?) # Wenn eine unbekannte Option angegeben wurde, ist der Inhalt von opt ?
           # und der alte Inhalt von opt befindet sich in OPTARG
           echo "Unbekannte Option -$OPTARG" 
           exit 10
           ;;
    esac
done

echo '$name: ' $name
echo '$beschreibung: ' $beschreibung
echo '$autor: ' $autor
echo '$version: ' $version
echo '$interactive: ' $interactive

