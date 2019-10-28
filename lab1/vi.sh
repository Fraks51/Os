#!/bin/bash
if [[ "$HOME" == "$PWD" ]]
then
    echo "$HOME"
    exit 0
else
    echo "error not home directory"
    exit 1
fi
