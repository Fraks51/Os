#!/bin/bash

echo "" > vi.txt
max_proc=$(cat /proc/sys/kernel/pid_max)
for ((i=0; i <$max_proc; i++))
do
    all_num=$(grep -ihs "Parent_ProcessID=$i" v.txt | grep -o "[0-9]\+$")
    if [[ -n $all_num ]]
    then
        sum=0
        count=0
        for j in $all_num
        do
            let sum=$sum+$j
            (( count++ ))
        done
        let ans=$sum/$count
        grep -ihs "Parent_ProcessID=$i" v.txt >> vi.txt
        echo "Average_Sleeping_Children_of_ParentID=$i is $ans" >> vi.txt
    fi
done
