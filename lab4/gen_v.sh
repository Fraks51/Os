#!/bin/bash

while true
do
    read LINE
    if [[ "$LINE" == "QUIT" ]]
    then
        echo "quiting generatr ..."
        exit 
    fi
    echo "$LINE" >> buffer.txt
    if [[ ! "$LINE" =~ [0-9]+ && "$LINE" != "+" && "$LINE" != "*" ]]
    then
        echo "INCORRECT INPUT"
        echo "QUIT" >> buffer.txt
        exit 1
    fi
done
