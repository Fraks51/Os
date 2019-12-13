#!/bin/bash

ps -Ao pid,stime | tail -n +2 | sort -r -k2 | head -1 #| cut -d ' ' -f 3
