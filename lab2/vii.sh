#!/bin/bash

man bash | tr ' ' '\n' | sort | grep -E "...." | uniq -c | sort -n -r | head -n 4 | tr -d [:digit:] | tr -d " "
