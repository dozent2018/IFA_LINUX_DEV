 echo 'Mit "$*":'
 for argument  in "$*"; do
    echo "< $argument >"
 done; echo

 echo 'Mit "$@" :'
 for argument  in $*; do
    echo "< $argument >"
 done
