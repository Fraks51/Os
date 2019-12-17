#!/bin/bash

nowDate=$(date "+%F")
lastbackup=$(ls /home/frak/ -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -r -k2 | head -1)
if [[ -z $lastbackup ]]
then
    lastbackupInSec=0
else
    lastbackupInSec=$(date --date=$(echo $lastbackup | sed "s/^Backup-//") "+%s")
fi

let dateDiff=($(date "+%s")\-$lastbackupInSec)/86400
f=0
if [[ "$dateDiff" -le 7 ]]
then
    currentbackup="/home/frak/$lastbackup/"
else
    mkdir "/home/frak/Backup-"$nowDate
    currentbackup="/home/frak/Backup-"$nowDate"/"
    f=1
fi

if [[ "$f" == "0" ]]
then
    echo -e "Update backup: $nowDate. Name Update directory: $currentbackup" >> /home/frak/backup-report
    for file in $(ls /home/frak/source/ -1)
    do
        curFile=$currentbackup$file
        if [[ -f $curFile ]]
        then
            if [[ "$(stat /home/frak/source/$file -c %s)" != "$(stat $curFile -c %s)" ]]
            then
                line=""
                while [[ -f $curFile$line ]]
                do
                    line=$line"."$nowDate
                done
                mv $curFile $curFile$line
                cp /home/frak/source$file $curFile
                echo -e "$file is not actual now, made a new file: $file.$nowDate" >> /home/frak/backup-report
            fi
        else
            cp /home/frak/source/$file $curFile
            echo "Add new file: $file" >> /home/frak/backup-report
        fi
    done
  
else  
    echo -e "Backup created: "$nowDate" in work directory: /home/frak/source/ \nFiles copied:" >> /home/frak/backup-report
    for file in $(ls /home/frak/source/ -1)
    do
        cp /home/frak/source/$file $currentbackup$file
        echo $file >> /home/frak/backup-report
    done  
fi
