#!/bin/bash

touch iv.txt
echo "" > iv.txt
for procname in $(ls /proc/ | grep "[0-9]\+")
do
    if [ -f /proc/$procname/statm ]
    then
        a=$(cut -d " " -f2 /proc/$procname/statm)
        b=$(cut -d " " -f3 /proc/$procname/statm)
        let c=$a\-$b
        echo $procname:$c >> iv.txt
    fi
done
