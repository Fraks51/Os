#!/bin/bash
while true
do
    read LINE
    case $LINE in
        "+")
            kill -USR1 $(cat pid_vii.txt)
            exit 0
            ;;
        "*")
            kill -USR2 $(cat pid_vii.txt)
            exit 0
            ;;
        "TERM")
            kill -SIGTERM $(cat pid_vii.txt)
            exit 0
            ;;
        *)
            continue
            ;;
    esac
done
