#!/bin/bash

while true
do
    read LINE
    if [[ "$LINE" == "QUIT" ]]
    then
        echo "quiting generator ..."
        exit 
    fi
    echo "$LINE" >> buffer.txt
    if [[ ! "$LINE" =~ [0-9]+ && "$LINE" != "+" && "$LINE" != "*" ]]
    then
        echo "INCORRECT INPUT"
        exit 1
    fi
done
echo "QUIT" >> buffer.txt
