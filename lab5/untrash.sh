#!/bin/bash
arg=$1
count=0
for i in $(grep $1 ~/.trash.log)
do
    if [[ $count -eq 1 ]]
    then
        link_name=$i
    fi
    
    if [[ $count -eq 3 ]]
    then
        echo $i
        echo "Do you want untrash file? (y/n)"
        read line
        case $line in
            y)
                path=$(echo $i | sed "s/\/$1//g")
                if [[ -d $path ]]
                then
                    ln ~/.trash/$link_name $i
                else
                    echo "direct deleted"
                    ln ~/.trash/$link_name ~/$1
                fi
                rm ~/.trash/$link_name
                ;;
            n)
                continue
                ;;
            *)
                echo "incorrect input, continue process"
                continue
                ;;
        esac
    fi
    (( count++ ))
done
