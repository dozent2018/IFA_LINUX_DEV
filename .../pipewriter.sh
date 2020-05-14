#!/bin/bash
# pipewriter.sh : schreibt in named Pipe

mkfifo myFIFO
for word in "$@"
do
    echo $word
done > myFIFO
