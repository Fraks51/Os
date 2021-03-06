#!/bin/bash

restore=/home/frak/restore
if [[ ! -d "$restore" ]];
then
    mkdir $restore
fi

lastBackup=$(find /home/frak/Backup-* | grep -E "[0-9]{4}-[0-9]{2}-[0-9]{2}$" | sort -n | tail -n 1)"/"
            
for file in $(ls $lastBackup);
do
    if [ ! -z "$(echo $file | grep -E "*.[0-9]{4}-[0-9]{2}-[0-9]{2}")" ];
    then
        cp $lastBackup$file $restore$file
    fi
done
