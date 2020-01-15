#!/bin/bash

arg=$1
if [[ ! -d ~/.trash ]]
then
    touch ~/.trash.log
    mkdir ~/.trash
    touch ~/.trash/count
    echo 1 > ~/.trash/count
fi

num=$(cat ~/.trash/count)
ln $arg ~/.trash/$num
echo "link: //$num// path: //$PWD/$1//" >> ~/.trash.log
rm $1
(( num++ ))
echo $num > ~/.trash/count
