#!/bin/bash

ls -A /var/log | sed "s/  /\n/" > list.txt
last=$(head -1 list.txt)
tac list.txt > list2.txt
echo $last
