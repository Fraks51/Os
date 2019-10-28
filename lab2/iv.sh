#!/bin/bash
cd /bin
strings=""
for FILE in * 
do
	if [[ -x "$FILE" ]] 
	then
        line=$(head -n 1 $FILE | sed -n '/^#!./p'| tr -d ' ')
        if [[ -n $line ]]
        then strings=$strings$line"\n"
        fi
	fi
done 
echo -e $(echo -e $strings | sort | uniq -c | sort -n -r | head -1 | tr -d [:digit:] | tr -d ' ')
