#!/bin/bash
read num
counter=1
while [ $(( $num % 2 )) -ne 0 ]
do 
    read num
    (( counter++ ))
done
echo "$counter"
