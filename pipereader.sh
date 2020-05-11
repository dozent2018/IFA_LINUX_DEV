#!/bin/bash
# pipereader.sh liest aus named Pipe

while read word
do
    echo lese aus named pipe: $word
done < myFIFO
