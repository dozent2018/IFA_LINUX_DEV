#!/bin/bash
# wait_demo.sh : Demo fork und wait
echo "Programm: $(basename $0) PID: $$"
date
./forked_script.sh &
wait
date
