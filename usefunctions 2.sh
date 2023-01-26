#!/bin/bash
# usefunctions.sh : benutzt Funktionen aus zwei Bibliotheken
FNCPATH=/Users/jochenreinholdt/shellscripts/IFA_LINUX_DEV/functions
source ${FNCPATH}/file_functions
source ${FNCPATH}/math_functions

# is_int wird benutzt
if ! is_int "$1"
then
  echo "Usage: my.sh number folder" >&2
  exit 1
fi

# is_writable_dir  wird benutzt
if ! is_writable_dir "$2"
then
  echo "Cannot write to folder $2" >&2
  exit 2
fi
