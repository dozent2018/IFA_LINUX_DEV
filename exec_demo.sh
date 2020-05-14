#!/bin/bash
# exec_demo.sh : Zeigt den Effekt von exec im Script
echo "Programm: $(basename $0) PID: $$"
exec ./execd_script.sh
echo "Nach exec"
