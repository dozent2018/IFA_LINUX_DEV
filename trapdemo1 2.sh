#!/bin/bash
# trapdemo1.sh : fängt verschiedene Signale mit trap ab
echo PID: $$

trap 'echo SIGHUP empfangen' SIGHUP
trap 'echo SIGINT empfangen' SIGINT
trap 'echo SIGKILL empfangen' SIGKILL
trap 'echo SIGTERM empfangen' SIGTERM
trap 'echo SIGCONT empfangen' SIGCONT
trap 'echo SIGSTOP empfangen' SIGSTOP
trap 'echo SIGTSTP empfangen' SIGTSTP

while true; do
:
done
