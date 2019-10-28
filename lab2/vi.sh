#!/bin/bash

sum=0
Files=""
for File in /var/log/*
do
    if [[ $File =~ \.log$ ]]
    then
         Files=$Files$File" "
    fi
done

wc -l $Files | tail -n 1 | cut -d ' ' -f 3
