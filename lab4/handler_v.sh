#!/bin/bash

this=1
Mode="+"
(tail -n 0 -f buffer.txt) |
while true
do
    read LINE
    case $LINE in 
            "QUIT")
                echo "exit"
                killall tail
                exit
                ;;
            "+")
                Mode="+"
                ;;
            "*")
                Mode="*"
                ;;
            *)
                echo "$this $Mode $LINE"
                if [[ $Mode == "+" ]] 
                then
                    this=$(($this + $LINE))
                else
                    this=$(($this * $LINE))
                fi
                echo "$this"
    esac
done
