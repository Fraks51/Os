#!/bin/bash
str='Start'
echo -e "1.$str vi\n2.$str nano\n3.$str links\n4.Exit"
while true 
do
    read command
    case $command in
        1)
            vi
            ;;
        2)
            nano
            ;;
        3)
            links
            ;;
        4)
            exit 0
            ;;
    esac
done
