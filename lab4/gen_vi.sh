#!/bin/bash
while true
do
    read LINE
    case $LINE in
        TERM)
            kill -SIGTERM $(cat pid_vi.txt)
            exit 0
            ;;
        *)
            continue
            ;;
    esac
done
