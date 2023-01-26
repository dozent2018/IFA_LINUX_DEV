#!/bin/bash
# fork_demo.sh : Demo fork mit &
echo "Programm: $(basename $0) PID: $$"
./forked_script.sh &
echo "Nach fork"
