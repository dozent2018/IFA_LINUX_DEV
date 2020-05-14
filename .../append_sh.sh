#!/bin/bash
# append_sh.sh : another demonstration of a for loop, iterating over all file names
# without .sh extension. If it is a shell script and writable, the user is asked 
# if he wants to append the .sh extension
appends .sh extension to existing script file

for filename in *[!.][!s][!h]; do
    if file $filename | grep -q "shell script"; then
        if [ -w $filename -a -f $filename ]; then 
            read -p "rename $filename ${filename}.sh? (y/n)" answer
            if [[ $answer =~ ^[Yy].* ]]; then
                mv -i $filename ${filename}.sh
            fi
        else
            echo "$filename: no write permission or not a normal file" >&2
        fi
    fi
done
