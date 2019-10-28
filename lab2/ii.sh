#!/bin/bash
touch full.log
grep -e "(WW)" /var/log/Xorg.0.log | sed 's/(WW)/Warning:/' > full.log
grep -e "(II)" /var/log/Xorg.0.log | sed 's/(II)/Information:/' >> full.log
cat full.log
