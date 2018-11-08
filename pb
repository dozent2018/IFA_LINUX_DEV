# hier wird /usr/bin/true verwendet. Das Kommando gibt immer 0 zurück 
if (( "$1"==true )) 2>/dev/null
then
    echo TRUE
else
    echo FALSE
fi
