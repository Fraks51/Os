#!/bin/bash

touch v_tmp.txt
echo "" > v_tmp.txt
for procname in $(ls /proc/ | grep "[0-9]\+")
do
    statu="/proc/$procname/status"
    schedu="/proc/$procname/sched"
    if [[ -f $statu && -f $schedu ]]
    then
        ppid=$(grep -ihs "ppid" $statu | grep -o "[0-9]\+")
        avg=$(grep -ihs "se.avg.util_sum" $schedu | grep -o "[0-9]\+")
        echo "ProcessID="$procname" : Parent_ProcessID="$ppid" : Average_Sleeping_Time="$avg >> v_tmp.txt
    fi
done
sort -n -t "=" -k3 v_tmp.txt > v.txt
