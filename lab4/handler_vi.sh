#!/bin/bash
echo $$ > pid_vi.txt
A=1
MODE="rabota"
stop()
{
    MODE="ostanov"
}
trap 'stop' SIGTERM
while true; do
    case $MODE in
            "rabota")
                let A=$A+1
                echo $A
                ;;
            "ostanov")
                echo "Stopped by SIGTERM"
                exit
                ;;
    esac
    sleep 1
done
