#!/bin/bash

ps -Ao pid,command | grep -E "[[:space:]]+/sbin" | cut -d "/" -f1
