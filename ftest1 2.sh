#!/bin/bash     
# ftest1.sh     : Demonstriert den Test von Funktionen
#bash_version   :3.2.57(1)-release
#============================================================================

# FNCPATH sollte in der Umgebung gesetzt werden, Default: ./lib
FNCPATH=${FNCPATH:-./lib}
source $FNCPATH/util_functions
source $FNCPATH/testutils
source $FNCPATH/math_functions
source $FNCPATH/file_functions

# Test utility-Funktionen

# testcase util-001: err_usage
# Variable usage_text ist nicht gesetzt
setup_test util-001 "" "usage: $(basename $0) No usage text set" 0 /etc/hosts
unset usage_text
test_filename=~/.bashrc
test_stdout=
test_stderr=$(err_usage 2>&1)
test_return=$?
report_test
exit

# test util-002: 
# 1. set_usage_text ohne Parameter 
test_output=$(set_usage)
# 2. err_usage ohne Parameter
test_output=$(err_usage)
set_usage_text
err_usage

# test util-003: set_usage_text und err_usag
set_usage_text "Vom Benutzer übergebener Text"
err_usage

usage_text="Variable usage_text im script gesetzt"
err_usage
set_usage_text

# Test mathe-Funktionen
is_int 100 && echo test m1 passed
is_int -1 &&   
is_int g || echo g ist keine ganze Zahl
is_int 6.5 || echo 6.5 ist keine ganze Zahl
is_int 6,5 || echo 6,5 ist keine ganze Zahl


# Test file-Funktionen
file_exists /etc/passwd && echo /etc/passwd existiert
file_exists /etc/garglebluzz || echo /etc/garglebluzz existiert nicht

