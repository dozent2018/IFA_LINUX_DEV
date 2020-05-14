#!/bin/bash
# star_vs_at.sh : demonstriert die Unterschiede bei der
# Verwendung von $*, $@, "$*" und "$@"
#
 echo 'Mit $* :'
 for argument  in $*; do
    echo "< $argument >"
 done; echo

 echo -e 'Mit $@ :'
 for argument  in $*; do
    echo "< $argument >" 
 done; echo

 echo -e 'Mit "$*":'
 for argument  in "$*"; do
    echo -e "< $argument >" 
 done; echo

 echo '-e Mit "$@" :'
 for argument  in $*; do
    echo -e "< $argument >"
 done
