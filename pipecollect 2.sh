#!/bin/bash
# pipecollect : empfängt Textzeilen über eine named Pipe

# Named Pipe erzeugen
namedpipe=/tmp/pipecollect$$
echo $namedpipe
if !  mkfifo $namedpipe 
then
    echo "mkfifo $namedpipe failed. Abort" 1>2
    exit 1
fi

# 
cleanup () {
    echo "cleaning up $namedpipe"
    rm $namedpipe
    echo "exit on SIGTERM"
    exit 0
}

trap cleanup SIGTERM

echo "pipecollect.sh: collecting lines from $namedpipe"

while true
do
    read line < $namedpipe
    echo $line
done
