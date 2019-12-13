#!/bin/bash
echo $$ > pid_vii.txt
A=1
MODE="rabota"
OPER="+"
stop()
{
    MODE="ostanov"
}
usr1()
{  
    OPER="+"
}
usr2()
{  
    OPER="*"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'stop' SIGTERM
while true; do
    case $MODE in
            "rabota")
                case $OPER in
                    "+")
                        let A=$A+2
                        ;;
                    "*")
                        let A=$A*2
                        ;;
                esac
                echo $A
                ;;
            "ostanov")
                echo "Stopped by SIGTERM"
                exit
                ;;
    esac
    sleep 1
done
