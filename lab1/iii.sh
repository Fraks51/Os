#!/bin/bash
read str
result=""
while [ "$str" != "q" ]
do
    result="$result$str"
    read str
done
echo "$result"
