#!/bin/bash

ps -U frak -o pid,command #| sed -r 's/[[:space:]]*([[:digit:]]+)[[:space:]](.+)$/\1:\2/'
